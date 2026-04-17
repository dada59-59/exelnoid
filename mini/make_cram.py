#!/usr/bin/env python3
"""
make_cram.py - Exelvision EXELMEMOIRE CRAM image generator

Builds a 16K CRAM image (0x8000-0xBFFF) from a raw program binary
assembled with .org $8004.

CRAM MEMORY MAP (derived from EXELMEMOIRE ROM disassembly):
  0x8000        : 0xAA  (magic byte 1, written at format)
  0x8001        : 0x8C  (magic byte 2, written at format)
  0x8002/0x8003 : entry point address (OS updates this after each load;
                  initially 0xE62A = OS service vector)
  0x8004+       : program code/data (first available code slot)
  ...
  0xBFCB-0xBFD0 : 6-byte default dir entry (init by OS from E79A table)
  0xBFDD/0xBFDE : directory pointer copy (-> 0xBFD0 when empty)
  0xBFDF/0xBFE0 : directory pointer (-> 0xBFD0 when empty)
  0xBFE1        : 0xAA  (also written alongside 0x8000)
  0xBFE3/0xBFE4 : next free code address (-> 0x8004 when empty)
  0xBFE5/0xBFE6 : CRC16 (computed over 0x8000-0xBFFF, skipping these 2 bytes)
  0xBFEB-0xBFFA : zeroed on format
  0xBFFB        : 5-byte file slot: entry_point HIGH
  0xBFFC        : 5-byte file slot: entry_point LOW
  0xBFFD        : 5-byte file slot: 0x00 (unused)
  0xBFFE        : 5-byte file slot: 0x00 (unused)
  0xBFFF        : 5-byte file slot: file type byte (0x01 = executable)

DIRECTORY ENTRY FORMAT (at 0xBFD0, growing downward):
  [BFD0]           : total_entry_size = name_len + 4
  [BFD0-1 ..]      : filename characters (up to 12, uppercase)
  [BFD0-name_len-1]: 0x2E '.'
  [BFD0-name_len-2]: 0x43 'C'
  [BFD0-name_len-3]: 0x4F 'O'
  [BFD0-name_len-4]: 0x4D 'M'

CRC ALGORITHM (from ROM routine at EF58):
  - Scans 0x8000-0xBFFF (16K), skipping 0xBFE5 and 0xBFE6
  - Custom XOR/rotate variant (see tms7000_crc() below)
  - 16-bit result stored big-endian at BFE5/BFE6

USAGE:
  python3 make_cram.py input.bin output.cram [--name MYNAME] [--entry-offset 0]

  input.bin    : raw binary assembled with .org $8004
  output.cram  : resulting 16K CRAM image
  --name       : filename shown in exelmemoire file manager (max 12 chars)
  --entry-offset: offset from 0x8004 for actual entry point (default 0)

RUNNING:
  From BASIC: CALL EXEC(32772)   (= 0x8004, direct jump to start of code)
  Or with offset: CALL EXEC(32772 + entry_offset)
"""

import sys
import argparse


# ---------------------------------------------------------------------------
# CRC algorithm - exact replication of EF58 ROM routine
# ---------------------------------------------------------------------------

def _rlc(val, carry_in):
    """Rotate left through carry (TMS7000 RLC instruction)."""
    carry_out = (val >> 7) & 1
    return ((val << 1) & 0xFF) | carry_in, carry_out

def _rrc(val, carry_in):
    """Rotate right through carry (TMS7000 RRC instruction)."""
    carry_out = val & 1
    return ((val >> 1) & 0x7F) | (carry_in << 7), carry_out

def tms7000_crc(data_16k):
    """
    Compute the EXELMEMOIRE CRC over a 16K CRAM image.
    data_16k : 16384-byte bytes/bytearray representing 0x8000-0xBFFF
    Returns  : (crc_high, crc_low) as ints 0-255
    """
    assert len(data_16k) == 0x4000, "data_16k must be exactly 16384 bytes"

    crc_hi = 0   # TEMP3-1 in ROM
    crc_lo = 0   # TEMP3   in ROM

    for i in range(0x4000):
        addr = 0x8000 + i
        if addr == 0xBFE5 or addr == 0xBFE6:
            continue

        byte = data_16k[i]

        # ROM 1F67-1F6D: XOR byte with crc_hi, rotate crc_lo into crc_hi
        A = byte ^ crc_hi
        crc_hi = crc_lo
        B = A
        A = 0

        # ROM 1F73-1F77: 8-bit loop: accumulate XOR of shifted-out bits
        carry = 0
        for _ in range(8):
            A = (A ^ B) & 0xFF
            B, carry = _rlc(B, carry)

        # ROM 1F78: crc_lo = accumulated result
        crc_lo = A

        # ROM 1F7A-1F7F: extract bit7 of crc_lo, XOR into crc_hi
        B = crc_lo
        A = 0
        B, carry = _rlc(B, 0)      # shift bit7 -> carry
        A, carry = _rlc(A, carry)  # carry -> A bit0
        crc_hi ^= A

        # ROM 1F82-1F8D: double RRC of crc_lo, XOR into both bytes
        B = 0
        A = crc_lo
        A, carry = _rrc(A, 0)
        B, carry = _rrc(B, carry)
        A, carry = _rrc(A, carry)
        B, carry = _rrc(B, carry)
        crc_lo ^= A
        crc_hi ^= B

    return crc_hi, crc_lo


# ---------------------------------------------------------------------------
# CRAM image builder
# ---------------------------------------------------------------------------

CRAM_SIZE    = 0x4000   # 16K
CRAM_BASE    = 0x8000
CODE_OFFSET  = 0x0004   # code starts at CRAM+4 (= address 0x8004)
MAX_CODE     = CRAM_SIZE - CODE_OFFSET - (0x4000 - 0x3F00)  # leave dir area free
MAX_FILENAME  = 12
MAX_CRAM_NAME = 12


def make_cram_image(program_binary, filename='EXELNOID', cram_name='EXELVISION',
                    entry_offset=0):
    """
    Build a 16K CRAM image ready to load into an EXELMEMOIRE emulator.

    program_binary : bytes assembled with .org $8004
    filename       : up to 12 chars - the file name shown in the file listing
    cram_name      : up to 12 chars - the CRAM volume name shown in listing header
                     and used when backing up to tape (e.g. 'EXELVISION')
    entry_offset   : offset from 0x8004 for the actual entry point

    Returns bytes of length 16384.
    CALL EXEC(0x8004 + entry_offset) to run from BASIC.
    """
    if len(program_binary) > 0x3F00 - CODE_OFFSET:
        raise ValueError(
            f"Program too large: {len(program_binary)} bytes, "
            f"max ~{0x3F00 - CODE_OFFSET}"
        )

    img = bytearray(CRAM_SIZE)  # zero-filled
    entry_point = CRAM_BASE + CODE_OFFSET + entry_offset  # e.g. 0x8004

    # --- Magic header ---
    img[0x0000] = 0xAA   # [8000] magic byte 1
    img[0x0001] = 0x8C   # [8001] magic byte 2
    img[0x0002] = (entry_point >> 8) & 0xFF  # [8002] entry hi
    img[0x0003] = entry_point & 0xFF          # [8003] entry lo

    # --- Code ---
    img[CODE_OFFSET : CODE_OFFSET + len(program_binary)] = program_binary
    next_free = CRAM_BASE + CODE_OFFSET + len(program_binary)

    # --- Magic copy at BFE1 (written by format alongside 8000) ---
    img[0x3FE1] = 0xAA

    # --- Directory pointer pair (BFDD/BFDE and BFDF/BFE0) -> 0xBFD0 ---
    img[0x3FDD] = 0xBF;  img[0x3FDE] = 0xD0   # BFDD/BFDE
    img[0x3FDF] = 0xBF;  img[0x3FE0] = 0xD0   # BFDF/BFE0

    # --- Next free code pointer at BFE3/BFE4 ---
    img[0x3FE3] = (next_free >> 8) & 0xFF
    img[0x3FE4] = next_free & 0xFF

    # --- Directory entry at BFD0 (offset 0x3FD0) ---
    #
    # Layout from EXELMEMOIRE ROM (DA00 / D7F5 / DB55):
    # KEY: RAMADR-1=R33 is the LOW byte of the addr pair; R32 is HIGH.
    #
    # BFD0: FLAGS = 0x82 (P=bit7, X=bit1 -> "PXS" in listing)
    # BFCF: 0x00  padding
    # BFCE: nav_lo  \  D7F5: R33(low of BFCC)=0xCC; B=0xFE+0xCC=0xCA(c=1)
    # BFCD: nav_hi  /         R32(high=TEMP10)=0xBF;  A=0xFF+0xBF+1=0xBF -> TEMP8=0xBFCA
    # BFCC: step_lo  \  DA00: non-zero=has entry; R33(low of BFCA)=0xCA;
    # BFCB: step_hi  /         B=0xF3+0xCA=0xBD(c=1), A=0xFF+0xBF+1=0xBF -> sentinel 0xBFBD
    # BFCA: SIZE = name_len  (DB55 uses as display char count)
    # BFC9 down: name chars, then '.COM' (4 bytes, stored but not displayed)
    #
    # Sentinel at 0xBFBD: image is zero-filled so [BFB9]=[BFB8]=0x00 -> end Z=1
    #
    # CRAM volume name at BFD1..BFDC (12 bytes, space-padded):
    #   listing reads LDA @BFCD(B) for B=4..0xF -> BFCD+4=BFD1..BFCD+F=BFDC

    name = filename[:MAX_FILENAME].upper()
    n    = len(name)
    base = 0x3FD0        # file offset of BFD0

    # FLAGS: 0x82 = P(bit7) + X(bit1) = executable program, sequential, no protect
    img[base]     = 0x82        # BFD0: FLAGS
    img[base - 1] = 0x00        # BFCF: padding
    img[base - 2] = 0xFE        # BFCE: nav_lo  \  D7F5: R33(low of BFCC)=0xCC;
    img[base - 3] = 0xFF        # BFCD: nav_hi  /  0xFE+0xCC=0xCA(c=1), 0xFF+0xBF+1=0xBF -> TEMP8=0xBFCA ✓
    img[base - 4] = 0xF3        # BFCC: step_lo  \  DA00: non-zero = has entry;
    img[base - 5] = 0xFF        # BFCB: step_hi  /  R33(low of BFCA)=0xCA;
                                #   0xF3+0xCA=0xBD(c=1), 0xFF+0xBF+1=0xBF -> sentinel 0xBFBD ✓
    img[base - 6] = n           # BFCA: SIZE = name_len only (DB55 display count)
    for j, ch in enumerate(name):
        img[base - 7 - j] = ord(ch)
    # .COM extension stored below name (type identifier, not shown in listing)
    img[base - 7 - n]     = 0x2E  # '.'
    img[base - 7 - n - 1] = 0x43  # 'C'
    img[base - 7 - n - 2] = 0x4F  # 'O'
    img[base - 7 - n - 3] = 0x4D  # 'M'

    # --- CRAM volume name at BFD1..BFDC (12 bytes, space-padded) ---
    # Displayed as "LIST DIRECTORY OF CRAM: <cram_name>"
    # Also used as tape label when backing up.
    vname = cram_name[:MAX_CRAM_NAME].upper().ljust(MAX_CRAM_NAME)
    for j, ch in enumerate(vname):
        img[0x3FD1 + j] = ord(ch)

    # --- 5-byte file slot at BFFB-BFFF ---
    # [BFFF] = file type (0x01 = executable)
    # [BFFE] = 0x00
    # [BFFD] = 0x00
    # [BFFC] = entry_point LOW
    # [BFFB] = entry_point HIGH
    img[0x3FFF] = 0x01
    img[0x3FFE] = 0x00
    img[0x3FFD] = 0x00
    img[0x3FFC] = entry_point & 0xFF
    img[0x3FFB] = (entry_point >> 8) & 0xFF

    # --- CRC (computed last, stored at BFE5/BFE6) ---
    crc_h, crc_l = tms7000_crc(img)
    img[0x3FE5] = crc_h
    img[0x3FE6] = crc_l

    return bytes(img)


# ---------------------------------------------------------------------------
# Verification helper
# ---------------------------------------------------------------------------

def verify_cram_image(data):
    """Check magic bytes and CRC of a 16K CRAM image. Returns list of issues."""
    issues = []
    if len(data) != CRAM_SIZE:
        issues.append(f"Size {len(data)} != 16384")
        return issues
    if data[0] != 0xAA:
        issues.append(f"[8000] = 0x{data[0]:02X}, expected 0xAA")
    if data[1] != 0x8C:
        issues.append(f"[8001] = 0x{data[1]:02X}, expected 0x8C")
    crc_h, crc_l = tms7000_crc(data)
    stored_h = data[0x3FE5]
    stored_l = data[0x3FE6]
    if crc_h != stored_h or crc_l != stored_l:
        issues.append(
            f"CRC mismatch: computed {crc_h:02X}{crc_l:02X}, "
            f"stored {stored_h:02X}{stored_l:02X}"
        )
    return issues


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Build an EXELMEMOIRE 16K CRAM image from a raw binary."
    )
    parser.add_argument("input",  help="Raw binary assembled with .org $8004")
    parser.add_argument("output", help="Output .cram file (16K image)")
    parser.add_argument("--name", default="EXELNOID",
                        help="File name in listing (max 12 chars, default: EXELNOID)")
    parser.add_argument("--cram-name", default="EXELVISION",
                        help="CRAM volume name in listing header and tape label (max 12 chars, default: EXELVISION)")
    parser.add_argument("--entry-offset", type=int, default=0,
                        help="Offset from 0x8004 for entry point (default 0)")
    args = parser.parse_args()

    with open(args.input, "rb") as f:
        prog = f.read()

    print(f"Input:       {args.input}  ({len(prog)} bytes)")
    print(f"File name:   {args.name[:MAX_FILENAME].upper()}")
    print(f"CRAM name:   {args.cram_name[:MAX_CRAM_NAME].upper()}")
    entry = 0x8004 + args.entry_offset
    print(f"Entry point: 0x{entry:04X}  ({entry} decimal)")
    print(f"BASIC launch: CALL EXEC({entry})")

    img = make_cram_image(prog, filename=args.name, cram_name=args.cram_name,
                          entry_offset=args.entry_offset)

    issues = verify_cram_image(img)
    if issues:
        print("WARNING: verification issues:")
        for iss in issues:
            print(f"  - {iss}")
    else:
        crc_h = img[0x3FE5]
        crc_l = img[0x3FE6]
        print(f"CRC OK:      {crc_h:02X} {crc_l:02X}")

    with open(args.output, "wb") as f:
        f.write(img)

    print(f"Output:      {args.output}  ({len(img)} bytes)")


if __name__ == "__main__":
    # Self-test when called without args (for quick sanity check)
    if len(sys.argv) == 1:
        print("Running self-test...")

        # Test 1: blank program (single RETS instruction = 0x0A)
        prog = bytes([0x0A])
        img = make_cram_image(prog, "TEST", "EXELVISION")
        assert img[0] == 0xAA and img[1] == 0x8C, "Magic bytes wrong"
        assert img[0x3FFF] == 0x01, "File type byte wrong"
        assert img[0x3FFC] == 0x04 and img[0x3FFB] == 0x80, "Entry point wrong"
        assert img[0x3FD0] == 0x82, "FLAGS wrong (should be 0x82)"
        assert img[0x3FCE] == 0xFE and img[0x3FCD] == 0xFF, "Nav bytes wrong"
        assert img[0x3FCC] == 0xF3 and img[0x3FCB] == 0xFF, "Step bytes wrong"
        assert img[0x3FCA] == 4, "SIZE wrong (should be name_len=4 for 'TEST')"
        assert img[0x3FC9] == ord('T'), "Name char wrong"
        # CRAM name: 'EXELVISION  ' at BFD1..BFDC
        assert img[0x3FD1] == ord('E') and img[0x3FD2] == ord('X'), "CRAM name wrong"
        issues = verify_cram_image(img)
        assert not issues, f"Verify failed: {issues}"
        print("  Test 1 (RETS): PASS")

        # Test 2: entry offset
        prog2 = bytes([0x00, 0x0A])  # NOP, RETS
        img2 = make_cram_image(prog2, "TEST2", entry_offset=1)
        assert img2[0x3FFC] == 0x05 and img2[0x3FFB] == 0x80, "Entry offset wrong"
        issues2 = verify_cram_image(img2)
        assert not issues2, f"Verify failed: {issues2}"
        print("  Test 2 (entry offset): PASS")

        # Test 3: CRC round-trip after modifying a byte
        img3 = bytearray(img)
        img3[0x0010] = 0xFF   # corrupt something
        # Recompute CRC
        crc_h, crc_l = tms7000_crc(img3)
        img3[0x3FE5] = crc_h
        img3[0x3FE6] = crc_l
        issues3 = verify_cram_image(bytes(img3))
        assert not issues3, f"Round-trip failed: {issues3}"
        print("  Test 3 (CRC round-trip): PASS")

        print("All tests passed.")
    else:
        main()