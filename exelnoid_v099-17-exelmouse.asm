; =========================================================================
; EXELNOID v2 - Constants & SRAM Map
; Paste this block at the very top of exelnoid_v2.asm, replacing whatever
; was there before (including the old .equ block if partially remaining).
; =========================================================================
#include "7020.equ"
#include "3556.equ"

; --- Screen / game area ---
SCREEN_BASE     .equ    $0500
SCREEN_W        .equ    320
SCREEN_H        .equ    250
BORDER_W        .equ    5
GAME_W          .equ    208
GAME_H          .equ    240
GAME_W_SEG      .equ    26          ; 208 / 8
GAME_X          .equ    8           ; game area starts at x=8
GAME_Y          .equ    5           ; game area starts at y=5
GAME_X_SEG      .equ    1           ; 8 / 8

; --- Border masks ---
BORDER_LEFT_SEG .equ    0
BORDER_RIGHT_SEG .equ  27
BL_MASK         .equ    $1F
BR_MASK         .equ    $F8
BL_MASK_TOP     .equ    $0F
BR_MASK_TOP     .equ    $F0
PAT_A           .equ    $AA
PAT_B           .equ    $55
BL_MASK_PAT_A   .equ    $1F
BL_MASK_PAT_B   .equ    $1B
BR_MASK_PAT_A   .equ    $F8
BR_MASK_PAT_B   .equ    $D8
BORDER_TOP_Y    .equ    0
BORDER_BOTTOM_Y .equ    245
BORDER_MID_SEGS .equ    26

; --- Ball ---
BALL_MAX_SEG    .equ    25
BALL_H          .equ    4
BALL_DRAW_H     .equ    8           ; draw_ball height (lines)
BALL_MID        .equ    2
BALL_DY_STEP    .equ    4
BALL_SUB_STEP   .equ    2
BALL_SPEED_EASY .equ    12
LIVES_EASY      .equ    10
LIVES_NORM      .equ    8
LIVES_HARD      .equ    5
BALL_SPEED_NORM .equ    6
BALL_SPEED_HARD .equ    4
BALL_SPEED_SLOW .equ    16
BALL_SPEED      .equ    12          ; default

; --- Paddle ---
PAD_SPEED       .equ    3           ; auto paddle: frames per step
PAD_SPEED_MAN   .equ    3           ; manual paddle: frames per step
PADDLE_W_BASE   .equ    4
PADDLE_W_WIDE   .equ    6
PADDLE_H        .equ    6
PADDLE_Y        .equ    215
PADDLE_MIN      .equ    0
PADDLE_MAX_BASE .equ    22
PADDLE_MAX_WIDE .equ    20

; --- Bricks ---
BRICK_W         .equ    2
BRICK_H         .equ    8
BRICK_PITCH     .equ    10
BRICK_START_Y   .equ    20
BRICK_COLS      .equ    13
BRICK_ROWS      .equ    4
BRICK_TOTAL     .equ    52
BRICK_TOTAL_MAX .equ    234         ; 18 rows × 13 cols
BRICK_END_Y     .equ    BRICK_START_Y + BRICK_ROWS * BRICK_PITCH
BRICK_COLOR_POWER  .equ  5
BRICK_COLOR_ARMOR  .equ  8            ; 2-hit brick, full health
BRICK_COLOR_ARMOR2 .equ  9            ; 2-hit brick, 1 hit taken
BRICK_COLOR_INDES  .equ  10           ; indestructible brick
BRICK_COLOR_EXPLO  .equ  11           ; explosive brick (hazard stripe)

; --- Powerups ---
POWER_BRICK_COUNT .equ  8
POWER_FALL_SPEED  .equ  2
POWER_TYPE_SLOW   .equ  1
POWER_TYPE_WIDE   .equ  2
POWER_TYPE_FIRE   .equ  4
POWER_TYPE_LIFE   .equ  5

; --- Cannon / fire ---
CANNON_BASE     .equ    $38
CANNON_TIP      .equ    $10
CANNON_MSK      .equ    $18
FIRE_STEP       .equ    2
FIRE_H          .equ    2
FIRE_MSK        .equ    $18
FIRE_SPD        .equ    1

; --- Keys ---
KEY_A_UP        .equ    $41
KEY_A_LO        .equ    $61
KEY_Z_UP        .equ    $5A
KEY_Z_LO        .equ    $7A
KEY_ARR_LEFT    .equ    $83         ; left arrow  (KEYLF=131)
KEY_ARR_RIGHT   .equ    $81         ; right arrow (KEYRI=129)
KEY_SPACE       .equ    $20
KONAMI_LEN      .equ    10
; --- Level Editor keys ---
KEY_ED_UP_U     .equ    $49         ; 'I' up
KEY_ED_UP_L     .equ    $69         ; 'i'
KEY_ED_DN_U     .equ    $4B         ; 'K' down
KEY_ED_DN_L     .equ    $6B         ; 'k'
KEY_ED_LF_U     .equ    $4A         ; 'J' left
KEY_ED_LF_L     .equ    $6A         ; 'j'
KEY_ED_RT_U     .equ    $4C         ; 'L' right
KEY_ED_RT_L     .equ    $6C         ; 'l'
KEY_ED_NXT_U    .equ    $4E         ; 'N' next level
KEY_ED_NXT_L    .equ    $6E         ; 'n'
KEY_ED_SAV_U    .equ    $53         ; 'S' save
KEY_ED_SAV_L    .equ    $73         ; 's'
KEY_ED_QUI_U    .equ    $51         ; 'Q' quit
KEY_ED_QUI_L    .equ    $71         ; 'q'
KEY_ED_YES_U    .equ    $59         ; 'Y' yes confirm
KEY_ED_YES_L    .equ    $79         ; 'y'
KEY_ED_CLR      .equ    $2E         ; '.' clear brick
KEY_ED_ENTER    .equ    $0D         ; Enter (also clears)
KEY_ARROW_UP    .equ    $80         ; arrow up
KEY_ARROW_RT    .equ    $81         ; arrow right
KEY_ARROW_DN    .equ    $82         ; arrow down
KEY_ARROW_LF    .equ    $83         ; arrow left
KEY_NO_KEY_EXL  .equ    $86         ; EXL100  no-key idle
KEY_NO_KEY_EXT  .equ    $89         ; EXELTEL no-key idle
ED_BLINK_RATE   .equ    20          ; cursor blink period (frames)
ED_COLS         .equ    13
ED_MAX_ROWS     .equ    18
ED_MAX_ROWS_M1  .equ    17          ; ED_MAX_ROWS - 1
ED_GRID_SIZE    .equ    234         ; 18*13
ED_NUM_LEVELS   .equ    5
ED_PANEL_SEG    .equ    28          ; right panel start segment
ED_KEY_RATE     .equ    5
ED_KEY_FIRST    .equ    12          ; frames before first auto-repeat           ; frames between auto-repeat moves
BRICK_ROWS_MAX  .equ    18          ; full 18-row gameplay area

; --- HUD layout ---
RIGHT_EDGE_SEG  .equ    39
SCORE_X_SEG     .equ    28
SPEED_X_SEG     .equ    34
LIVES_X_SEG     .equ    34
LEVEL_X_SEG     .equ    34
SCORE_LABEL_X_SEG   .equ 35
VITESSE_LABEL_X_SEG .equ 33
VIES_LABEL_X_SEG    .equ 36
LEVEL_LABEL_X_SEG   .equ 34
SCORE_Y         .equ    225
SCORE_DIGITS    .equ    4
SCORE_STEP_SEG  .equ    3
SCORE_H         .equ    20
SCORE_LABEL_Y   .equ    SCORE_Y-10
LABEL_H         .equ    12
LABEL_STEP_SEG  .equ    2
SPEED_Y         .equ    145
SPEED_LABEL_Y   .equ    SPEED_Y-10
LABEL_SIMPLE_H  .equ    7
LABEL_SIMPLE_STEP .equ  1
LIVES_Y         .equ    185
LIVES_LABEL_Y   .equ    LIVES_Y-10
LEVEL_Y         .equ    105
LEVEL_LABEL_Y   .equ    LEVEL_Y-10
GAME_OVER_X_SEG .equ    9
GAME_OVER_Y     .equ    120
GAME_OVER_SEGS  .equ    10
PAUSE_X_SEG     .equ    28          ; right HUD panel — no overlap with game bricks
PAUSE_Y         .equ    65
PAUSE_SEGS      .equ    10

; --- Intro (if intro code is present in v2) ---
TITLE_W_SEG     .equ    15
TITLE_H         .equ    93
TITLE_X_SEG     .equ    12
TITLE_Y         .equ    12
TEXT_START_X_SEG .equ   2
TEXT_START_Y    .equ    106
TEXT_STEP       .equ    8
TEXT_DELAY      .equ    24
TEXT_LINES      .equ    17
STAR_COUNT      .equ    24
FRAME_DLY       .equ    $04

; --- Debug ---
DBG_COL_Y       .equ    40
DBG_ROW_Y       .equ    50
DBG_SEG_START   .equ    28
DBG_SEG_LEN     .equ    12
DBG_SEG_LENP1   .equ    13

; ============================================================================
; SRAM VARIABLE MAP  (no overlaps - fixed layout)
; $C330        : snd_priority  (system)
; $C400-$C41F  : game loop temps / intro state
; $C420-$C46D  : bricks[78]       (6 rows * 13 cols)
; $C46E-$C4BB  : power_map[78]    (right after bricks, NO overlap)
; $C4BC-$C4CF  : gameplay vars    (ball_speed, paddle, power, bullets)
; $C4D0-$C4EF  : HUD / score vars
; $C4F0-$C4FF  : level management
; ============================================================================

snd_priority    .equ    $C330

; Game physics temps
paddle_x        .equ    $C400
paddle_x_old    .equ    $C4E3       ; previous frame paddle_x (for velocity)
; ball_dx_bias: signed bias -3..+3 stored as 0..6 (4=neutral)
ball_dx_bias    .equ    $C4E4       ; 0=hard-left 3=left 4=straight 5=right 7=hard-right
ball_seg        .equ    $C401
ball_y          .equ    $C402
ball_dx         .equ    $C403
ball_dy         .equ    $C404
ball_tmr        .equ    $C405
pad_tmr         .equ    $C406       ; auto paddle timer
pad_tmr_man     .equ    $C4E5       ; manual paddle timer
ball_active     .equ    $C407
brick_count     .equ    $C408
cur_y           .equ    $C409
line_cnt        .equ    $C40A
loop_i          .equ    $C40B
loop_j          .equ    $C40C
brick_idx       .equ    $C40D
tmp1            .equ    $C40E
tmp2            .equ    $C40F
hit_defer       .equ    $C410
hit_pending     .equ    $C411
hit_row         .equ    $C412
hit_col         .equ    $C413
ball_seg_old    .equ    $C414
probe_hit       .equ    $C415
ball_y_old      .equ    $C416
tmp3            .equ    $C417
char_buf        .equ    $C418

; Intro-specific (alias same slots)
key_last        .equ    $C40A
key_cur         .equ    $C40B
text_line_idx   .equ    $C40C
text_char_idx   .equ    $C40D
text_delay      .equ    $C4FA       ; was $C40E - moved: tmp1 collision
text_done       .equ    $C4FB       ; was $C40F - moved: tmp2 collision
lpc_ctr_lo      .equ    $C410
lpc_ctr_hi      .equ    $C411
story_ptr_lo    .equ    $C412
story_ptr_hi    .equ    $C413
line_cur_seg    .equ    $C414
menu_shown      .equ    $C415
text_x_seg      .equ    $C407       ; intro: current X segment (aliases ball_active)
text_y          .equ    $C408       ; intro: current Y line   (aliases brick_count)

; Brick array: 78 bytes (6 rows * 13 cols), 0=dead 1-5=color
bricks          .equ    $C500       ; same as ed_grid0: game/editor mutually exclusive

; Power-up map: 78 bytes parallel, 0=none 1-5=type
ed_l0_dirty     .equ    $C7CD       ; 1 = bricks/ed_grid0 clobbered by level1/2 advancement
MOUSE_SWI       .equ    $C7FD       ; stub (mouse removed)
mouse_enabled   .equ    $C7EB       ; 1 = mouse polling active
mouse_btn_old   .equ    $C7EC       ; raw P49 pass-1 byte (written by patched driver)
mouse_btn_latch .equ    $C7ED       ; button edge-detect latch
MOUSE_DRV_ADDR  .equ    $C6D4       ; patched ROM routine copied here (overlaps ed_grid2)
cram_loaded     .equ    $C7D0
cram_l1_hi      .equ    $C7D1
cram_l1_lo      .equ    $C7D2
cram_l2_hi      .equ    $C7D3
cram_l2_lo      .equ    $C7D4
cram_l3_hi      .equ    $C7D5
cram_l3_lo      .equ    $C7D6
cram_l4_hi      .equ    $C7D7
cram_l4_lo      .equ    $C7D8
cram_l5_hi      .equ    $C7D9
cram_l5_lo      .equ    $C7DA
CRAM_START_HI   .equ    $BF
CRAM_START_LO   .equ    $FF
CRAM_SCAN_END   .equ    $80
no_brick_tmr    .equ    $C5EA       ; frames since last brick destroyed (safe: ed_grid1 unused)
ball_flat_tmr   .equ    $C5EB       ; >0: skip dy step (shallower angle from fast paddle)
power_map       .equ    $C5EA       ; overlaps ed_grid1: safe because copy runs before clear

; Mouse driver constants
MOUSE_DELTX     .equ    $C7FE       ; X delta: >128=right <128=left 0=none
MOUSE_DELTY     .equ    $C7FF       ; Y delta (unused in paddle game)
port_buf        .equ    $C440       ; 20-byte string buffer for port display
ms_call_hi      .equ    $08         ; R8: hi byte of driver call ptr
ms_call_lo      .equ    $09         ; R9: lo byte of driver call ptr

; Gameplay vars  (FIXED: no longer inside bricks[] or power_map[])
ball_speed      .equ    $C4BC
paddle_w        .equ    $C4BD
paddle_max      .equ    $C4BE
paddle_bytes    .equ    $C4BF
power_active    .equ    $C4C0
power_tmr       .equ    $C4C1
power_seg       .equ    $C4C2
power_y         .equ    $C4C3
power_type      .equ    $C4C4
rand_seed       .equ    $C4C6
fire_active     .equ    $C4C8
bullet_tmr      .equ    $C4C9
bullet1_seg     .equ    $C4CA
bullet1_y       .equ    $C4CB
bullet2_seg     .equ    $C4CC
bullet2_y       .equ    $C4CD
active_power    .equ    $C4CE

; HUD / score vars  (FIXED: no longer inside power_map[])
score_d0        .equ    $C4D0
score_d1        .equ    $C4D1
score_d2        .equ    $C4D2
score_d3        .equ    $C4D3
score_digit     .equ    $C4D4
score_xseg      .equ    $C4D5
lives_d0        .equ    $C4D6
lives_d1        .equ    $C4D7
label_y         .equ    $C4D8
digit_y         .equ    $C4D9
game_over       .equ    $C4DA
paused          .equ    $C4DB
pause_latch     .equ    $C4DC
konami_idx      .equ    $C4CF
pad_hit_cnt     .equ    $C4C5
speed_tens      .equ    $C4DD
speed_units     .equ    $C4DE
level_d0        .equ    $C4DF
level_d1        .equ    $C4E0
auto_mode       .equ    $C4E1
difficulty      .equ    $C4E2

; Level management
current_level      .equ    $C4F0
current_brick_rows .equ    $C4F3
tmp_lev_hi         .equ    $C4F4
tmp_lev_lo         .equ    $C4F5
brick_end_y        .equ    $C4F6       ; dynamic: BRICK_START_Y + rows*BRICK_PITCH
tmp_rb_idx         .equ    $C4F7       ; rainbow draw line counter
eb_row             .equ    $C4F8       ; explode_brick: saved row
eb_col             .equ    $C4F9       ; explode_brick: saved col
cps_sv1            .equ    $C4FC       ; calc_paddle_spin: saved tmp1
cps_sv2            .equ    $C4FD       ; calc_paddle_spin: saved tmp2
cps_sv3            .equ    $C4FE       ; calc_paddle_spin: saved tmp3
; --- Level editor SRAM (volatile, session-only) ---
; ed_grid[0]: $C500-$C5E9  (18*13=234 bytes, level 0)
; ed_grid[1]: $C5EA-$C6D3  (level 1)
; ed_grid[2]: $C6D4-$C7BD  (level 2)
ed_grid0           .equ    $C500       ; same address as bricks (editor and gameplay are mutually exclusive)
ed_grid1           .equ    $C5EA
ed_grid2           .equ    $C6D4
ed_rows0           .equ    $C7BE       ; row count for edited level 0
ed_rows1           .equ    $C7BF
ed_rows2           .equ    $C7C0
ed_level           .equ    $C7C1       ; which level currently editing (0-2)
ed_cursor_row      .equ    $C7C2       ; cursor row (0..ed_rowsX-1)
ed_cursor_col      .equ    $C7C3       ; cursor col (0..12)
ed_saved           .equ    $C7C4       ; 1=all saved, 0=dirty
ed_blink           .equ    $C7C5       ; blink countdown
ed_blink_state     .equ    $C7C6       ; 0=brick drawn, 1=cursor drawn
ed_quit_ask        .equ    $C7C7       ; 1=showing quit confirm
ed_tmp_row         .equ    $C7C8       ; editor temp
ed_tmp_col         .equ    $C7C9       ; editor temp
ed_grid_ptr_hi     .equ    $C7CA       ; pointer to current grid (hi)
ed_grid_ptr_lo     .equ    $C7CB       ; pointer to current grid (lo)
ed_key_tmr         .equ    $C7CC       ; auto-repeat move timer


        .org    $1000

start:
        dint
        mov     %$58,B
        ldsp
        movp    P40,A
        movp    P36,A

        ; VDP init
        lda     @init_screen
        mov     A,TEMP1
        clr     B
is_lp:
        lda     @init_screen+1(B)
        movp    A,P45
        inc     B
        cmp     TEMP1,B
        jne     @is_lp

        ; Point BRJOY0/BRTIME to null_isr so keyboard/timer interrupts
        ; return safely (rets) - keeps interrupts ON for monitor LPC driver
        mov     %null_isr>>8,A
        sta     @BRJOY0
        mov     %null_isr&$FF,A
        sta     @BRJOY0+1
        mov     %null_isr>>8,A
        sta     @BRTIME
        mov     %null_isr&$FF,A
        sta     @BRTIME+1
        sta     @key_last
        sta     @key_cur
        sta     @difficulty
        clr     A
        sta     @text_line_idx
        sta     @text_char_idx
        mov     %TEXT_DELAY,A
        sta     @text_delay
        clr     A
        sta     @text_done
        sta     @menu_shown
        sta     @mouse_enabled       ; mouse off by default (enable with S in menu)
        sta     @mouse_btn_old
        sta     @mouse_btn_latch
        mov     %TEXT_START_Y,A
        sta     @text_y
        ; Init story pointer to start of flat story array
        mov     %story_text>>8,A
        sta     @story_ptr_hi
        mov     %story_text&$FF,A
        sta     @story_ptr_lo
        mov     %TEXT_START_X_SEG,A
        sta     @line_cur_seg
        ; LPC counter and speech init
        clr     A
        sta     @lpc_ctr_lo
        sta     @lpc_ctr_hi
        movd    %$0000,SONFON       ; no auto-repeat
        eint

        ; 1) Draw logo first - VDP fully settled before we touch it
        call    @clear_screen
        call    @draw_title
        call    @draw_stars

        ; 2) Now start music - logo is drawn, timer/VDP settled
        trap    5                   ; stop anything leftover
        ; Small extra settle: EXL100 needs a moment after drawing before LPC
        mov     %50,A
        sta     @lpc_ctr_lo
settle_o:
        clr     B
settle_i:
        djnz    B,settle_i
        lda     @lpc_ctr_lo
        dec     A
        sta     @lpc_ctr_lo
        jnz     @settle_o

        ; Reset counters then fire TRAP 4
        clr     A
        sta     @lpc_ctr_lo
        sta     @lpc_ctr_hi
        sta     @snd_priority
        sta     @ed_saved           ; ensure ROM path used on first game (SRAM uninitialised)
        sta     @ed_l0_dirty        ; same
        ; cram_loaded NOT cleared here — preserved from difficulty menu (C key)
        clr     A
        sta     @MOUSE_SWI
        movd    %small_lpc,PTRSON
        trap    4

        ; 3) Enter main loop - typewriter starts from here
intro_main_loop:
        mov     %$58,B              ; reset stack pointer each frame
        ldsp                        ; prevents stack overflow from call @main_loop
        call    @frame_delay
        ; Skip key: arm only after a no-key frame (prevents EXELTEL boot trigger)
        lda     @text_done
        jnz     @iml_no_skip        ; already done
        lda     @key_cur
        sta     @key_last
        mov     VALUE0,A
        sta     @key_cur
        ; Current = no key?
        cmp     %$86,A
        jeq     @iml_no_skip
        cmp     %$89,A
        jeq     @iml_no_skip
        cmp     %$04,A
        jeq     @iml_no_skip
        jz      @iml_no_skip        ; $00 = no key (EXELTEL idle)
        ; Last frame must have been no-key (arm check)
        lda     @key_last
        jnz     @iml_skip_chk_last  ; non-zero: check against sentinels
        br      @iml_no_skip        ; last=$00, same boot noise
iml_skip_chk_last:
        cmp     %$86,A
        jeq     @iml_do_skip        ; last was no-key sentinel
        cmp     %$89,A
        jeq     @iml_do_skip
        cmp     %$04,A
        jeq     @iml_do_skip
        br      @iml_no_skip        ; last was also a key: held, not new
iml_do_skip:
        mov     %1,A
        sta     @text_done
iml_no_skip:
        call    @type_step
        ; Once story done, show difficulty menu (once only)
        lda     @text_done
        jz     @ml_no_menu
        lda     @menu_shown
        jnz     @ml_no_menu
        mov     %1,A
        sta     @menu_shown
        call    @show_difficulty_menu
        call    @game_start         ; CALL = absolute 16-bit addr (jmp out of range)
ml_no_menu:

        ; ── LPC restart counter (16-bit: hi×256+lo frames)
        ; frame_delay ≈ 5ms → 10s ÷ 5ms = 2000 frames
        ; Fixed timer: restart music after ~9s
        lda     @lpc_ctr_lo
        inc     A
        sta     @lpc_ctr_lo
        jnz     @ml_no_lpc
        lda     @lpc_ctr_hi
        inc     A
        sta     @lpc_ctr_hi
        cmp     %7,A                ; 7 × 256 frames ≈ 9s
        jl      @ml_no_lpc
        ; ── Restart LPC ──
        clr     A
        sta     @lpc_ctr_lo
        sta     @lpc_ctr_hi
        trap    5
        clr     A
        sta     @snd_priority
        movd    %small_lpc,PTRSON
        trap    4
ml_no_lpc:
        br      @intro_main_loop

; Typewriter: walk story_ptr through flat story_text array
; $01 = newline (advance Y, reset X), $00 = end of story
; text_char_idx reused as total char counter for pause triggers
type_step:
        push    A
        push    B
        lda     @text_done
        jz     @ts_active
        pop     B
        pop     A
        rets
ts_active:
        ; Countdown delay
        lda     @text_delay
        dec     A
        sta     @text_delay
        jz     @ts_tick
        pop     B
        pop     A
        rets
ts_tick:
        mov     %TEXT_DELAY,A
        sta     @text_delay

        ; Load story pointer into TEMP1-1:TEMP1
        lda     @story_ptr_hi
        mov     A,TEMP1-1
        lda     @story_ptr_lo
        mov     A,TEMP1

        ; Read one character, advance pointer
        lda     *TEMP1
        sta     @tmp3
        add     %1,TEMP1
        adc     %0,TEMP1-1
        mov     TEMP1-1,A
        sta     @story_ptr_hi
        mov     TEMP1,A
        sta     @story_ptr_lo

        ; Act on char
        lda     @tmp3
        jz     @ts_end
        cmp     %$01,A
        jeq     @ts_newline

        ; Draw character
        sta     @char_buf
        clr     A
        sta     @char_buf+1
        movd    %char_buf,TEMP1
        lda     @line_cur_seg
        sta     @text_x_seg
        call    @draw_text_line_shadow_green
        lda     @line_cur_seg
        inc     A
        sta     @line_cur_seg

        ; Pause triggers
        lda     @text_char_idx
        inc     A
        sta     @text_char_idx
        cmp     %50,A
        jeq     @ts_pause
        cmp     %120,A
        jeq     @ts_pause
        cmp     %190,A
        jeq     @ts_pause
        pop     B
        pop     A
        rets
ts_pause:
        mov     %60,A
        sta     @text_delay
        pop     B
        pop     A
        rets
ts_newline:
        lda     @text_y
        add     %TEXT_STEP,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @line_cur_seg
        pop     B
        pop     A
        rets
ts_end:
        mov     %1,A
        sta     @text_done
        pop     B
        pop     A
        rets


draw_stars:
        push    A
        push    B
        mov     %STAR_COUNT,A
        sta     @loop_i
        clr     A
        sta     @tmp1
ds_lp:
        lda     @tmp1
        mov     A,B
        lda     @star_y(B)
        sta     @cur_y
        lda     @star_seg(B)
        mov     A,B
        lda     @cur_y
        call    @set_line_at
        lda     @tmp1
        mov     A,B
        lda     @star_mask(B)
        sta     @tmp2
        lda     @tmp1
        mov     A,B
        lda     @star_color(B)
        jz     @ds_white
        ; yellow
        clr     A
        movp    A,P46
        lda     @tmp2
        movp    A,P46
        movp    A,P46
        jmp     @ds_next
ds_white:
        lda     @tmp2
        movp    A,P46
        movp    A,P46
        movp    A,P46
ds_next:
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_i
        dec     A
        sta     @loop_i
        jnz     @ds_lp
        pop     B
        pop     A
        rets

draw_text_line:
        push    A
        push    B
        movd    TEMP1,TEMP2
        mov     %8,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
        lda     @text_y
        sta     @cur_y
dt_row:
        lda     @text_x_seg
        mov     A,B
        lda     @cur_y
        call    @set_line_at
        movd    TEMP2,TEMP1
dt_char:
        lda     *TEMP1
        jz     @dt_row_done
        call    @get_font_row
        movp    A,P46
        movp    A,P46
        movp    A,P46
        add     %1,TEMP1
        adc     %0,TEMP1-1
        br      @dt_char
dt_row_done:
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt_row
        pop     B
        pop     A
        rets

; Draw green text (no shadow)
draw_text_line_shadow_green:
        push    A
        call    @draw_text_line_green
        pop     A
        rets

; Draw shadow: OR all 8 font rows per char, write 1 shifted row at text_y+8
; This guarantees shadow for ANY char with pixels, never overwritten by green
draw_text_line_shadow:
        push    A
        push    B
        movd    TEMP1,TEMP2         ; save string pointer
        ; position VDP to (text_x_seg, text_y+8)
        lda     @text_y
        add     %8,A
        sta     @cur_y
        lda     @text_x_seg
        mov     A,B
        lda     @cur_y
        call    @set_line_at
        movd    TEMP2,TEMP1         ; restore string pointer
dts_char:
        lda     *TEMP1              ; read char
        jz     @dts_done            ; null = end
        sta     @tmp1               ; save char
        ; OR all 8 font rows together to get character footprint
        clr     A
        sta     @tmp2               ; accumulator = 0
        clr     A
        sta     @loop_i             ; row index = 0
dts_orloop:
        lda     @tmp1               ; A = char for get_font_row
        call    @get_font_row       ; A = font row[loop_i], uses loop_i from mem
        mov     A,B                 ; B = font row result
        lda     @tmp2               ; A = accumulated so far
        or      B,A                 ; A |= font row
        sta     @tmp2               ; save new accumulated value
        lda     @loop_i
        inc     A
        sta     @loop_i
        cmp     %8,A
        jl     @dts_orloop          ; loop rows 0-7
        ; write shifted footprint to B, G, R as white shadow
        lda     @tmp2
        clrc
        rr      A                   ; shift right 1 pixel
        movp    A,P46               ; B
        movp    A,P46               ; G
        movp    A,P46               ; R
        ; advance string pointer
        add     %1,TEMP1
        adc     %0,TEMP1-1
        clr     A
        sta     @loop_i             ; reset for safety
        br      @dts_char
dts_done:
        pop     B
        pop     A
        rets

; Draw text in green only (G plane)
draw_text_line_green:
        push    A
        push    B
        movd    TEMP1,TEMP2
        mov     %8,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
        lda     @text_y
        sta     @cur_y
dtg_row:
        lda     @text_x_seg
        mov     A,B
        lda     @cur_y
        call    @set_line_at
        movd    TEMP2,TEMP1
dtg_char:
        lda     *TEMP1
        jz     @dtg_row_done
        call    @get_font_row
        sta     @tmp3
        clr     A
        movp    A,P46        ; B
        lda     @tmp3
        movp    A,P46        ; G
        clr     A
        movp    A,P46        ; R
        add     %1,TEMP1
        adc     %0,TEMP1-1
        br      @dtg_char
dtg_row_done:
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dtg_row
        pop     B
        pop     A
        rets

get_font_row:
        push    B
        push    A
        call    @get_font_idx
        sta     @tmp1
        lda     @loop_i
        sta     @tmp2
        lda     @tmp1
        cmp     %16,A
        jl     @gfr_blk0
        cmp     %32,A
        jl     @gfr_blk1
        cmp     %48,A
        jl     @gfr_blk2
        cmp     %64,A
        jl     @gfr_blk3
        lda     @tmp1
        sub     %64,A
        call    @mul8
        mov     A,B
        lda     @tmp2
        add     R0,R1
        mov     B,A
        lda     @font_blk4(B)
        br      @gfr_done
gfr_blk3:
        lda     @tmp1
        sub     %48,A
        call    @mul8
        mov     A,B
        lda     @tmp2
        add     R0,R1
        mov     B,A
        lda     @font_blk3(B)
        br      @gfr_done
gfr_blk2:
        lda     @tmp1
        sub     %32,A
        call    @mul8
        mov     A,B
        lda     @tmp2
        add     R0,R1
        mov     B,A
        lda     @font_blk2(B)
        br      @gfr_done
gfr_blk1:
        lda     @tmp1
        sub     %16,A
        call    @mul8
        mov     A,B
        lda     @tmp2
        add     R0,R1
        mov     B,A
        lda     @font_blk1(B)
        br      @gfr_done
gfr_blk0:
        lda     @tmp1
        call    @mul8
        mov     A,B
        lda     @tmp2
        add     R0,R1
        mov     B,A
        lda     @font_blk0(B)
gfr_done:
        pop     B
        pop     B
        rets

get_font_idx:
        cmp     %$20,A
        jeq     @gfi_space
        cmp     %$2E,A
        jeq     @gfi_dot
        cmp     %$2C,A
        jeq     @gfi_comma
        cmp     %$27,A
        jeq     @gfi_apos
        cmp     %$2D,A
        jeq     @gfi_dash
        cmp     %$3A,A
        jeq     @gfi_colon
        cmp     %$3E,A
        jeq     @gfi_gt
        cmp     %$24,A
        jeq     @gfi_dollar
        cmp     %$3D,A
        jeq     @gfi_equal
        cmp     %$E0,A
        jeq     @gfi_agrave
        cmp     %$E8,A
        jeq     @gfi_egrave
        cmp     %$E9,A
        jeq     @gfi_eacute
        cmp     %$30,A
        jl     @gfi_letter
        cmp     %$3A,A
        jge     @gfi_letter
        sub     %$30,A
        add     %7,A
        rets
gfi_letter:
        cmp     %$41,A
        jl     @gfi_lower
        cmp     %$5B,A
        jge     @gfi_lower
        sub     %$41,A
        add     %17,A
        rets
gfi_lower:
        cmp     %$61,A
        jl     @gfi_space
        cmp     %$7B,A
        jge     @gfi_space
        sub     %$61,A
        add     %48,A
        rets
gfi_space:
        clr     A
        rets
gfi_dot:
        mov     %1,A
        rets
gfi_comma:
        mov     %2,A
        rets
gfi_apos:
        mov     %3,A
        rets
gfi_dash:
        mov     %4,A
        rets
gfi_colon:
        mov     %5,A
        rets
gfi_gt:
        mov     %6,A
        rets
gfi_eacute:
        mov     %74,A
        rets
gfi_egrave:
        mov     %75,A
        rets
gfi_agrave:
        mov     %76,A
        rets
gfi_dollar:
        mov     %77,A
        rets
gfi_equal:
        mov     %78,A
        rets

mul8:
        clrc
        rl      A
        rl      A
        rl      A
        rets

draw_title:
        push    A
        push    B
        mov     %TITLE_Y,A
        sta     @cur_y
        ; block 0 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt0_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt0_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl0(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt0_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt0_row
        ; block 1 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt1_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt1_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl1(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt1_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt1_row
        ; block 2 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt2_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt2_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl2(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt2_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt2_row
        ; block 3 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt3_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt3_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl3(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt3_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt3_row
        ; block 4 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt4_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt4_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl4(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl4(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl4(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt4_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt4_row
        ; block 5 (8 rows)
        mov     %8,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dt5_row:
        lda     @loop_i
        mpy     %TITLE_W_SEG,A
        mov     B,A
        sta     @tmp1
        mov     %TITLE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %TITLE_W_SEG,A
        sta     @loop_j
dt5_seg:
        lda     @tmp1
        mov     A,B
        lda     @title_b_tbl5(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_g_tbl5(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @title_r_tbl5(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dt5_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dt5_row
        pop     B
        pop     A
        rets

; SET_ACMPXY - Set VDP ACMPXY pointer
; IN: A:B = address (A=hi, B=lo)
set_acmpxy:
        movp    %$01,P45
        movp    B,P45
        movp    %$02,P45
        movp    A,P45
        rets


clear_screen:
        push    A
        push    B
        movd    %SCREEN_BASE,R1
        call    @set_acmpxy
        mov     %250,TEMP1
cs_ln:
        mov     %61,B
cs_bt:
        wvdp(%0)
        wvdp(%0)
        djnz    B,cs_bt
        djnz    TEMP1,cs_ln
        pop     B
        pop     A
        rets

frame_delay:
        push    A
        push    B
        mov     %FRAME_DLY,A
fd_o:
        clr     B
fd_i:
        djnz    B,fd_i
        djnz    A,fd_o
        pop     B
        pop     A
        rets

set_line_at:
        push    A
        push    B
        mov     B,TEMP1
        mpy     %122,A
        push    A
        push    B
        mov     TEMP1,A
        rl      A
        add     TEMP1,A
        mov     A,TEMP1
        pop     B
        pop     A
        add     TEMP1,B
        adc     %0,A
        add     %$05,A
        call    @set_acmpxy
        pop     B
        pop     A
        rets

init_screen:
        .byte   36
        .byte   4,$10,5,$C8,6,$88,7,$00
        .byte   1,$FF,2,$FF,8,0,0
        .byte   1,$FF,2,$FF,9,0,0
        .byte   1,$FF,2,$04,10,0,0
        .byte   1,$FF,2,$7F,15,0,0

; --- Flat story text: $01=newline, $00=end ---
story_text:
        .byte   'D','E',' ','R','E','T','O','U','R',' ','D','A','N','S',' ','L','E','S',' ','A','N','N','E','E','S',' ','.','e','q','u',' ','$','1','9','8','0',',',$01
        .byte   'l','e',' ','c','o','u','r','a','g','e','u','x',' ','T','M','S','7','x','x','0',',',$01
        .byte   $E9,'p','a','u','l',$E9,' ','p','a','r',' ','s','e','s',' ','c','o','m','p','a','r','s','e','s',' ','D','a','d','a','5','9',',',$01
        .byte   'C','l','a','u','d','e',' ','e','t',' ','C','o','d','e','x',' ','e','t',' ','d',$27,'a','u','t','r','e','s',$01
        .byte   'i','r','r',$E9,'d','u','c','t','i','b','l','e','s',' ','l','u','t','t','e','n','t',' ','a','v','e','c',$01
        .byte   'a','c','h','a','r','n','e','m','e','n','t',' ','p','o','u','r',' ','l','a',' ','l','i','b',$E9,'r','a','t','i','o','n',$01
        .byte   'd','e','s',' ','s','y','s','t',$E8,'m','e','s',' ','o','b','s','c','u','r','e','s','.',$01
        .byte   $01          ; blank line
        .byte   'L','a',' ','l','i','g','u','e',' ','d','e','s',' ','v','i','l','a','i','n','s',' ','M','A','I','N','S','T','R','E','A','M',$01
        .byte   'm','e','n',$E9,'e',' ','p','a','r',' ','l','e','s',' ','d',$E9,'m','o','n','i','a','q','u','e','s',' ','Z','8','0','x',$01
        .byte   'e','t',' ','6','5','0','2','y',' ','a',' ','e','n','v','o','y',$E9,' ','l','e',' ','v','a','l','e','u','r','e','u','x',$01
        .byte   'T','M','S',' ','d','a','n','s',' ','l','e',' ','d',$E9,'d','a','l','e',' ','d','e',' ','b','r','i','q','u','e','s','.',$01
        .byte   $01          ; blank line
        .byte   'A','i','d','e','z',' ','n','o','t','r','e',' ','h',$E9,'r','o','s',' ',$E0,' ','r','e','j','o','i','n','d','r','e',$01
        .byte   'l','a',' ','p','l','a','n',$E8,'t','e',' ','w','i','z','o','r','d','3','5','5','6',' ','e','t',' ','l','i','b',$E9,'r','e','r',$01
        .byte   'a','i','n','s','i',' ','s','e','s',' ','a','m','i','s',' ','d','e',' ','l','a',' ','l','i','g','u','e',' ','8','b','i','t','s',',',$01
        .byte   'v','i','d','e','o','t','e','x','t',' ','e','t',' ','o','b','s','c','u','r','e','s',' ','c','o','n','s','o','r','t','s','.',$01
        .byte   $00          ; end of story


; --- 8x8 FONT BLOCKS (white) ---
font_blk0:
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$60,$60,$00
        .byte   $00,$00,$00,$00,$00,$60,$40,$00,$20,$20,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$F8,$00,$00,$00,$00,$00,$60,$60,$00,$60,$60,$00,$00
        .byte   $80,$40,$20,$10,$20,$40,$80,$00,$70,$88,$98,$A8,$C8,$88,$70,$00
        .byte   $20,$60,$20,$20,$20,$20,$70,$00,$70,$88,$08,$10,$20,$40,$F8,$00
        .byte   $F0,$08,$08,$70,$08,$08,$F0,$00,$10,$30,$50,$90,$F8,$10,$10,$00
        .byte   $F8,$80,$80,$F0,$08,$08,$F0,$00,$70,$80,$80,$F0,$88,$88,$70,$00
        .byte   $F8,$08,$10,$20,$40,$40,$40,$00,$70,$88,$88,$70,$88,$88,$70,$00
font_blk1:
        .byte   $70,$88,$88,$78,$08,$08,$70,$00,$70,$88,$88,$F8,$88,$88,$88,$00
        .byte   $F0,$88,$88,$F0,$88,$88,$F0,$00,$70,$88,$80,$80,$80,$88,$70,$00
        .byte   $F0,$88,$88,$88,$88,$88,$F0,$00,$F8,$80,$80,$F0,$80,$80,$F8,$00
        .byte   $F8,$80,$80,$F0,$80,$80,$80,$00,$70,$88,$80,$B8,$88,$88,$70,$00
        .byte   $88,$88,$88,$F8,$88,$88,$88,$00,$F8,$20,$20,$20,$20,$20,$F8,$00
        .byte   $38,$10,$10,$10,$10,$90,$60,$00,$88,$90,$A0,$C0,$A0,$90,$88,$00
        .byte   $80,$80,$80,$80,$80,$80,$F8,$00,$88,$D8,$A8,$A8,$88,$88,$88,$00
        .byte   $88,$C8,$A8,$98,$88,$88,$88,$00,$70,$88,$88,$88,$88,$88,$70,$00
font_blk2:
        .byte   $F0,$88,$88,$F0,$80,$80,$80,$00,$70,$88,$88,$88,$A8,$90,$68,$00
        .byte   $F0,$88,$88,$F0,$A0,$90,$88,$00,$78,$80,$80,$70,$08,$08,$F0,$00
        .byte   $F8,$20,$20,$20,$20,$20,$20,$00,$88,$88,$88,$88,$88,$88,$70,$00
        .byte   $88,$88,$88,$88,$88,$50,$20,$00,$88,$88,$88,$A8,$A8,$A8,$50,$00
        .byte   $88,$88,$50,$20,$50,$88,$88,$00,$88,$88,$50,$20,$20,$20,$20,$00
        .byte   $F8,$08,$10,$20,$40,$80,$F8,$00
font_blk3:
        .byte   $70,$88,$88,$F8,$88,$88,$88,$00,$F0,$88,$88,$F0,$88,$88,$F0,$00
        .byte   $70,$88,$80,$80,$80,$88,$70,$00,$F0,$88,$88,$88,$88,$88,$F0,$00
        .byte   $F8,$80,$80,$F0,$80,$80,$F8,$00,$F8,$80,$80,$F0,$80,$80,$80,$00
        .byte   $70,$88,$80,$B8,$88,$88,$70,$00,$88,$88,$88,$F8,$88,$88,$88,$00
        .byte   $F8,$20,$20,$20,$20,$20,$F8,$00,$38,$10,$10,$10,$10,$90,$60,$00
        .byte   $88,$90,$A0,$C0,$A0,$90,$88,$00,$80,$80,$80,$80,$80,$80,$F8,$00
        .byte   $88,$D8,$A8,$A8,$88,$88,$88,$00,$88,$C8,$A8,$98,$88,$88,$88,$00
        .byte   $70,$88,$88,$88,$88,$88,$70,$00,$F0,$88,$88,$F0,$80,$80,$80,$00
font_blk4:
        .byte   $70,$88,$88,$88,$A8,$90,$68,$00,$F0,$88,$88,$F0,$A0,$90,$88,$00
        .byte   $78,$80,$80,$70,$08,$08,$F0,$00,$F8,$20,$20,$20,$20,$20,$20,$00
        .byte   $88,$88,$88,$88,$88,$88,$70,$00,$88,$88,$88,$88,$88,$50,$20,$00
        .byte   $88,$88,$88,$A8,$A8,$A8,$50,$00,$88,$88,$50,$20,$50,$88,$88,$00
        .byte   $88,$88,$50,$20,$20,$20,$20,$00,$F8,$08,$10,$20,$40,$80,$F8,$00
        .byte   $08,$F8,$80,$80,$F0,$80,$80,$F8,$20,$F8,$80,$80,$F0,$80,$80,$F8
        .byte   $20,$70,$88,$88,$F8,$88,$88,$88,$78,$90,$90,$70,$18,$18,$F0,$00
        .byte   $00,$78,$00,$78,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

; --- TITLE TABLES (scaled, with stars) ---
title_r_tbl0:
        .byte   $00,$01,$1C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$00
        .byte   $00,$01,$EC,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$03,$80,$00
        .byte   $00,$01,$EC,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$03,$80,$00
        .byte   $00,$01,$F7,$C7,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$00,$00
        .byte   $00,$00,$7B,$C3,$C0,$00,$00,$00,$00,$20,$00,$00,$1C,$00,$1E
        .byte   $00,$00,$1F,$E1,$C0,$00,$00,$00,$00,$20,$00,$00,$70,$00,$1E
        .byte   $03,$00,$07,$BD,$E0,$00,$00,$00,$03,$D8,$03,$81,$80,$00,$30
        .byte   $03,$00,$07,$BD,$E0,$00,$00,$00,$03,$D8,$03,$81,$80,$00,$30
        .byte   $00,$00,$03,$C6,$30,$03,$00,$00,$00,$E0,$07,$83,$00,$01,$E0
        .byte   $00,$60,$00,$FF,$38,$03,$00,$00,$00,$20,$0E,$0E,$00,$03,$E0
        .byte   $00,$7F,$00,$FD,$FE,$00,$00,$00,$00,$00,$3C,$1C,$00,$1F,$00
        .byte   $00,$3E,$03,$1F,$EE,$00,$00,$00,$00,$00,$3C,$30,$00,$FE,$00
        .byte   $00,$3E,$03,$1F,$EE,$00,$00,$00,$00,$00,$3C,$30,$00,$FE,$00
        .byte   $00,$03,$80,$47,$37,$80,$00,$00,$00,$00,$79,$E0,$07,$E0,$00
        .byte   $00,$00,$F3,$39,$EF,$80,$00,$30,$00,$00,$C3,$C1,$6F,$80,$00
        .byte   $7F,$FF,$FF,$C1,$F9,$C0,$03,$FF,$C0,$01,$C6,$02,$78,$1F,$FF
        .byte   $7F,$FF,$FF,$F8,$3F,$40,$3F,$FF,$E0,$07,$B8,$7F,$FF,$DF,$FF
title_g_tbl0:
        .byte   $0E,$01,$1C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$03,$E3,$C0
        .byte   $0F,$C1,$EF,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$03,$9F,$C0
        .byte   $0F,$C1,$EF,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$03,$9F,$C0
        .byte   $03,$E1,$FF,$87,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$3E,$00
        .byte   $00,$70,$7B,$C3,$C0,$00,$00,$00,$00,$20,$00,$00,$1C,$78,$1E
        .byte   $00,$3E,$1F,$E1,$C0,$00,$00,$00,$00,$20,$00,$00,$70,$F8,$1E
        .byte   $03,$3F,$87,$9D,$E0,$00,$00,$00,$03,$D8,$03,$81,$87,$C0,$30
        .byte   $03,$3F,$87,$9D,$E0,$00,$00,$00,$03,$D8,$03,$81,$87,$C0,$30
        .byte   $00,$0F,$83,$C6,$30,$03,$00,$00,$00,$E0,$07,$83,$0F,$81,$E0
        .byte   $00,$61,$F0,$FF,$38,$03,$00,$00,$00,$20,$0E,$0E,$1C,$03,$E0
        .byte   $00,$7F,$FF,$7D,$FE,$00,$00,$00,$00,$00,$3E,$1D,$F0,$1F,$00
        .byte   $00,$3E,$1F,$3F,$EE,$00,$00,$00,$00,$00,$7C,$31,$F0,$FE,$00
        .byte   $00,$3E,$1F,$3F,$EE,$00,$00,$00,$00,$00,$7C,$31,$F0,$FE,$00
        .byte   $00,$03,$83,$C7,$37,$80,$00,$00,$00,$00,$79,$EF,$E7,$E0,$00
        .byte   $00,$00,$F3,$E1,$EF,$80,$00,$30,$00,$00,$C3,$FF,$07,$80,$00
        .byte   $00,$00,$78,$FD,$F9,$C0,$00,$00,$00,$01,$CE,$3C,$78,$00,$00
        .byte   $80,$00,$00,$1E,$3F,$40,$3C,$00,$20,$07,$BC,$70,$00,$00,$00
title_b_tbl0:
        .byte   $0E,$01,$1C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$03,$E7,$C0
        .byte   $0F,$C1,$9C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$9F,$C0
        .byte   $0F,$C1,$9C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$9F,$C0
        .byte   $03,$E1,$E7,$C7,$00,$00,$00,$00,$00,$00,$00,$00,$1F,$3E,$00
        .byte   $00,$70,$7B,$C1,$00,$00,$00,$00,$00,$20,$00,$00,$7C,$78,$08
        .byte   $00,$3E,$1C,$60,$00,$00,$00,$00,$00,$20,$00,$00,$F8,$F8,$1E
        .byte   $03,$3F,$87,$BC,$E0,$00,$00,$00,$03,$F8,$00,$01,$E7,$C0,$E0
        .byte   $03,$3F,$87,$BC,$E0,$00,$00,$00,$03,$F8,$00,$01,$E7,$C0,$E0
        .byte   $00,$0F,$83,$DE,$20,$00,$00,$00,$00,$00,$00,$03,$8F,$80,$E0
        .byte   $00,$63,$F0,$E7,$38,$00,$00,$00,$00,$20,$00,$1E,$1C,$03,$00
        .byte   $00,$7C,$FF,$7B,$F8,$00,$00,$00,$00,$00,$08,$3D,$F0,$1E,$00
        .byte   $00,$3F,$9F,$05,$F8,$00,$00,$00,$00,$00,$08,$71,$F0,$A4,$00
        .byte   $00,$3F,$9F,$05,$F8,$00,$00,$00,$00,$00,$08,$71,$F0,$A4,$00
        .byte   $00,$03,$83,$C1,$3E,$00,$00,$00,$00,$00,$41,$EF,$E7,$A0,$00
        .byte   $00,$03,$FB,$E0,$3F,$00,$00,$00,$00,$00,$03,$DF,$0F,$80,$00
        .byte   $3F,$FC,$FF,$FC,$DF,$80,$03,$FF,$80,$00,$8E,$3C,$00,$1F,$F8
        .byte   $7F,$FF,$FF,$FE,$09,$C0,$0F,$FF,$E0,$01,$7C,$7F,$FF,$DF,$FF
title_r_tbl1:
        .byte   $7F,$FF,$FF,$F8,$3F,$40,$3F,$FF,$E0,$07,$B8,$7F,$FF,$DF,$FF
        .byte   $FF,$FF,$FF,$F8,$0F,$B8,$3F,$FF,$F8,$0F,$40,$7F,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$F8,$21,$CC,$3F,$FC,$E0,$1E,$C0,$7F,$FF,$FF,$FF
        .byte   $F8,$00,$1B,$78,$35,$F0,$3F,$00,$E0,$31,$00,$7E,$07,$FE,$07
        .byte   $F8,$00,$04,$7F,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FE,$07,$FE,$07
        .byte   $F8,$00,$04,$7F,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FE,$07,$FE,$07
        .byte   $F8,$00,$0C,$7F,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FE,$07,$FE,$07
        .byte   $F8,$02,$7F,$7F,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FE,$FF,$FE,$07
        .byte   $F8,$00,$00,$01,$E0,$00,$03,$00,$00,$0F,$80,$1E,$17,$80,$07
        .byte   $F8,$10,$03,$02,$20,$00,$0C,$00,$00,$07,$00,$00,$00,$00,$07
        .byte   $F8,$10,$03,$02,$20,$00,$0C,$00,$00,$07,$00,$00,$00,$00,$07
        .byte   $F8,$10,$00,$40,$E0,$00,$00,$00,$18,$00,$00,$00,$00,$00,$07
        .byte   $F8,$00,$63,$00,$C0,$C0,$01,$00,$00,$08,$00,$0E,$08,$00,$07
        .byte   $F8,$00,$00,$20,$00,$87,$C1,$00,$00,$00,$00,$02,$08,$04,$07
        .byte   $F8,$00,$00,$18,$08,$04,$01,$00,$00,$06,$00,$02,$08,$18,$07
        .byte   $F8,$00,$00,$18,$08,$04,$01,$00,$00,$06,$00,$02,$08,$18,$07
        .byte   $F8,$02,$03,$00,$00,$00,$21,$00,$04,$06,$08,$02,$08,$18,$07
title_g_tbl1:
        .byte   $80,$00,$00,$1E,$3F,$40,$3C,$00,$20,$07,$BC,$70,$00,$00,$00
        .byte   $C0,$00,$00,$07,$CF,$B8,$3C,$00,$B8,$0F,$78,$70,$00,$78,$00
        .byte   $C4,$00,$00,$9B,$E1,$CC,$3C,$00,$B8,$1E,$C0,$72,$00,$78,$00
        .byte   $C3,$FF,$FF,$1F,$FD,$F6,$3C,$7C,$B8,$39,$80,$71,$F8,$79,$F8
        .byte   $C3,$FF,$FF,$00,$38,$F6,$3C,$7F,$38,$31,$80,$71,$F8,$79,$F8
        .byte   $C3,$FF,$FF,$00,$38,$F6,$3C,$7F,$38,$31,$80,$71,$F8,$79,$F8
        .byte   $C3,$FF,$FF,$00,$00,$00,$00,$7F,$00,$00,$00,$01,$F8,$61,$F8
        .byte   $C3,$FF,$FF,$00,$00,$00,$00,$7F,$00,$00,$00,$01,$F8,$81,$F8
        .byte   $C3,$F0,$00,$7C,$1F,$8F,$FC,$7F,$38,$07,$00,$6C,$00,$01,$F8
        .byte   $C3,$F0,$03,$FE,$3F,$8F,$FC,$7C,$FF,$F7,$7F,$F1,$F8,$7F,$F8
        .byte   $C3,$F0,$03,$FE,$3F,$8F,$FC,$7C,$FF,$F7,$7F,$F1,$F8,$7F,$F8
        .byte   $C3,$F0,$00,$7F,$3F,$FF,$FE,$7C,$FF,$F8,$FF,$FD,$F8,$FF,$FE
        .byte   $C3,$FF,$FF,$3F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$FF,$FE
        .byte   $C3,$FF,$FF,$1F,$FE,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$FF,$FE
        .byte   $C3,$FF,$FF,$1F,$F8,$FD,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FE
        .byte   $C3,$FF,$FF,$1F,$F8,$FD,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FE
        .byte   $C3,$FF,$FF,$07,$F0,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FE
title_b_tbl1:
        .byte   $7F,$FF,$FF,$FE,$09,$C0,$0F,$FF,$E0,$01,$7C,$7F,$FF,$DF,$FF
        .byte   $7F,$FF,$FF,$FF,$C6,$F8,$3F,$FF,$E0,$06,$78,$7F,$FF,$9F,$FF
        .byte   $7C,$00,$00,$7B,$E0,$FC,$3F,$80,$E0,$08,$F0,$7E,$0F,$9E,$07
        .byte   $7B,$FF,$FF,$7F,$F8,$0E,$1F,$7C,$E0,$07,$C0,$7F,$FF,$BF,$FF
        .byte   $FB,$FF,$FF,$7F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$9D,$FF
        .byte   $FB,$FF,$FF,$7F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$9D,$FF
        .byte   $7B,$FF,$FF,$7F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$FD,$FF
        .byte   $FB,$FF,$FF,$7F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$FD,$FF
        .byte   $FB,$F0,$00,$7D,$FF,$0C,$03,$7F,$00,$0F,$80,$1E,$07,$81,$FF
        .byte   $FB,$F0,$03,$FE,$3F,$8F,$FC,$7C,$FF,$F7,$7F,$F1,$F8,$7F,$FF
        .byte   $FB,$F0,$03,$FE,$3F,$8F,$FC,$7C,$FF,$F7,$7F,$F1,$F8,$7F,$FF
        .byte   $FB,$F0,$00,$7F,$3F,$FF,$FE,$7C,$FF,$F8,$FF,$FD,$F8,$FF,$FF
        .byte   $7B,$FF,$FF,$3F,$FF,$FF,$FF,$7C,$FF,$FF,$FF,$FF,$FB,$FF,$FF
        .byte   $7B,$FF,$FF,$1F,$FE,$FE,$7F,$7C,$FF,$FF,$FF,$FF,$FB,$FF,$FF
        .byte   $7B,$FF,$FF,$1F,$F8,$FD,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FF
        .byte   $7B,$FF,$FF,$1F,$F8,$FD,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FF
        .byte   $FB,$FF,$FF,$07,$F0,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FF
title_r_tbl2:
        .byte   $F8,$30,$00,$00,$10,$00,$2D,$00,$04,$C6,$08,$02,$08,$18,$07
        .byte   $F8,$10,$00,$18,$00,$07,$FF,$00,$04,$C6,$08,$42,$08,$18,$07
        .byte   $F8,$1C,$00,$18,$00,$04,$00,$00,$04,$C6,$08,$42,$08,$18,$07
        .byte   $F8,$1C,$00,$18,$00,$04,$00,$00,$04,$C6,$08,$42,$08,$18,$07
        .byte   $F8,$01,$80,$1C,$00,$04,$03,$00,$04,$C6,$08,$02,$08,$00,$07
        .byte   $F8,$00,$00,$00,$00,$00,$00,$00,$04,$CE,$80,$00,$0B,$00,$07
        .byte   $F8,$00,$00,$82,$20,$00,$00,$00,$00,$C6,$40,$10,$08,$00,$07
        .byte   $F8,$00,$00,$80,$01,$00,$0C,$00,$04,$00,$00,$3C,$08,$02,$07
        .byte   $F8,$00,$00,$80,$01,$00,$0C,$00,$04,$00,$00,$30,$08,$02,$07
        .byte   $F8,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00,$00,$00,$07
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $08,$00,$00,$1F,$C0,$00,$00,$00,$00,$1F,$82,$00,$64,$00,$00
title_g_tbl2:
        .byte   $C3,$F0,$00,$07,$F0,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$FE
        .byte   $C3,$F0,$00,$07,$F8,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FE
        .byte   $C3,$FC,$00,$3F,$F8,$FC,$1F,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$F8
        .byte   $C3,$FC,$00,$3F,$F8,$FC,$1F,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$F8
        .byte   $C3,$FF,$FF,$3F,$FE,$FF,$FF,$7C,$FC,$FF,$FF,$FF,$FB,$FF,$F8
        .byte   $C3,$FF,$FF,$3F,$FF,$FF,$FF,$7C,$FC,$FF,$FF,$FF,$FB,$FF,$F8
        .byte   $C3,$FF,$FF,$FF,$3F,$FF,$FE,$7C,$FC,$FE,$FF,$FD,$F8,$FF,$F8
        .byte   $C3,$FF,$FF,$FE,$1F,$8F,$FC,$7C,$FC,$FE,$3F,$FD,$F8,$7F,$F8
        .byte   $C3,$FF,$FF,$FE,$1F,$8F,$FC,$7C,$FC,$FE,$3F,$F1,$F8,$7F,$F8
        .byte   $C4,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00,$00,$00,$06
        .byte   $C0,$00,$00,$00,$00,$F0,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $C0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $08,$00,$00,$3F,$C0,$30,$0E,$00,$1E,$DF,$83,$80,$00,$00,$00
title_b_tbl2:
        .byte   $FB,$F0,$00,$07,$F0,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$FF
        .byte   $7B,$F0,$00,$07,$F8,$FF,$FF,$7C,$FC,$FF,$F8,$7F,$FB,$E1,$FF
        .byte   $7B,$FC,$00,$3F,$F8,$FC,$0F,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$FF
        .byte   $7B,$FC,$00,$3F,$F8,$FC,$0F,$7C,$FC,$FF,$F8,$7F,$FB,$F9,$FF
        .byte   $FB,$FF,$FF,$3F,$FE,$FF,$FF,$7C,$FC,$FF,$FF,$FF,$FB,$FF,$FF
        .byte   $FB,$FF,$FF,$3F,$FF,$FF,$FF,$7C,$FC,$FF,$FF,$FF,$FB,$FF,$FF
        .byte   $FB,$FF,$FF,$7F,$3F,$BF,$FE,$7C,$FC,$FE,$FF,$FD,$F8,$FF,$FF
        .byte   $FB,$FF,$FF,$FE,$1F,$8F,$FC,$7C,$FC,$FE,$3F,$FD,$F8,$7F,$FF
        .byte   $FB,$FF,$FF,$FE,$1F,$8F,$FC,$7C,$FC,$FE,$3F,$F1,$F8,$7F,$FF
        .byte   $F8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $87,$FC,$1F,$FF,$E0,$7F,$E0,$FF,$F8,$1F,$F9,$FF,$FF,$FF,$FE
        .byte   $8F,$F0,$03,$FE,$26,$3F,$FF,$FF,$41,$FF,$FF,$FF,$9F,$E0,$00
        .byte   $00,$00,$00,$00,$01,$FE,$0F,$00,$01,$F7,$87,$C0,$64,$00,$00
title_r_tbl3:
        .byte   $08,$00,$00,$1F,$C0,$00,$00,$00,$00,$1F,$82,$00,$64,$00,$00
        .byte   $38,$00,$00,$F8,$01,$F0,$1C,$00,$07,$2F,$C1,$C1,$FC,$80,$00
        .byte   $7E,$00,$07,$E0,$1F,$80,$3C,$00,$03,$38,$F8,$61,$FF,$80,$00
        .byte   $7E,$00,$1F,$03,$1F,$F0,$60,$00,$03,$CE,$7C,$00,$FF,$00,$00
        .byte   $08,$00,$FC,$04,$2F,$F9,$C0,$00,$01,$E7,$0E,$00,$FF,$80,$00
        .byte   $08,$00,$FC,$04,$2F,$F9,$C0,$00,$01,$E7,$0E,$00,$FF,$80,$00
        .byte   $08,$01,$F8,$61,$FF,$F9,$80,$00,$00,$F1,$87,$C3,$FF,$C0,$00
        .byte   $00,$1F,$1F,$DB,$1F,$FF,$80,$00,$00,$30,$43,$E3,$FF,$C0,$00
        .byte   $00,$1E,$0F,$FE,$3F,$FE,$00,$00,$00,$1E,$79,$F0,$FF,$00,$00
        .byte   $00,$00,$F7,$F9,$FF,$FC,$00,$00,$00,$0E,$3C,$7D,$FF,$80,$00
        .byte   $00,$00,$F7,$F9,$FF,$FC,$00,$00,$00,$0E,$3C,$7D,$FF,$80,$00
        .byte   $00,$01,$F8,$FF,$FF,$B8,$00,$00,$00,$0F,$BC,$1F,$EC,$80,$00
        .byte   $00,$00,$F7,$FF,$FF,$F8,$00,$00,$00,$07,$8F,$9F,$84,$00,$00
        .byte   $00,$00,$FF,$FF,$F8,$30,$00,$00,$00,$07,$C3,$83,$E0,$00,$00
        .byte   $00,$01,$FF,$FF,$F1,$00,$00,$00,$00,$01,$C1,$C1,$F0,$00,$00
        .byte   $00,$01,$FF,$FF,$F1,$00,$00,$00,$00,$01,$C1,$C1,$F0,$00,$00
        .byte   $00,$0F,$FF,$FF,$E0,$30,$00,$00,$00,$00,$F0,$40,$70,$00,$00
title_g_tbl3:
        .byte   $08,$00,$00,$3F,$C0,$30,$0E,$00,$1E,$DF,$83,$80,$00,$00,$00
        .byte   $38,$00,$03,$F8,$01,$F0,$1C,$00,$1F,$3F,$C1,$E0,$9B,$00,$00
        .byte   $7E,$00,$07,$F8,$0F,$80,$3C,$00,$07,$38,$F8,$60,$FF,$00,$00
        .byte   $7E,$00,$1F,$03,$3F,$00,$60,$00,$03,$CF,$7C,$01,$FF,$80,$00
        .byte   $08,$00,$FC,$00,$F8,$01,$E0,$00,$01,$E7,$8E,$01,$FF,$80,$00
        .byte   $08,$00,$FC,$00,$F8,$01,$E0,$00,$01,$E7,$8E,$01,$FF,$80,$00
        .byte   $08,$03,$E3,$03,$E6,$39,$80,$00,$01,$F1,$87,$C1,$FF,$00,$00
        .byte   $00,$1F,$03,$DF,$C1,$3F,$80,$00,$00,$F8,$F3,$E2,$FF,$00,$00
        .byte   $00,$1E,$07,$FE,$01,$FE,$00,$00,$00,$1E,$79,$F0,$FF,$00,$00
        .byte   $00,$00,$97,$F8,$E8,$CC,$00,$00,$00,$0E,$3C,$7D,$FF,$00,$00
        .byte   $00,$00,$97,$F8,$E8,$CC,$00,$00,$00,$0E,$3C,$7D,$FF,$00,$00
        .byte   $00,$00,$F0,$C6,$11,$B8,$00,$00,$00,$0F,$8C,$1E,$08,$00,$00
        .byte   $00,$01,$F7,$FF,$FF,$78,$00,$00,$00,$0F,$87,$9F,$1C,$00,$00
        .byte   $00,$03,$EF,$FE,$F0,$70,$00,$00,$00,$07,$C3,$83,$E0,$00,$00
        .byte   $00,$03,$FF,$FF,$E7,$00,$00,$00,$00,$01,$C1,$C1,$F0,$00,$00
        .byte   $00,$03,$FF,$FF,$E7,$00,$00,$00,$00,$01,$C1,$C1,$F0,$00,$00
        .byte   $00,$3F,$FF,$A7,$FE,$FE,$00,$00,$00,$20,$F1,$E0,$70,$00,$00
title_b_tbl3:
        .byte   $00,$00,$00,$00,$01,$FE,$0F,$00,$01,$F7,$87,$C0,$64,$00,$00
        .byte   $08,$00,$00,$E0,$07,$F0,$3E,$00,$03,$F9,$C1,$F1,$FC,$80,$00
        .byte   $7C,$00,$03,$20,$0F,$80,$3C,$00,$01,$3E,$F1,$F1,$FF,$80,$00
        .byte   $7C,$00,$0C,$02,$3F,$00,$70,$00,$00,$CF,$08,$00,$FF,$00,$00
        .byte   $08,$00,$00,$00,$F8,$B1,$C0,$00,$00,$27,$86,$01,$FF,$00,$00
        .byte   $08,$00,$00,$00,$F8,$B1,$C0,$00,$00,$27,$86,$01,$FF,$00,$00
        .byte   $00,$00,$10,$03,$E7,$F9,$C0,$00,$00,$11,$C7,$83,$FF,$C0,$00
        .byte   $00,$02,$0B,$9F,$CF,$FF,$80,$00,$00,$30,$F1,$E3,$FF,$80,$00
        .byte   $00,$01,$0F,$FE,$0F,$CE,$00,$00,$00,$1E,$F8,$70,$FF,$00,$00
        .byte   $00,$00,$77,$78,$37,$CC,$00,$00,$00,$0E,$7C,$7E,$FF,$00,$00
        .byte   $00,$00,$77,$78,$37,$CC,$00,$00,$00,$0E,$7C,$7E,$FF,$00,$00
        .byte   $00,$00,$F0,$E3,$FF,$38,$00,$00,$00,$0F,$BC,$13,$FC,$80,$00
        .byte   $00,$00,$F7,$DF,$FE,$F0,$00,$00,$00,$07,$8F,$8D,$E4,$00,$00
        .byte   $00,$00,$EF,$BF,$F8,$F0,$00,$00,$00,$07,$C3,$81,$80,$00,$00
        .byte   $00,$00,$9C,$7F,$E0,$00,$00,$00,$00,$00,$C1,$C1,$F0,$00,$00
        .byte   $00,$00,$9C,$7F,$E0,$00,$00,$00,$00,$00,$C1,$C1,$F0,$00,$00
        .byte   $00,$01,$FB,$FF,$E0,$00,$00,$00,$00,$00,$F1,$E0,$70,$00,$00
title_r_tbl4:
        .byte   $00,$03,$FF,$FF,$C0,$00,$00,$00,$00,$00,$70,$20,$10,$00,$00
        .byte   $00,$0F,$FF,$FE,$00,$00,$00,$00,$00,$00,$00,$1C,$00,$00,$00
        .byte   $00,$00,$04,$FC,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00
        .byte   $00,$00,$04,$FC,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00
        .byte   $00,$00,$03,$F8,$00,$00,$00,$00,$00,$00,$00,$0E,$00,$00,$00
        .byte   $00,$00,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00
        .byte   $00,$00,$08,$00,$00,$02,$00,$00,$00,$00,$00,$00,$10,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
title_g_tbl4:
        .byte   $00,$03,$FF,$FF,$CE,$08,$00,$00,$00,$00,$70,$30,$10,$00,$00
        .byte   $00,$3F,$F8,$7E,$18,$BC,$00,$00,$00,$00,$30,$1C,$00,$00,$00
        .byte   $00,$00,$00,$FC,$18,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00
        .byte   $00,$00,$00,$FC,$18,$00,$00,$00,$00,$00,$00,$0C,$00,$00,$00
        .byte   $00,$00,$00,$F8,$21,$F0,$00,$00,$80,$00,$00,$0E,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
title_b_tbl4:
        .byte   $00,$01,$EF,$E7,$C0,$00,$00,$00,$00,$00,$30,$3C,$10,$00,$00
        .byte   $00,$01,$FF,$FE,$00,$00,$00,$00,$00,$00,$00,$3E,$00,$00,$00
        .byte   $00,$00,$64,$BC,$00,$00,$00,$00,$00,$00,$00,$1E,$00,$00,$00
        .byte   $00,$00,$64,$BC,$00,$00,$00,$00,$00,$00,$00,$1E,$00,$00,$00
        .byte   $00,$00,$00,$E0,$00,$00,$00,$00,$00,$00,$00,$0E,$00,$00,$00
        .byte   $00,$00,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00
        .byte   $00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
title_r_tbl5:
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
title_g_tbl5:
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
title_b_tbl5:
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

; --- Stars around title (segment, mask, color) ---
; color: 0=white, 1=yellow
star_y:
        .byte   10,18,26,34,42,50,58,66,74,82,90,98
        .byte   12,20,28,36,44,52,60,68,76,84,92,100
star_seg:
        .byte   2,4,6,8,10,3,5,7,9,11,4,8
        .byte   28,30,32,34,36,38,30,32,34,36,38,33
star_mask:
        .byte   $20,$04,$80,$10,$40,$02,$20,$08,$40,$02,$10,$80
        .byte   $20,$04,$80,$10,$40,$02,$20,$08,$40,$02,$10,$80
star_color:
        .byte   0,1,0,1,0,1,0,1,0,1,0,1
        .byte   1,0,1,0,1,0,1,0,1,0,1,0


; ============================================================================
; SHOW DIFFICULTY MENU
; Clear screen, redraw title+stars, redraw Aidez paragraph, draw menu
; ============================================================================
show_difficulty_menu:
        push    A
        push    B
        mov     %1,A
        sta     @snd_priority
        trap    5
        mov     %20,B
sdm_snd_settle:
        djnz    B,sdm_snd_settle
        trap    5
        clr     A
        sta     @snd_priority
        sta     @lpc_ctr_lo
        sta     @lpc_ctr_hi
        ; Full clear + redraw background
        call    @clear_screen
        call    @draw_title
        call    @draw_stars

        ; Redraw "Aidez..." paragraph (lines 13-16 of story, y=210..234)
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        mov     %210,A
        sta     @text_y
        movd    %menu_aidez1,TEMP1
        call    @draw_text_line_green
        mov     %218,A
        sta     @text_y
        movd    %menu_aidez2,TEMP1
        call    @draw_text_line_green
        mov     %226,A
        sta     @text_y
        movd    %menu_aidez3,TEMP1
        call    @draw_text_line_green
        mov     %234,A
        sta     @text_y
        movd    %menu_aidez4,TEMP1
        call    @draw_text_line_green

        ; Draw blank line at y=106 (already clear)

        ; Draw "Difficulte :" centred at y=130, seg=14
        mov     %130,A
        sta     @text_y
        mov     %14,A
        sta     @text_x_seg
        movd    %menu_diff_str,TEMP1
        call    @draw_text_line_green

        ; Draw choices at y=146, seg=6
        mov     %146,A
        sta     @text_y
        mov     %6,A
        sta     @text_x_seg
        movd    %menu_choice_str,TEMP1
        call    @draw_text_line_green

        ; Draw mouse option at y=162
        mov     %162,A
        sta     @text_y
        mov     %2,A
        sta     @text_x_seg
        movd    %menu_mouse_str,TEMP1
        call    @draw_text_line_green

        ; Draw CRAM option at y=170
        mov     %170,A
        sta     @text_y
        mov     %2,A
        sta     @text_x_seg
        movd    %menu_cram_str,TEMP1
        call    @draw_text_line_green

        ; Wait for key 1, 2, or 3 then start game
sdm_key_wait:
        call    @frame_delay
        lda     @key_cur
        sta     @key_last
        mov     VALUE0,A
        sta     @key_cur
        lda     @key_cur
        cmp     %$31,A              ; '1'
        jeq     @sdm_key1
        cmp     %$32,A              ; '2'
        jeq     @sdm_key2
        cmp     %$33,A              ; '3'
        jeq     @sdm_key3
        and     %$DF,A              ; uppercase
        cmp     %$53,A              ; 'S' toggle Souris
        jne     @sdm_not_s
        call    @sdm_do_mouse
        br      @sdm_key_wait
sdm_not_s:
        cmp     %$43,A              ; 'C' load CRAM
        jne     @sdm_key_wait
        call    @sdm_do_cram
        br      @sdm_key_wait
sdm_key1:
        mov     %BALL_SPEED_EASY,A
        sta     @difficulty
        mov     %0,A
        sta     @lives_d0           ; 10 vies: unités=0
        mov     %1,A
        sta     @lives_d1           ; dizaine=1
        br      @sdm_done_diff
sdm_key2:
        mov     %BALL_SPEED_NORM,A
        sta     @difficulty
        mov     %LIVES_NORM,A
        sta     @lives_d0           ; 8 vies: unités=8
        clr     A
        sta     @lives_d1
        br      @sdm_done_diff
sdm_key3:
        mov     %BALL_SPEED_HARD,A
        sta     @difficulty
        mov     %LIVES_HARD,A
        sta     @lives_d0           ; 5 vies: unités=5
        clr     A
        sta     @lives_d1
sdm_done_diff:
        br      @sdm_set_diff

; --- Mouse toggle subroutine (with debounce) ---
sdm_do_mouse:
        lda     @mouse_enabled
        xor     %1,A
        sta     @mouse_enabled
        mov     %186,A
        sta     @text_y
        mov     %2,A
        sta     @text_x_seg
        lda     @mouse_enabled
        jz      @sdm_mouse_off
        movd    %mouse_on_str,TEMP1
        call    @draw_text_line_green
        br      @sdm_debounce
sdm_mouse_off:
        movd    %mouse_off_str,TEMP1
        call    @draw_text_line_green
sdm_debounce:
        ; Wait for key release (debounce)
        call    @frame_delay
        mov     VALUE0,A
        and     %$DF,A              ; uppercase
        cmp     %$53,A              ; still 'S'?
        jeq     @sdm_debounce
        rets

; --- CRAM load subroutine ---
sdm_do_cram:
        call    @cram_load
        lda     @cram_loaded
        jnz     @sck_ok
        mov     %186,A
        sta     @text_y
        mov     %2,A
        sta     @text_x_seg
        movd    %cram_fail_str,TEMP1
        call    @draw_text_line_green
        rets
sck_ok:
        mov     %186,A
        sta     @text_y
        mov     %2,A
        sta     @text_x_seg
        movd    %cram_ok_str,TEMP1
        call    @draw_text_line_green
        rets


sdm_key_edit:
        pop     B                   ; balance show_difficulty_menu push B
        pop     A                   ; balance show_difficulty_menu push A
        ; Editor sleeping — fall through to show_difficulty_menu
        call    @show_difficulty_menu
        rets
sdm_set_diff:
        ; difficulty already stored by sdm_key1/2/3
        pop     B
        pop     A
        rets

; Menu strings
bravo_txt1:
        .byte   'L','a',' ','l','i','g','u','e',' ','d','e','s',' ','v','i','l','a','i','n','s',$00
bravo_txt2:
        .byte   'M','A','I','N','S','T','R','E','A','M',' ','e','s','t',' ','d',$E9,'c','o','n','f','i','t','e',',',$00
bravo_txt3:
        .byte   'l','a',' ','b','a','t','a','i','l','l','e',' ','e','s','t',' ','r','e','l','a','n','c',$E9,'e',$00
bravo_txt4:
        .byte   'e','t',' ','l','e',' ','v','a','l','e','u','r','e','u','x',' ','T','M','S','7','x','x','0',$00
bravo_txt5:
        .byte   'e','s','t',' ','p','r','e','t',' ','a',' ','r','e','p','a','r','t','i','r',' ','p','o','u','r',$00
bravo_txt6:
        .byte   'd','e',' ','n','o','u','v','e','l','l','e','s',' ','a','v','e','n','t','u','r','e','s',$00
bravo_txt7:
        .byte   '.','.','.','.','.',$00
menu_aidez1:
        .byte   'A','i','d','e','z',' ','n','o','t','r','e',' ','h',$E9,'r','o','s',' ',$E0,' ','r','e','j','o','i','n','d','r','e',$00
menu_aidez2:
        .byte   'l','a',' ','p','l','a','n',$E8,'t','e',' ','z','o','r','g','l','u','b','3','5','5','6',' ','e','t',' ','l','i','b',$E9,'r','e','r',$00
menu_aidez3:
        .byte   'a','i','n','s','i',' ','s','e','s',' ','a','m','i','s',' ','d','e',' ','l','a',' ','l','i','g','u','e',' ','8','b','i','t','s',',',$00
menu_aidez4:
        .byte   'v','i','d','e','o','t','e','x','t',' ','e','t',' ','o','b','s','c','u','r','e','s',' ','c','o','n','s','o','r','t','s','.',$00
menu_diff_str:
        .byte   ' ','D','i','f','f','i','c','u','l','t',$E9,' ',':',' ',$00
menu_choice_str:
        .byte   '1','-','T','r','a','n','q','u','i','l','l','o','u',' ',' ','2','-','T','K','T',' ',' ','3','-','F','l','e','m','m','e',$00
cram_ok_str:
        .byte   'C','h','a','r','g','e','m','e','n','t',' ','E','x','e','l','m','e','m','o','i','r','e',' ','o','k',$00
cram_fail_str:
        .byte   'E','c','h','e','c',' ','c','h','a','r','g','e','m','e','n','t',$00
mouse_on_str:
        .byte   'S','o','u','r','i','s',' ','a','c','t','i','v',$E9,'e',' ',' ',' ',' ',' ',' ',' ',' ',$00
mouse_off_str:
        .byte   'S','o','u','r','i','s',' ','d',$E9,'s','a','c','t','i','v',$E9,'e',' ',' ',' ',' ',$00
menu_mouse_str:
        .byte   'S','-',' ','U','t','i','l','i','s','e','r',' ','l','a',' ','s','o','u','r','i','s',$00
menu_cram_str:
        .byte   'C','-',' ','C','h','a','r','g','e','r',' ','E','x','e','l','m',$E9,'m','o','i','r','e',$00


; ============================================================================
; CRAM_LOAD — verified logic from cram_view2 (confirmed working on hardware)
; ============================================================================
crl_read:
        lda     @tmp_lev_hi
        mov     A,TEMP1-1
        lda     @tmp_lev_lo
        mov     A,TEMP1
        dint
        lda     *TEMP1
        eint
        sta     @cps_sv3
        lda     @tmp_lev_lo
        dec     A
        sta     @tmp_lev_lo
        cmp     %$FF,A
        jne     @crl_rd_ok
        lda     @tmp_lev_hi
        dec     A
        sta     @tmp_lev_hi
crl_rd_ok:
        lda     @cps_sv3
        rets

; crl_find_z: scan for 'Z' ($5A). Returns Z flag clear if found, Z flag set if end of memory.
; On success: ptr_hi:lo points to byte AFTER 'Z' (first data byte of row)
crl_find_z:
        lda     @tmp_lev_hi
        cmp     %CRAM_SCAN_END,A
        jhs     @cfz_ok
        clr     A                   ; signal fail: set Z flag
        rets
cfz_ok:
        call    @crl_read
        cmp     %$5A,A              ; 'Z'
        jne     @crl_find_z
        ; Found Z. Put ptr BACK to point at the Z so icp_to_z can find it.
        lda     @tmp_lev_lo
        inc     A
        sta     @tmp_lev_lo
        cmp     %$00,A
        jne     @cfz_done
        lda     @tmp_lev_hi
        inc     A
        sta     @tmp_lev_hi
cfz_done:
        mov     %1,A                ; A=1, Z flag=0 = success
        rets

; crl_skip_18rows: skip 18 complete rows of format Z[data...]X
; Called when ptr is AT start of row 1 data (after level's first Z already consumed)
; Reads through 18 rows: for each row, scan until 'X' found
; After this call, ptr is positioned to read the NEXT thing (next level's pre-Z garbage)
crl_skip_18rows:
        push    B
        mov     %18,B
crl_s18_row:
        ; Read until 'X' ($58) found — skips data and any Z markers within row
crl_s18_col:
        lda     @tmp_lev_hi
        cmp     %CRAM_SCAN_END,A
        jhs     @crl_s18_xok
        br      @crl_s18_done       ; ran out of memory
crl_s18_xok:
        call    @crl_read
        cmp     %$58,A              ; 'X'
        jne     @crl_s18_col
        ; Found X — row done
        ; Now skip until next Z (start of next row) or end of this level
        ; Actually: just count X completions. djnz handles row count.
        djnz    B,crl_s18_row
crl_s18_done:
        pop     B
        rets


cram_load:
        push    B
        ; Enable ExelMémoire X1 slot
        movp    P49,A
        movp    P50,A
        mov     %CRAM_START_HI,A
        sta     @tmp_lev_hi
        mov     %CRAM_START_LO,A
        sta     @tmp_lev_lo

        ; ── Find "EXELNOID.FIC" ───────────────────────────────────────────────
sig_lp:
        lda     @tmp_lev_hi
        cmp     %CRAM_SCAN_END,A
        jhs     @sig_nok
        br      @crl_fail
sig_nok:
        call    @crl_read
        cmp     %$45,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$58,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$45,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$4C,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$4E,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$4F,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$49,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$44,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$2E,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$46,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$49,A
        jne     @sig_lp
        call    @crl_read
        cmp     %$43,A
        jne     @sig_lp

        ; ── Find "DEBUT" ──────────────────────────────────────────────────────
dbt_lp:
        lda     @tmp_lev_hi
        cmp     %CRAM_SCAN_END,A
        jhs     @dbt_nok
        br      @crl_fail
dbt_nok:
        call    @crl_read
        cmp     %$44,A
        jne     @dbt_lp
        call    @crl_read
        cmp     %$45,A
        jne     @dbt_lp
        call    @crl_read
        cmp     %$42,A
        jne     @dbt_lp
        call    @crl_read
        cmp     %$55,A
        jne     @dbt_lp
        call    @crl_read
        cmp     %$54,A
        jne     @dbt_lp

        ; ── Read 5 levels × 18 rows of "Z[13 chars]X" ───────────────────────
        ; For each level: scan to first 'Z', save ptr, skip 18 rows.
        ; Each row: Z + 13 data chars (skipping any non-data) + X
        ; We store ptr AFTER 'Z' = start of row 1 data for each level.

        ; LEVEL 1
        movp    P49,A               ; re-assert MDMEM2
        call    @crl_find_z
        jz      @crl_fail
        lda     @tmp_lev_hi
        sta     @cram_l1_hi
        lda     @tmp_lev_lo
        sta     @cram_l1_lo
        call    @crl_skip_18rows

        ; LEVEL 2
        movp    P49,A               ; re-assert MDMEM2
        call    @crl_find_z
        jz      @crl_fail
        lda     @tmp_lev_hi
        sta     @cram_l2_hi
        lda     @tmp_lev_lo
        sta     @cram_l2_lo
        call    @crl_skip_18rows

        ; LEVEL 3
        movp    P49,A               ; re-assert MDMEM2
        call    @crl_find_z
        jz      @crl_fail
        lda     @tmp_lev_hi
        sta     @cram_l3_hi
        lda     @tmp_lev_lo
        sta     @cram_l3_lo
        call    @crl_skip_18rows

        ; LEVEL 4
        movp    P49,A               ; re-assert MDMEM2
        call    @crl_find_z
        jz      @crl_fail
        lda     @tmp_lev_hi
        sta     @cram_l4_hi
        lda     @tmp_lev_lo
        sta     @cram_l4_lo
        call    @crl_skip_18rows

        ; LEVEL 5
        movp    P49,A               ; re-assert MDMEM2
        call    @crl_find_z
        jz      @crl_fail
        lda     @tmp_lev_hi
        sta     @cram_l5_hi
        lda     @tmp_lev_lo
        sta     @cram_l5_lo
crl_success:
        mov     %1,A
        sta     @cram_loaded
        pop     B
        rets
crl_fail:
        clr     A
        sta     @cram_loaded
        pop     B
        rets

; ============================================================================
; CHECK_KONAMI: UP UP DN DN LF RT LF RT B A → toggle auto_mode + unpause
; ============================================================================

game_start:
        mov     %1,A
        sta     @snd_priority
        trap    5
        mov     %20,B
gs_snd_settle:
        djnz    B,gs_snd_settle
        trap    5
        clr     A
        sta     @snd_priority
        sta     @lpc_ctr_lo
        sta     @lpc_ctr_hi
        ; Editor disabled: force ROM path always.
        sta     @ed_saved
        sta     @ed_l0_dirty
        sta     @no_brick_tmr
        sta     @ball_flat_tmr
        sta     @konami_idx         ; reset Konami sequence
        sta     @pad_hit_cnt
        ; Set ball speed from difficulty choice
        lda     @difficulty
        sta     @ball_speed
        clr     A
        sta     @auto_mode          ; start in manual mode


        ; Clear full screen to black (wipe intro/menu graphics from all areas)
        call    @clear_screen
        call    @draw_border
        call    @draw_title_game

        ; Init RNG and power state
        mov     %$5A,A
        sta     @rand_seed
        clr     A
        sta     @current_level      ; always start at level 1
        sta     @power_active
        sta     @power_type
        sta     @active_power
        sta     @fire_active
        sta     @score_d0
        sta     @score_d1
        sta     @score_d2
        sta     @score_d3
        sta     @level_d1
        ; lives_d0/d1 already set by difficulty menu — do not reset here
        sta     @level_d0
        clr     A
        sta     @game_over
        sta     @paused
        sta     @pause_latch
        mov     %$FF,A
        sta     @bullet1_y
        sta     @bullet2_y

        ; Init paddle/ball parameters
        mov     %PADDLE_W_BASE,A
        sta     @paddle_w
        mov     %PADDLE_MAX_BASE,A
        sta     @paddle_max
        mov     %12,A
        sta     @paddle_bytes
        ; ball_speed already set from difficulty choice

        ; Init and draw bricks.
        ; ed_l0_dirty=1: bricks clobbered by prior level1/2 advancement → restore ROM level0 data.
        ; ed_l0_dirty=0 (first game after save): bricks has user's level0 edits — use as-is.
        lda     @ed_saved
        jz      @gs_ib
        lda     @ed_l0_dirty
        jz      @gs_ib
        push    A
        push    B
        clr     A
        sta     @current_level
        call    @ed_rom_fill_bricks
        sta     @ed_l0_dirty        ; A=0: clear dirty flag
        pop     B
        pop     A
gs_ib:
        call    @init_bricks

        ; Init paddle centered in game area (26 seg wide)
        mov     %11,A
        sta     @paddle_x
        sta     @paddle_x_old       ; init velocity tracking
        call    @draw_paddle

        ; Init timers
        mov     %PAD_SPEED,A
        sta     @pad_tmr
        mov     %PAD_SPEED_MAN,A
        sta     @pad_tmr_man
        lda     @ball_speed
        sta     @ball_tmr

        ; Place ball on paddle
        call    @place_ball_on_paddle
        call    @draw_power_indicator
        call    @draw_score
        call    @draw_score_label
        call    @draw_level_label
        call    @draw_level
        call    @draw_speed_label
        call    @draw_speed
        call    @draw_lives_label
        call    @draw_lives

; ============================================================================
; MAIN LOOP
; ============================================================================
main_loop:
        mov     %$58,B              ; reset stack pointer each frame
        ldsp                        ; prevents stack overflow from call @main_loop
        call    @frame_delay
        lda     @key_cur
        sta     @key_last
        mov     VALUE0,A
        sta     @key_cur
        ; K/k shortcut: jump to bravo screen (debug/test, debounced)
        lda     @key_cur
        cmp     %$4B,A              ; 'K'
        jeq     @ml_kbravo
        cmp     %$6B,A              ; 'k'
        jne     @ml_no_kbravo
ml_kbravo:
        lda     @key_last
        cmp     %$4B,A
        jeq     @ml_no_kbravo
        cmp     %$6B,A
        jeq     @ml_no_kbravo
        call    @draw_bravo_screen
        br      @main_loop
ml_no_kbravo:
        ; Toggle auto/manual on O/o key (debounced via key_last)
        lda     @key_cur
        cmp     %$4F,A               ; 'O'
        jeq     @ml_toggle_auto
        cmp     %$6F,A               ; 'o'
        jeq     @ml_toggle_auto
        br      @ml_no_toggle
ml_toggle_auto:
        lda     @key_last            ; debounce: only act on new press
        cmp     %$4F,A
        jeq     @ml_no_toggle
        cmp     %$6F,A
        jeq     @ml_no_toggle
        clr     A
        sta     @auto_mode          ; O key: disable auto mode only
ml_no_toggle:
        lda     @game_over
        jnz     @ml_go
        lda     @paused
        jz     @ml_run
        lda     @paused
        jz      @ml_run
        call    @check_konami
        lda     @paused
        jz      @ml_run
        lda     @key_cur
        cmp     %KEY_SPACE,A
        jeq     @ml_unpause
        cmp     %$50,A               ; 'P'
        jeq     @ml_unpause_p
        cmp     %$70,A               ; 'p'
        jeq     @ml_unpause_p
        ; Check mouse button for unpause
        lda     @mouse_enabled
        jz      @ml_pause_loop
        call    @check_mouse_btn
        lda     @paused
        jz      @ml_run              ; mouse button unpaused us
ml_pause_loop:
        br      @main_loop
ml_unpause_p:
        lda     @pause_latch
        jnz     @ml_resume
        mov     %1,A
        sta     @pause_latch
        br      @ml_unpause
ml_unpause:
        call    @clear_pause
        clr     A
        sta     @paused
        sta     @pause_latch        ; clear latch after unpause
        br      @main_loop
ml_go:
        mov     VALUE0,A
        cmp     %KEY_SPACE,A
        jne     @ml_resume
        ; Return to difficulty screen (not current level)
        call    @clear_game_over
        clr     A
        sta     @game_over
        call    @show_difficulty_menu   ; show difficulty choice
        call    @game_start             ; full game restart from level 1
        call    @main_loop              ; should not reach here (call = 16-bit abs, no range limit)

ml_resume:
        call    @main_loop     ; far branch -> call (absolute)
ml_run:
ml_pause_chk:
        lda     @key_cur
        and     %$DF,A              ; uppercase
        cmp     %$50,A              ; 'P'
        jeq     @ml_pause_p
        ; P not held: clear latch so next press is fresh
        clr     A
        sta     @pause_latch
ml_skip_pause2:
        call    @update_powerup
        call    @move_bullets
        lda     @fire_active
        jz     @ml_can_skip
        call    @draw_cannons
ml_can_skip:

        ; Track paddle velocity for spin detection (saved every frame)
        lda     @paddle_x
        sta     @paddle_x_old
        ; Paddle keys: throttle handled inside check_keys
        call    @check_keys
        lda     @mouse_enabled
        jz      @ml_no_mouse
        call    @check_mouse
ml_no_mouse:

        ; --- Ball state ---
        lda     @ball_active
        jnz     @ml_ball_live

        ; Launch: auto if auto_mode=1, else wait for Space
        lda     @auto_mode
        jnz     @ml_do_launch
        mov     VALUE0,A
        cmp     %KEY_SPACE,A
        jne     @ml_resume
ml_do_launch:
        call    @erase_ball
        mov     %1,A
        sta     @ball_active
        clr     A
        sta     @ball_dy            ; up
        mov     %1,A
        sta     @ball_dx            ; right
        mov     %4,A
        sta     @ball_dx_bias       ; neutral spin
        lda     @ball_speed
        sta     @ball_tmr
        call    @main_loop     ; far branch -> call (absolute)

ml_pause:
        mov     %1,A
        sta     @paused
        call    @draw_pause
        call    @main_loop     ; far branch -> call (absolute)

ml_pause_p:
        ; P is held — only act on the first frame (latch=0)
        lda     @pause_latch
        jnz     @ml_skip_pause2     ; already latched: ignore repeat
        mov     %1,A
        sta     @pause_latch        ; set latch
        br      @ml_pause           ; toggle pause

ml_ball_live:
        ; Fire power: shoot on space
        lda     @fire_active
        jz     @ml_ball_move
        mov     VALUE0,A
        cmp     %KEY_SPACE,A
        jne     @ml_ball_move
        call    @fire_bullets
ml_ball_move:
        ; --- Ball timer ---
        lda     @ball_tmr
        dec     A
        sta     @ball_tmr
        jz      @ml_do_move
        br      @ml_skip_move
ml_do_move:
        lda     @ball_speed
        sta     @ball_tmr

        call    @erase_ball
        call    @move_ball
        call    @draw_ball
        call    @draw_paddle            ; repair paddle if erase_ball overlapped it

        ; All bricks gone?
        lda     @brick_count
        jz      @ml_all_clear
        br      @ml_end
ml_all_clear:
        call    @erase_ball
        call    @reset_powerups     ; clear active effects, restore difficulty speed
        ; Advance to next level (0→1→2→3→4); 5 = all done -> BRAVO
        lda     @current_level
        inc     A
        cmp     %5,A
        jl      @ml_no_wrap
        ; All 5 levels cleared -> BRAVO screen (returns to intro internally)
        call    @draw_bravo_screen
        br      @ml_end             ; should not reach here
ml_no_wrap:
        sta     @current_level
        ; Update level display: current_level is 0-based, display is 1-based
        inc     A
        sta     @level_d0           ; units digit (1-5)
        clr     A
        sta     @level_d1           ; tens digit (always 0 for 5 levels)
        call    @draw_level
        call    @init_bricks
        call    @place_ball_on_paddle
        call    @draw_paddle
        ; Reset ball_tmr cleanly from current difficulty speed
        lda     @difficulty
        sta     @ball_speed
        sta     @ball_tmr

        ; --- Anti-loop nudge: fire every 8 frames without a brick hit ---
        lda     @ball_active
        jnz     @ml_nudge_ok1
        br      @ml_end
ml_nudge_ok1:
        lda     @brick_count
        jnz     @ml_nudge_ok2
        br      @ml_end
ml_nudge_ok2:
        lda     @no_brick_tmr
        inc     A
        sta     @no_brick_tmr
        cmp     %4,A
        jhs     @ml_nudge_fire
        br      @ml_end
ml_nudge_fire:
        ; Redraw ball after nudge to avoid leaving erased brick pixels behind
        call    @erase_ball
        ; Fire: reset timer, random dx, flip dy, random seg nudge
        clr     A
        sta     @no_brick_tmr
        ; Corner-aware dx in nudge: force away from nearby wall
        lda     @ball_seg
        cmp     %3,A
        jhs     @ml_nudge_dx_chk_r
        mov     %1,A                ; near left wall: force right
        sta     @ball_dx
        jmp     @ml_nudge_dx_done
ml_nudge_dx_chk_r:
        cmp     %BALL_MAX_SEG-2,A
        jl      @ml_nudge_dx_rand
        clr     A                   ; near right wall: force left
        sta     @ball_dx
        jmp     @ml_nudge_dx_done
ml_nudge_dx_rand:
        call    @rand_next
        and     %1,A
        sta     @ball_dx
ml_nudge_dx_done:
        lda     @ball_dy
        xor     %1,A
        sta     @ball_dy            ; flip vertical direction
        ; If ball is stuck near a wall, teleport to center to break corner loop
        lda     @ball_seg
        cmp     %8,A
        jhs     @ml_nudge_chk_right
        ; Near left wall: force right + large random seg shift (3-10) + 50% dy flip
        mov     %1,A
        sta     @ball_dx
        call    @rand_next
        and     %7,A                ; 0-7
        add     %3,A                ; 3-10
        sta     @tmp3               ; save shift amount
        lda     @tmp3
        mov     A,B
        lda     @ball_seg
        add     R0,R1
        mov     B,A                 ; A = ball_seg + shift
        cmp     %BALL_MAX_SEG,A
        jl      @ml_left_seg_ok
        mov     %BALL_MAX_SEG-1,A
ml_left_seg_ok:
        sta     @ball_seg
        ; 50% chance to flip dy
        call    @rand_next
        and     %1,A
        jz      @ml_nudge_draw
        lda     @ball_dy
        xor     %1,A
        sta     @ball_dy
        jmp     @ml_nudge_draw
ml_nudge_chk_right:
        cmp     %BALL_MAX_SEG-7,A
        jl      @ml_nudge_center_ok
        ; Near right wall: force left + large random seg shift (3-10) + 50% dy flip
        clr     A
        sta     @ball_dx
        call    @rand_next
        and     %7,A                ; 0-7
        add     %3,A                ; 3-10
        sta     @tmp3
        lda     @tmp3
        mov     A,B
        lda     @ball_seg
        sub     R0,R1
        mov     B,A                 ; A = ball_seg - shift
        jhs     @ml_right_seg_ok
        clr     A                   ; clamp to 0
ml_right_seg_ok:
        sta     @ball_seg
        call    @rand_next
        and     %1,A
        jz      @ml_nudge_draw
        lda     @ball_dy
        xor     %1,A
        sta     @ball_dy
        jmp     @ml_nudge_draw
ml_nudge_center_ok:
        ; Center area: random nudge ±2-4 segs
        call    @rand_next
        sta     @tmp3               ; save for direction
        and     %3,A                ; 0-3
        add     %2,A                ; 2-5 seg shift
        sta     @tmp1               ; shift amount
        lda     @tmp3
        and     %1,A                ; direction
        jz      @ml_nudge_left
        lda     @tmp1
        mov     A,B
        lda     @ball_seg
        add     R0,R1
        mov     B,A
        cmp     %BALL_MAX_SEG,A
        jl      @ml_nudge_done
        mov     %BALL_MAX_SEG-1,A
        br      @ml_nudge_done
ml_nudge_left:
        lda     @tmp1
        mov     A,B
        lda     @ball_seg
        sub     R0,R1
        mov     B,A
        jhs     @ml_nudge_done
        clr     A
ml_nudge_done:
        sta     @ball_seg
        br      @ml_nudge_draw
ml_nudge_draw:
        call    @draw_ball
        call    @draw_paddle
ml_skip_move:
ml_end:
        call    @main_loop     ; far branch -> call (absolute)

; ============================================================================
; CHECK_KEYS - AUTO PADDLE: tracks ball_seg (for stress testing).
; Moves paddle centre toward ball_seg by 1 each PAD_SPEED frames.
; Ball launch and pause still require Space/P keys.
; ============================================================================
; ============================================================================
; DO_MOVE_LEFT / DO_MOVE_RIGHT - shared paddle movement bodies
; Called from both manual and auto paths to avoid branch range issues
; ============================================================================
do_move_left:
        lda     @paddle_x
        jz     @dml_done            ; already at left edge
        lda     @ball_active
        jnz     @dml_nb
        call    @erase_ball
dml_nb:
        call    @erase_paddle
        lda     @paddle_x
        dec     A
        sta     @paddle_x
        call    @draw_paddle
        lda     @ball_active
        jnz     @dml_done
        call    @update_ball_on_pad
        call    @draw_ball
dml_done:
        rets

do_move_right:
        lda     @paddle_x
        mov     A,B
        lda     @paddle_max
        cmp     R0,R1
        jhs     @dmr_done            ; already at right edge
        lda     @ball_active
        jnz     @dmr_nb
        call    @erase_ball
dmr_nb:
        call    @erase_paddle
        lda     @paddle_x
        inc     A
        sta     @paddle_x
        call    @draw_paddle
        lda     @ball_active
        jnz     @dmr_done
        call    @update_ball_on_pad
        call    @draw_ball
dmr_done:
        rets

check_keys:
        ; Auto or manual?
        lda     @auto_mode
        jnz     @ck_auto_throttle
        ; --- MANUAL: throttle to PAD_SPEED_MAN frames per step ---
        lda     @pad_tmr_man
        dec     A
        sta     @pad_tmr_man
        jnz     @ck_man_key         ; timer not done: still read key for release
        mov     %PAD_SPEED_MAN,A
        sta     @pad_tmr_man
ck_man_key:
        mov     VALUE0,A
        cmp     %KEY_A_UP,A
        jeq     @ck_man_move_left
        cmp     %KEY_A_LO,A
        jeq     @ck_man_move_left
        cmp     %KEY_ARR_LEFT,A
        jeq     @ck_man_move_left
        cmp     %KEY_Z_UP,A
        jeq     @ck_man_move_right
        cmp     %KEY_Z_LO,A
        jeq     @ck_man_move_right
        cmp     %KEY_ARR_RIGHT,A
        jeq     @ck_man_move_right
        ; No key held: reset timer so next press responds instantly
        mov     %1,A
        sta     @pad_tmr_man
        rets
ck_man_move_left:
        lda     @pad_tmr_man        ; only move when timer just fired
        cmp     %PAD_SPEED_MAN,A
        jne     @ck_man_done
        call    @do_move_left
        rets
ck_man_move_right:
        lda     @pad_tmr_man
        cmp     %PAD_SPEED_MAN,A
        jne     @ck_man_done
        call    @do_move_right
        rets
ck_man_done:
        rets
ck_auto_throttle:
        ; --- AUTO: throttle to PAD_SPEED frames ---
        lda     @pad_tmr
        dec     A
        sta     @pad_tmr
        jnz     @ck_done
        mov     %PAD_SPEED,A
        sta     @pad_tmr
ck_auto:
        ; --- AUTO: track ball_seg with paddle centre ---
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        clrc
        rr      A                   ; A = paddle_w/2
        add     R0,R1               ; B = paddle centre
        lda     @ball_seg
        cmp     R0,R1
        jeq     @ck_end2
        jhs     @ck_auto_left
        ; centre < ball -> move right
ck_right:
        call    @do_move_right
ck_end2:
ck_done:
        rets

ck_auto_left:
        call    @do_move_left
        rets

; ============================================================================
; BALL ON PADDLE
; ============================================================================

; ============================================================================
; CALC_PADDLE_SPIN
; Computes new ball_dx based on hit zone and paddle velocity.
; Inputs: ball_seg, paddle_x, paddle_x_old, paddle_w
; Output: ball_dx updated
; Trashes: A, B (caller saves)
; ============================================================================
calc_paddle_spin:
        push    A
        push    B
        ; Save tmp1/tmp2/tmp3 - collision code uses these
        lda     @tmp1
        sta     @cps_sv1
        lda     @tmp2
        sta     @cps_sv2
        lda     @tmp3
        sta     @cps_sv3

        ; hit_offset = ball_seg - paddle_x  (0 = leftmost)
        lda     @ball_seg
        mov     A,B                     ; B = ball_seg
        lda     @paddle_x
        sub     R0,R1                   ; B = ball_seg - paddle_x
        mov     B,A                     ; A = offset (0..paddle_w-1)
        sta     @tmp3                   ; save offset

        ; paddle_w is 4 or 6 segs (wide powerup)
        ; For paddle_w=6: left 0..1, center 2..3, right 4..5
        ; For paddle_w=4: left 0, center 1..2, right 3
        lda     @paddle_w
        cmp     %6,A
        jeq     @cps_wide
        ; base width (4)
        mov     %1,A
        sta     @tmp1                   ; left_thresh
        mov     %3,A
        sta     @tmp2                   ; right_thresh
        br      @cps_zone
cps_wide:
        mov     %2,A
        sta     @tmp1                   ; left_thresh
        mov     %4,A
        sta     @tmp2                   ; right_thresh
cps_zone:
        ; Determine zone: if offset < left_thresh -> left
        ;                if offset >= right_thresh -> right
        ;                else center
        lda     @tmp3                   ; A = offset
        mov     A,B                     ; B = offset
        lda     @tmp1                   ; A = left_thresh
        cmp     R0,R1                   ; B - A = offset - left_thresh
        jl      @cps_left
        lda     @tmp3
        mov     A,B
        lda     @tmp2                   ; A = right_thresh
        cmp     R0,R1                   ; B - A = offset - right_thresh
        jhs     @cps_right
        br      @cps_center
cps_left:
        clr     A
        sta     @ball_dx
        br      @cps_apply_vel
cps_right:
        mov     %1,A
        sta     @ball_dx
        br      @cps_apply_vel
cps_center:
        ; CENTER: keep current ball_dx, velocity overrides only

cps_apply_vel:
        ; paddle_vel = paddle_x - paddle_x_old
        lda     @paddle_x
        mov     A,B
        lda     @paddle_x_old
        cmp     R0,R1                   ; B - A = paddle_x - paddle_x_old
        jeq     @cps_done               ; stationary: keep zone result

        ; Paddle moved. If ball_dx matches paddle direction, no change.
        ; If ball_dx OPPOSES paddle direction, paddle wins (redirect).
        jhs     @cps_vel_right          ; paddle_x > paddle_x_old -> moving right

        ; Paddle moved LEFT (paddle_x < paddle_x_old)
        ; Override ball_dx to 0 (left) regardless of zone
        clr     A
        sta     @ball_dx
        br      @cps_done

cps_vel_right:
        ; Paddle moved RIGHT
        ; Override ball_dx to 1 (right) regardless of zone
        mov     %1,A
        sta     @ball_dx

        ; Arkanoid flat angle: fast paddle → skip dy steps for N frames
        lda     @paddle_x
        mov     A,B
        lda     @paddle_x_old
        cmp     R0,R1
        jhs     @cps_vp
        sub     R0,R1
        mov     B,A
        jmp     @cps_vm
cps_vp:
        sub     R0,R1
        mov     B,A
cps_vm:
        cmp     %2,A
        jhs     @cps_fast
        jz      @cps_no_flat
        mov     %6,A
        jmp     @cps_sf
cps_fast:
        mov     %14,A
cps_sf:
        sta     @ball_flat_tmr
        jmp     @cps_done
cps_no_flat:
        clr     A
        sta     @ball_flat_tmr
cps_done:
        ; Restore tmp1/tmp2/tmp3
        lda     @cps_sv1
        sta     @tmp1
        lda     @cps_sv2
        sta     @tmp2
        lda     @cps_sv3
        sta     @tmp3
        pop     B
        pop     A
        rets

; ============================================================================
; ============================================================================
; READ_MOUSE — standalone ExelMouse port reader (no ROM dependency)
; ============================================================================
; Reads mouse via P49/P50 in 4 passes, same protocol as EXELTEL ROM $F064.
; Returns: TEMP1 = signed delta X, mouse_btn_old = raw P49 (buttons in bits 6,5)
; Works on both EXL100 and EXELTEL (uses hardware ports only, no ROM calls).
; ============================================================================
read_mouse:
        push    A
        push    B

        ; --- Pass 1: hi nibble of delta X ---
        movp    %$08,P50             ; select mouse read mode
        movp    %$03,P49             ; request X hi nibble
        mov     %6,B                 ; delay (matches ROM timing)
        call    @mouse_delay
        movp    %$02,P50             ; latch
        movp    P49,A                ; read
        sta     @mouse_btn_old       ; save raw byte (buttons in bits 6,5)
        and     %$0F,A               ; extract lo 4 bits (data nibble)
        rl      A
        rl      A
        rl      A
        rl      A                    ; shift to hi nibble position
        push    A                    ; save hi nibble of delta X

        ; --- Pass 2: lo nibble of delta X ---
        movp    %$08,P50
        movp    %$02,P49             ; request X lo nibble
        mov     %1,B
        call    @mouse_delay
        movp    %$02,P50
        movp    P49,A
        and     %$0F,A               ; lo nibble
        pop     B                    ; B = hi nibble
        or      B,A                  ; A = full signed delta X
        mov     A,TEMP1              ; store signed delta X

        ; --- Pass 3: hi nibble of delta Y (must complete for protocol) ---
        movp    %$08,P50
        movp    %$03,P49
        mov     %1,B
        call    @mouse_delay
        movp    %$02,P50
        movp    P49,A                ; read and discard

        ; --- Pass 4: lo nibble of delta Y (must complete for protocol) ---
        movp    %$08,P50
        movp    %$02,P49
        mov     %1,B
        call    @mouse_delay
        movp    %$02,P50
        movp    P49,A                ; read and discard

        pop     B
        pop     A
        rets

; Delay subroutine — matches ROM $F0F5 timing
; IN: B = iteration count (6 for pass 1, 1 for passes 2-4)
mouse_delay:
        push    A
        push    B
md_lp:  lda     @mouse_btn_old       ; 3-byte instruction as timing padding
        lda     @mouse_btn_old       ; 3-byte instruction as timing padding
        djnz    B,md_lp
        pop     B
        pop     A
        rets

; ============================================================================
; CHECK_MOUSE — read mouse and process movement + buttons
; ============================================================================
check_mouse:
        push    A
        push    B

        call    @read_mouse

        ; --- Process delta X ---
        mov     TEMP1,A
        jz      @cm_no_move

        ; Test sign bit: bit 7 set = negative
        and     %$80,A
        jnz     @cm_dir1
        ; bit 7 clear = positive delta → move left
        call    @do_move_left
        br      @cm_no_move
cm_dir1:
        ; bit 7 set = negative delta → move right
        call    @do_move_right

cm_no_move:
        ; --- Button check ---
        ; mouse_btn_old has raw P49 from pass 1
        ; Bits 6,5 = buttons (active low). Invert and mask.
        lda     @mouse_btn_old
        xor     %$FF,A
        and     %$60,A
        jz      @cm_no_btn

        ; Button pressed — edge detect
        lda     @mouse_btn_latch
        jnz     @cm_done
        mov     %1,A
        sta     @mouse_btn_latch

        ; New press → unpause or launch ball
        lda     @paused
        jz      @cm_not_paused
        call    @clear_pause
        clr     A
        sta     @paused
        sta     @pause_latch
        br      @cm_done

cm_not_paused:
        lda     @ball_active
        jnz     @cm_done
        lda     @game_over
        jnz     @cm_done
        mov     %1,A
        sta     @ball_active
        clr     A
        sta     @ball_dy
        mov     %1,A
        sta     @ball_dx
        lda     @ball_speed
        sta     @ball_tmr
        br      @cm_done

cm_no_btn:
        clr     A
        sta     @mouse_btn_latch

cm_done:
        pop     B
        pop     A
        rets

; ============================================================================
; CHECK_MOUSE_BTN — lightweight mouse poll for pause screen
; ============================================================================
check_mouse_btn:
        push    A
        push    B
        call    @read_mouse
        lda     @mouse_btn_old
        xor     %$FF,A
        and     %$60,A
        jz      @cmb_no_btn
        ; Button pressed — edge detect
        lda     @mouse_btn_latch
        jnz     @cmb_done
        mov     %1,A
        sta     @mouse_btn_latch
        ; Unpause
        call    @clear_pause
        clr     A
        sta     @paused
        sta     @pause_latch
        br      @cmb_done
cmb_no_btn:
        clr     A
        sta     @mouse_btn_latch
cmb_done:
        pop     B
        pop     A
        rets

place_ball_on_paddle:
        clr     A
        sta     @ball_active
        call    @update_ball_on_pad
        call    @draw_ball
        rets

update_ball_on_pad:
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        clrc
        rr      A                   ; half width
        add     R0,R1               ; B = paddle_x + half
        mov     B,A
        sta     @ball_seg
        mov     %PADDLE_Y-BALL_H-1,A
        sta     @ball_y
        rets

; ============================================================================
; MOVE_BALL - Wall/brick/paddle collision
; ============================================================================
move_ball:
        push    A
        push    B

        ; X-phase: detect only, destroy in Y-phase
        lda     @ball_seg
        sta     @ball_seg_old
        mov     %1,A
        sta     @hit_defer
        clr     A
        sta     @hit_pending
mb_xstart:

        ; ===========================================================
        ; HORIZONTAL MOVEMENT
        ; ===========================================================
        lda     @ball_dx
        jnz     @mb_xr

        ; Moving LEFT
        lda     @ball_seg
        jz      @mb_xbr              ; at seg 0: bounce
        dec     A
        jmp     @mb_xchk

mb_xbr:
        mov     %1,A
        sta     @ball_dx
        lda     @ball_seg
        inc     A
        jmp     @mb_xchk

mb_xr:
        ; Moving RIGHT
        lda     @ball_seg
        cmp     %BALL_MAX_SEG,A
        jeq     @mb_xbl
        inc     A
        jmp     @mb_xchk

mb_xbl:
        clr     A
        sta     @ball_dx
        lda     @ball_seg
        dec     A

mb_xchk:
        ; A = candidate new_seg
        sta     @ball_seg            ; tentative

        ; Check brick collision at new X position (detect only)
        call    @check_brick_hit
        jnc     mb_xok
        ; X brick hit! Reverse dx, restore X, continue Y
        lda     @ball_dx
        xor     %1,A
        sta     @ball_dx
        lda     @ball_seg_old
        sta     @ball_seg
        ; remember pending brick
        lda     @tmp1
        sta     @hit_row
        lda     @tmp2
        sta     @hit_col
        mov     %1,A
        sta     @hit_pending
        br      @mb_xok

mb_xok:
        ; ===========================================================
        ; VERTICAL MOVEMENT
        ; ===========================================================
        ; Save current ball_y as safe restore point before any Y move
        lda     @ball_y
        sta     @ball_y_old
        ; Arkanoid flat angle: skip dy this frame if ball_flat_tmr>0
        lda     @ball_flat_tmr
        jz      @mb_y_go
        dec     A
        sta     @ball_flat_tmr
        ; Resolve pending X hit even when Y is skipped
        lda     @hit_pending
        jnz     @mb_flat_pending
        br      @mb_done_flat
mb_flat_pending:
        lda     @ball_dy
        jnz     @mb_flat_pd_down
        mov     %1,A
        sta     @ball_dy
        lda     @ball_y_old
        sta     @ball_y
        call    @destroy_pending_brick
        clr     A
        sta     @hit_pending
        br      @mb_done_flat
mb_flat_pd_down:
        call    @destroy_pending_brick
        clr     A
        sta     @hit_pending
        br      @mb_done_flat
mb_done_flat:
        pop     B
        pop     A
        rets
mb_y_go:
        clr     A
        sta     @hit_defer
        mov     %2,A
        sta     @line_cnt
mb_y_loop:
        ; Save current ball_y as safe restore point before each sub-step
        lda     @ball_y
        sta     @ball_y_old
        lda     @ball_dy
        jnz     @mb_yd

        ; Moving UP (sub-step)
        lda     @ball_y
        cmp     %BALL_SUB_STEP,A
        jl     @mb_ybd               ; near top -> bounce down
        sub     %BALL_SUB_STEP,A
        br      @mb_ychk

mb_ybd:
        mov     %1,A
        sta     @ball_dy
        ; Ceiling bounce: keep dx (physical), add ±1 seg nudge to break loops
        call    @rand_next
        and     %1,A
        jz      @mb_ybd_r
        lda     @ball_seg
        jz      @mb_ybd_done
        dec     A
        sta     @ball_seg
        br      @mb_ybd_done
mb_ybd_r:
        lda     @ball_seg
        cmp     %BALL_MAX_SEG,A
        jeq     @mb_ybd_done
        inc     A
        sta     @ball_seg
mb_ybd_done:
        lda     @ball_y
        add     %BALL_SUB_STEP,A
        br      @mb_ychk

mb_yd:
        ; Moving DOWN (sub-step)
        lda     @ball_y
        add     %BALL_SUB_STEP,A

        ; Check if ball bottom reaches paddle area (use full draw height=8, not BALL_H=4)
        sta     @tmp1                ; tmp1 = new_y
        add     %7,A                 ; A = bottom of drawn ball (8 lines)
        cmp     %PADDLE_Y,A
        jhs    @mb_hit_chk2
        br     @mb_ychk2
mb_hit_chk2:
mb_hit_chk:
        cmp     %PADDLE_Y+PADDLE_H,A
        jhs     @mb_lost              ; below paddle

        ; Check horizontal overlap: paddle_x <= ball_seg < paddle_x+W
        lda     @ball_seg
        mov     A,B                  ; B = ball_seg
        lda     @paddle_x
        jz      @mb_left_ok          ; paddle_x=0: no subtract needed
        dec     A                    ; A = paddle_x - 1 (ball 2 segs wide)
mb_left_ok:
        cmp     R0,R1                ; B-A = ball_seg - (paddle_x-1)
        jl     @mb_lost              ; ball fully left of paddle -> miss
        ; compute right edge into tmp2, keep ball_seg in B
        lda     @ball_seg
        sta     @tmp3
        mov     A,B                  ; B = ball_seg
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        add     R0,R1                ; B = paddle_x + paddle_w
        mov     B,A                  ; A = right edge
        sta     @tmp2
        lda     @tmp3
        mov     A,B                  ; B = ball_seg
        lda     @tmp2                ; A = right edge
        cmp     R0,R1                ; B-A = ball_seg - (pad+W)
        jhs     @mb_lost              ; ball_seg >= pad+W -> miss

        ; PADDLE HIT! Bounce up with spin from zone + paddle velocity
        call    @sfx_paddle
        clr     A
        sta     @ball_dy
        mov     %PADDLE_Y-8,A
        sta     @ball_y
        call    @calc_paddle_spin       ; sets ball_dx based on zone+velocity
        ; (speed increase removed — caused auto-paddle to miss)
        ; If paddle is at leftmost and would send ball left: force right
        lda     @paddle_x
        jnz     @mb_pad_spin_ok
        mov     %1,A
        sta     @ball_dx
mb_pad_spin_ok:
        call    @draw_paddle
        br      @mb_done_paddle

mb_done_paddle:
        pop     B
        pop     A
        rets

mb_lost:
        ; Ball lost -> reset on paddle
        pop     B
        pop     A
        lda     @ball_active
        jz      @mb_lost_nosnd
        call    @sfx_lose
mb_lost_nosnd:
        call    @lose_life
        call    @reset_powerups
        ; Mark bricks dirty so editor re-entry and game_start restore correctly.
        lda     @ed_saved
        jz      @mb_lost_nd
        lda     @current_level
        jnz     @mb_lost_nd
        mov     %1,A
        sta     @ed_l0_dirty
mb_lost_nd:
        call    @place_ball_on_paddle
        rets

mb_ychk2:
        lda     @tmp1                ; restore new_y
mb_ychk:
        ; A = candidate new_y
        sta     @ball_y              ; tentative

        call    @check_brick_hit
        jnc     mb_y_miss
        ; Y brick hit! Reverse dy, restore to pre-move Y (safe position)
        lda     @ball_dy
        xor     %1,A
        sta     @ball_dy
        ; Restore ball_y to where it was before this Y step
        ; (snap_ball_y would place ball inside the next brick row because
        ;  BALL_H=4 > gap=2, causing a cascade tunnel through the wall)
        lda     @ball_y_old
        sta     @ball_y
        ; If an X-hit was pending and it's a different brick, destroy it too
        lda     @hit_pending
        jz      @mb_y_hit_done
        lda     @hit_row
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jne     @mb_y_hit_destroy_pending
        lda     @hit_col
        mov     A,B
        lda     @tmp2
        cmp     R0,R1
        jeq     @mb_y_hit_done
mb_y_hit_destroy_pending:
        call    @destroy_pending_brick
mb_y_hit_done:
        clr     A
        sta     @hit_pending
        jmp     @mb_done

mb_y_miss:
        lda     @hit_pending
        jnz     @mb_y_pending
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @mb_y_loop_more
        jmp     @mb_y_loop_done
mb_y_loop_more:
        br      @mb_y_loop
mb_y_loop_done:
        ; Post-overlap safety check: if ball ended inside a brick, destroy & bounce
        clr     A
        sta     @hit_defer
        call    @check_brick_hit
        jnc     @mb_y_loop_nohit
        lda     @ball_dy
        xor     %1,A
        sta     @ball_dy
        lda     @ball_y_old
        sta     @ball_y
        clr     A
        sta     @hit_pending
        jmp     @mb_done
mb_y_loop_nohit:
        jmp     @mb_done
mb_y_pending:
        ; If moving up, force a vertical bounce on pending X hit
        lda     @ball_dy
        jnz     @mb_y_pd_down
        mov     %1,A
        sta     @ball_dy
        ; Restore ball_y to safe position (same fix: avoid snap into next row)
        lda     @ball_y_old
        sta     @ball_y
        call    @destroy_pending_brick
        clr     A
        sta     @hit_pending
        jmp     @mb_done
mb_y_pd_down:
        call    @destroy_pending_brick
        clr     A
        sta     @hit_pending
        jmp     @mb_done

mb_done:
        pop     B
        pop     A
        rets

; ============================================================================
; CHECK_BRICK_HIT - Test if ball overlaps a brick, destroy if found
; ============================================================================
; ============================================================================
; ============================================================================

; byte_to_hex: A in → A=hi ASCII, B=lo ASCII
byte_to_hex:
        push    A
        rr      A
        rr      A
        rr      A
        rr      A
        and     %$0F,A
        add     %$30,A
        cmp     %$3A,A
        jl      @bth1
        add     %7,A
bth1:   mov     A,B
        pop     A
        push    B
        and     %$0F,A
        add     %$30,A
        cmp     %$3A,A
        jl      @bth2
        add     %7,A
bth2:   mov     A,B
        pop     A
        rets

; Uses ball_seg and ball_y from SRAM
; OUT: C=1 if hit (brick destroyed), C=0 if no hit
; ============================================================================
check_brick_hit:
        push    A
        push    B

        ; X-phase: try leading edge first, then trailing edge
        lda     @hit_defer
        jz     @cbh_yphase_local

        lda     @ball_dy
        jnz     @cbh_x_down
        ; moving up: top edge first
        lda     @ball_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        lda     @ball_y
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        ; mid probes
        lda     @ball_y
        add     %3,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        lda     @ball_y
        add     %4,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        ; corner sweep: also sample at y - BALL_DY_STEP
        lda     @ball_y
        sub     %BALL_DY_STEP,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        lda     @ball_y
        sub     %BALL_DY_STEP,A
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_x
        br      @cbh_miss
cbh_have_row_x:
        br      @cbh_have_row_local
cbh_yphase_local:
        jmp     @cbh_yphase
cbh_x_down:
        ; moving down: bottom edge first
        lda     @ball_y
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        lda     @ball_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        ; mid probes
        lda     @ball_y
        add     %3,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        lda     @ball_y
        add     %4,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        ; corner sweep: also sample at y + BALL_DY_STEP
        lda     @ball_y
        add     %BALL_DY_STEP,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        lda     @ball_y
        add     %BALL_DY_STEP,A
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row_xd
        br      @cbh_miss
cbh_have_row_xd:
        br      @cbh_have_row_local

cbh_yphase:
        ; Y-phase: try leading edge first, then trailing edge
        lda     @ball_dy
        jnz     @cbh_y_down
        ; moving up: top edge first
        lda     @ball_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        lda     @ball_y
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        ; mid probes
        lda     @ball_y
        add     %3,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        lda     @ball_y
        add     %4,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        br      @cbh_miss
cbh_y_down:
        ; moving down: bottom edge first
        lda     @ball_y
        add     %BALL_DRAW_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        lda     @ball_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        ; mid probes
        lda     @ball_y
        add     %3,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        lda     @ball_y
        add     %4,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cbh_have_row
        br      @cbh_miss

cbh_have_row_local:
        jmp     @cbh_have_row

cbh_have_row:
        ; tmp1 already set by probe

        ; brick_col = ball_seg / 2
        ; ball_seg is game-relative (0-based), brick col c occupies segs 2c..2c+1
        lda     @ball_seg
        clrc
        rr      A
        sta     @tmp2                ; tmp2 = brick_col
        cmp     %BRICK_COLS,A
        jl     @cbh_col_ok
        br      @cbh_miss
cbh_col_ok:

        ; index = row * BRICK_COLS + col
        lda     @tmp1
        mpy     %BRICK_COLS,A        ; B = row * BRICK_COLS
        lda     @tmp2
        add     R0,R1                ; B = index

        ; Alive?
        lda     @bricks(B)
        jnz     @cbh_alive

        ; X-phase: try previous X column (side hit)
        lda     @hit_defer
        jz      @cbh_miss_local
        br      @cbh_try_oldcol
cbh_try_oldcol:
        lda     @ball_seg_old
        clrc
        rr      A
        sta     @tmp3               ; old_col
        lda     @tmp2
        mov     A,B
        lda     @tmp3
        cmp     R0,R1
        jnz     @cbh_oldcol_ok
        br      @cbh_miss_local
cbh_oldcol_ok:
        lda     @tmp3
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jl      @cbh_oldcol_in
        br      @cbh_miss_local
cbh_oldcol_in:
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jnz     @cbh_alive
        br      @cbh_miss_local
cbh_miss_local:
        pop     B
        pop     A
        clrc
        rets
cbh_alive:
        sta     @tmp3

        ; === DESTROY (unless deferred) ===
        lda     @hit_defer
        jz      @cbh_do_destroy
        br      @cbh_no_destroy
cbh_do_destroy:
        clr     A
        sta     @no_brick_tmr       ; reset nudge timer: a brick was just hit
        ; Explosive brick
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @cbh_chk_indes
        call    @explode_brick      ; destroy self + neighbors
        br      @cbh_no_destroy     ; bounce handled, skip normal destroy
cbh_chk_indes:
        ; Indestructible brick: just bounce, redraw explicitly
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @cbh_chk_armor
        clr     A
        sta     @no_brick_tmr       ; hitting indes still counts — reset nudge timer
        lda     @tmp3               ; A = color for draw
        call    @draw_one_brick     ; redraw using exact tmp1/tmp2 from probe
        br      @cbh_no_destroy
cbh_chk_armor:
        ; Armor brick: 2-hit mechanic
        lda     @tmp3
        cmp     %BRICK_COLOR_ARMOR,A
        jne     @cbh_chk_arm2
        mov     %BRICK_COLOR_ARMOR2,A  ; downgrade to damaged
        sta     @bricks(B)
        call    @draw_one_brick        ; redraw cracked
        call    @sfx_brick
        jmp     @cbh_no_destroy
cbh_chk_arm2:
        cmp     %BRICK_COLOR_ARMOR2,A
        jne     @cbh_chk_power
        call    @sfx_brick             ; second hit: destroy
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        jmp     @cbh_no_destroy        ; no score for armor
cbh_chk_power:
        cmp     %BRICK_COLOR_POWER,A
        jne     @cbh_no_power
        call    @spawn_powerup
cbh_no_power:
        call    @sfx_brick
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
cbh_no_destroy:

        pop     B
        pop     A
        setc
        rets

cbh_miss:
        pop     B
        pop     A
        clrc
        rets

; PROBE_BRICK_AT_Y - set tmp1=row if A is inside a brick row (not gap)
; OUT: probe_hit = 1 if inside brick row, 0 otherwise
probe_brick_at_y:
        push    A
        clr     A
        sta     @probe_hit
        pop     A
        cmp     %BRICK_START_Y,A
        jl     @pby_miss
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @pby_miss          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @pby_miss
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @pby_miss
        mov     B,A
        sta     @tmp1
        mov     %1,A
        sta     @probe_hit
pby_miss:
        rets

; SNAP_BALL_Y - clamp ball Y to brick boundary after a Y hit
; Uses tmp1 (brick_row) and ball_dy (new direction)
snap_ball_y:
        push    A
        push    B
        lda     @tmp1
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @cur_y              ; brick_y
        lda     @ball_dy
        jnz     @sby_down
        ; moving up: place ball just above brick
        lda     @cur_y
        sub     %BALL_H,A
        sta     @ball_y
        jmp     @sby_done
sby_down:
        ; moving down: place ball just below brick
        lda     @cur_y
        add     %BRICK_H,A
        sta     @ball_y
sby_done:
        pop     B
        pop     A
        rets

; SNAP_BALL_X - clamp ball X to brick boundary after an X hit
; Uses tmp2 (brick_col) and ball_dx (new direction)
snap_ball_x:
        push    A
        push    B
        lda     @tmp2
        clrc
        rl      A                    ; A = col * 2
        sta     @brick_idx
        lda     @ball_dx
        jnz     @sbx_right
        ; moving left: place ball just left of brick
        lda     @brick_idx
        jz     @sbx_left_clamp
        dec     A
        jmp     @sbx_store
sbx_left_clamp:
        clr     A
        jmp     @sbx_store
sbx_right:
        lda     @brick_idx
        add     %BRICK_W,A
        cmp     %BALL_MAX_SEG,A
        jhs     @sbx_right_clamp
        jmp     @sbx_store
sbx_right_clamp:
        mov     %BALL_MAX_SEG,A
sbx_store:
        sta     @ball_seg
        pop     B
        pop     A
        rets

; RESTORE_BRICK_UNDER_BALL - redraw brick under old ball position (if any)
restore_brick_under_ball:
        push    A
        push    B
        ; Restore all 8 lines erased by erase_ball
        lda     @ball_y
        call    @restore_brick_at_y
        lda     @ball_y
        add     %1,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %2,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %3,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %4,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %5,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %6,A
        call    @restore_brick_at_y
        lda     @ball_y
        add     %7,A
        call    @restore_brick_at_y
        pop     B
        pop     A
        rets

; RESTORE_BRICK_AT_Y - redraw brick at a specific Y sample (A)
restore_brick_at_y:
        push    A
        push    B
        cmp     %BRICK_START_Y,A
        jl     @rby_miss
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @rby_miss          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @rby_miss

        ; B = row
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @rby_miss
        mov     B,A
        sta     @tmp1

        ; brick_col = ball_seg / 2  (game-relative, no offset needed)
        lda     @ball_seg
        clrc
        rr      A
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @rby_miss

        ; index = row * BRICK_COLS + col
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1

        ; Alive? redraw
        lda     @bricks(B)
        jz     @rby_miss
        call    @draw_one_brick

rby_miss:
        pop     B
        pop     A
        rets

; DESTROY_PENDING_BRICK - destroy brick stored in hit_row/hit_col
destroy_pending_brick:
        push    A
        push    B
        lda     @hit_row
        sta     @tmp1
        lda     @hit_col
        sta     @tmp2
        lda     @tmp1
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jl      @dpb_row_ok
        br      @dpb_done
dpb_row_ok:
        mov     B,A
        lda     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @dpb_done
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1                ; B = index
        lda     @bricks(B)
        jz     @dpb_done
        sta     @tmp3
        ; Explosive brick
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @dpb_chk_indes
        call    @explode_brick
        br      @dpb_no_destroy
dpb_chk_indes:
        ; Indestructible brick: just bounce, redraw explicitly
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @dpb_chk_armor
        lda     @tmp3               ; A = color for draw
        call    @draw_one_brick     ; redraw using exact tmp1/tmp2 from probe
        br      @dpb_no_destroy
dpb_chk_armor:
        ; Armor brick: 2-hit mechanic
        lda     @tmp3
        cmp     %BRICK_COLOR_ARMOR,A
        jne     @dpb_chk_arm2
        mov     %BRICK_COLOR_ARMOR2,A  ; downgrade to damaged
        sta     @bricks(B)
        call    @draw_one_brick        ; redraw cracked
        call    @sfx_brick
        br      @dpb_no_destroy
dpb_chk_arm2:
        cmp     %BRICK_COLOR_ARMOR2,A
        jne     @dpb_chk_power
        call    @sfx_brick             ; second hit: destroy
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        br      @dpb_no_destroy        ; no score for armor
dpb_chk_power:
        cmp     %BRICK_COLOR_POWER,A
        jne     @dpb_no_power
        call    @spawn_powerup
dpb_no_power:
        call    @sfx_brick
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
dpb_no_destroy:
dpb_done:
        pop     B
        pop     A
        rets

; ============================================================================
; POWERUPS
; ============================================================================
reset_powerups:
        push    A
        push    B
        lda     @power_active
        jz     @rp_no_drop
        call    @erase_powerup
        clr     A
        sta     @power_active
rp_no_drop:
        lda     @bullet1_y
        cmp     %$FF,A
        jeq     @rp_b2
        call    @erase_bullet1
        mov     %$FF,A
        sta     @bullet1_y
rp_b2:
        lda     @bullet2_y
        cmp     %$FF,A
        jeq     @rp_bdone
        call    @erase_bullet2
        mov     %$FF,A
        sta     @bullet2_y
rp_bdone:
        ; erase current paddle (size may be wide)
        call    @erase_paddle

        clr     A
        sta     @power_type
        sta     @active_power
        sta     @fire_active
        lda     @difficulty         ; restore speed to chosen difficulty
        sta     @ball_speed
        sta     @ball_tmr
        call    @draw_speed
        mov     %PADDLE_W_BASE,A
        sta     @paddle_w
        mov     %PADDLE_MAX_BASE,A
        sta     @paddle_max
        mov     %12,A
        sta     @paddle_bytes

        ; clamp paddle_x if needed
        lda     @paddle_x
        mov     A,B
        lda     @paddle_max
        cmp     R0,R1
        jl     @rp_ok
        lda     @paddle_max
        sta     @paddle_x
rp_ok:
        call    @draw_paddle
        call    @draw_power_indicator
        pop     B
        pop     A
        rets

update_powerup:
        push    A
        push    B
        lda     @power_active
        jz     @up_done
        lda     @power_tmr
        dec     A
        sta     @power_tmr
        jnz     @up_done
        mov     %POWER_FALL_SPEED,A
        sta     @power_tmr

        call    @erase_powerup
        lda     @power_y
        inc     A
        sta     @power_y

        ; check vertical overlap with paddle
        lda     @power_y
        add     %BALL_H-1,A
        cmp     %PADDLE_Y,A
        jl     @up_draw
        cmp     %PADDLE_Y+PADDLE_H,A
        jhs     @up_miss

        ; check horizontal overlap with paddle
        lda     @power_seg
        sta     @tmp3
        mov     A,B
        lda     @paddle_x
        cmp     R0,R1
        jl     @up_draw
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        add     R0,R1                ; B = paddle_x + paddle_w
        mov     B,A                  ; A = right edge
        sta     @tmp2
        lda     @tmp3
        mov     A,B                  ; B = power_seg
        lda     @tmp2                ; A = right edge
        cmp     R0,R1
        jhs     @up_draw

        ; caught
        ; sfx removed
        call    @apply_powerup
        clr     A
        sta     @power_active
        jmp     @up_done

up_miss:
        clr     A
        sta     @power_active
        jmp     @up_done

up_draw:
        call    @draw_powerup

up_done:
        pop     B
        pop     A
        rets

spawn_powerup:
        push    A
        push    B
        lda     @power_active
        jnz     @sp_done
        mov     %1,A
        sta     @power_active
        mov     %POWER_FALL_SPEED,A
        sta     @power_tmr

        ; power type from map (fallback to random if empty; skip map if editor mode)
        lda     @ed_saved
        jnz     @sp_rand            ; editor mode: always random (power_map has stale data)
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @power_map(B)
        jnz     @sp_type_ok
sp_rand:
        call    @rand_next
        sta     @tmp3
sp_mod4:
        lda     @tmp3
        cmp     %4,A
        jl     @sp_mod_ok
        sub     %4,A
        sta     @tmp3
        br      @sp_mod4
sp_mod_ok:
        lda     @tmp3
        jz     @sp_pick_slow
        cmp     %1,A
        jeq     @sp_pick_wide
        cmp     %2,A
        jeq     @sp_pick_fire
        mov     %POWER_TYPE_LIFE,A
        br      @sp_type_ok
sp_pick_slow:
        mov     %POWER_TYPE_SLOW,A
        br      @sp_type_ok
sp_pick_wide:
        mov     %POWER_TYPE_WIDE,A
        br      @sp_type_ok
sp_pick_fire:
        mov     %POWER_TYPE_FIRE,A
sp_type_ok:
        sta     @power_type

        ; power_seg = col*2 + 1
        lda     @tmp2
        clrc
        rl      A
        inc     A
        sta     @power_seg

        ; power_y = brick_y + 2
        lda     @tmp1
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        add     %2,A
        sta     @power_y
        call    @draw_powerup
sp_done:
        pop     B
        pop     A
        rets

apply_powerup:
        push    A
        push    B
        lda     @power_type
        cmp     %POWER_TYPE_SLOW,A
        jeq     @ap_slow
        cmp     %POWER_TYPE_WIDE,A
        jeq     @ap_wide
        cmp     %POWER_TYPE_FIRE,A
        jeq     @ap_fire
        cmp     %POWER_TYPE_LIFE,A
        jeq     @ap_life
        jmp     @ap_done

ap_slow:
        clr     A
        sta     @fire_active
        mov     %BALL_SPEED_SLOW,A
        sta     @ball_speed
        sta     @ball_tmr
        call    @draw_speed
        mov     %POWER_TYPE_SLOW,A
        sta     @active_power
        jmp     @ap_done

ap_wide:
        clr     A
        sta     @fire_active
        call    @erase_paddle
        mov     %PADDLE_W_WIDE,A
        sta     @paddle_w
        mov     %PADDLE_MAX_WIDE,A
        sta     @paddle_max
        mov     %18,A
        sta     @paddle_bytes
        ; clamp paddle_x
        lda     @paddle_x
        mov     A,B
        lda     @paddle_max
        cmp     R0,R1
        jl     @ap_wide_draw
        lda     @paddle_max
        sta     @paddle_x
ap_wide_draw:
        call    @draw_paddle
        mov     %POWER_TYPE_WIDE,A
        sta     @active_power
        jmp     @ap_done

ap_fire:
        clr     A
        mov     %1,A
        sta     @fire_active
        mov     %POWER_TYPE_FIRE,A
        sta     @active_power
        call    @draw_paddle
        jmp     @ap_done

ap_life:
        call    @add_life
        jmp     @ap_done

ap_done:
        call    @draw_power_indicator
        pop     B
        pop     A
        rets

draw_power_indicator:
        rets

; ============================================================================
; SCORE DISPLAY
; ============================================================================
draw_score:
        push    A
        push    B
        mov     %SCORE_Y,A
        sta     @digit_y
        ; thousands
        mov     %SCORE_X_SEG,B
        lda     @score_d3
        call    @draw_digit20
        ; hundreds
        mov     %SCORE_X_SEG+SCORE_STEP_SEG,B
        lda     @score_d2
        call    @draw_digit20
        ; tens
        mov     %SCORE_X_SEG+SCORE_STEP_SEG+SCORE_STEP_SEG,B
        lda     @score_d1
        call    @draw_digit20
        ; units
        mov     %SCORE_X_SEG+SCORE_STEP_SEG+SCORE_STEP_SEG+SCORE_STEP_SEG,B
        lda     @score_d0
        call    @draw_digit20
        pop     B
        pop     A
        rets

draw_score_label:
        push    A
        push    B
        mov     %SCORE_LABEL_Y,A
        sta     @label_y
        mov     %SCORE_LABEL_X_SEG,B
        mov     %0,A                 ; S
        call    @draw_label_simple_char
        mov     %SCORE_LABEL_X_SEG+LABEL_SIMPLE_STEP,B
        mov     %1,A                 ; C
        call    @draw_label_simple_char
        mov     %SCORE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %2,A                 ; O
        call    @draw_label_simple_char
        mov     %SCORE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %3,A                 ; R
        call    @draw_label_simple_char
        mov     %SCORE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %4,A                 ; E
        call    @draw_label_simple_char
        pop     B
        pop     A
        rets

draw_speed_label:
        push    A
        push    B
        mov     %SPEED_LABEL_Y,A
        sta     @label_y
        mov     %VITESSE_LABEL_X_SEG,B
        mov     %6,A                 ; V
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP,B
        mov     %7,A                 ; I
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %8,A                 ; T
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %4,A                 ; E
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %0,A                 ; S
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %0,A                 ; S
        call    @draw_label_simple_char
        mov     %VITESSE_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %4,A                 ; E
        call    @draw_label_simple_char
        pop     B
        pop     A
        rets

draw_level_label:
        push    A
        push    B
        mov     %LEVEL_LABEL_Y,A
        sta     @label_y
        mov     %LEVEL_LABEL_X_SEG,B
        mov     %9,A                 ; N
        call    @draw_label_simple_char
        mov     %LEVEL_LABEL_X_SEG+LABEL_SIMPLE_STEP,B
        mov     %7,A                 ; I
        call    @draw_label_simple_char
        mov     %LEVEL_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %6,A                 ; V
        call    @draw_label_simple_char
        mov     %LEVEL_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %4,A                 ; E
        call    @draw_label_simple_char
        mov     %LEVEL_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %10,A                ; A
        call    @draw_label_simple_char
        mov     %LEVEL_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %11,A                ; U
        call    @draw_label_simple_char
        pop     B
        pop     A
        rets

draw_lives_label:
        push    A
        push    B
        mov     %LIVES_LABEL_Y,A
        sta     @label_y
        mov     %VIES_LABEL_X_SEG,B
        mov     %6,A                 ; V
        call    @draw_label_simple_char
        mov     %VIES_LABEL_X_SEG+LABEL_SIMPLE_STEP,B
        mov     %7,A                 ; I
        call    @draw_label_simple_char
        mov     %VIES_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %4,A                 ; E
        call    @draw_label_simple_char
        mov     %VIES_LABEL_X_SEG+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP+LABEL_SIMPLE_STEP,B
        mov     %0,A                 ; S
        call    @draw_label_simple_char
        pop     B
        pop     A
        rets

draw_speed:
        push    A
        push    B
        mov     %SPEED_Y,A
        sta     @digit_y
        lda     @ball_speed
        sta     @tmp2                ; remainder
        clr     A
        sta     @tmp1                ; tens
ds_div10:
        lda     @tmp2
        cmp     %10,A
        jl     @ds_done
        sub     %10,A
        sta     @tmp2
        lda     @tmp1
        inc     A
        sta     @tmp1
        br      @ds_div10
ds_done:
        lda     @tmp1
        sta     @speed_tens
        lda     @tmp2
        sta     @speed_units
        mov     %SPEED_X_SEG,B
        lda     @speed_tens
        call    @draw_digit20
        mov     %SPEED_X_SEG+SCORE_STEP_SEG,B
        lda     @speed_units
        call    @draw_digit20
        pop     B
        pop     A
        rets

draw_level:
        push    A
        push    B
        mov     %LEVEL_Y,A
        sta     @digit_y
        mov     %LEVEL_X_SEG,B
        lda     @level_d1
        call    @draw_digit20
        mov     %LEVEL_X_SEG+SCORE_STEP_SEG,B
        lda     @level_d0
        call    @draw_digit20
        pop     B
        pop     A
        rets

; ============================================================================
; TITLE: "EXELNOID"
; ============================================================================
draw_title_game:
        push    A
        push    B
        mov     %4,A
        sta     @cur_y
        ; block 0 (rows 0-18)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dtg0_row:
        lda     @loop_i
        mpy     %12,A       ; B = row * TITLE_W_SEG
        mov     B,A
        sta     @tmp1
        mov     %28,B
        lda     @cur_y
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dtg0_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl0(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dtg0_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dtg0_row

        ; block 1 (rows 19-37)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dtg1_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %28,B
        lda     @cur_y
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dtg1_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl1(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dtg1_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dtg1_row

        ; block 2 (rows 38-56)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dtg2_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %28,B
        lda     @cur_y
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dtg2_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl2(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dtg2_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dtg2_row

        ; block 3 (rows 57-73)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dtg3_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %28,B
        lda     @cur_y
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dtg3_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl3(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dtg3_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dtg3_row

        pop     B
        pop     A
        rets

draw_lives:
        push    A
        push    B
        mov     %LIVES_Y,A
        sta     @digit_y
        mov     %LIVES_X_SEG,B
        lda     @lives_d1
        call    @draw_digit20
        mov     %LIVES_X_SEG+SCORE_STEP_SEG,B
        lda     @lives_d0
        call    @draw_digit20
        pop     B
        pop     A
        rets

draw_game_over:
        push    A
        push    B
        mov     %GAME_OVER_Y,A
        sta     @label_y
        mov     %GAME_OVER_X_SEG,B
        mov     %12,A                ; P
        call    @draw_label_char
        mov     %GAME_OVER_X_SEG+LABEL_STEP_SEG,B
        mov     %4,A                 ; E
        call    @draw_label_char
        mov     %GAME_OVER_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %3,A                 ; R
        call    @draw_label_char
        mov     %GAME_OVER_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %15,A                ; D
        call    @draw_label_char
        mov     %GAME_OVER_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %13,A                ; U
        call    @draw_label_char
        pop     B
        pop     A
        rets

draw_pause:
        push    A
        push    B
        mov     %PAUSE_Y,A
        sta     @label_y
        mov     %PAUSE_X_SEG,B
        mov     %12,A                ; P
        call    @draw_label_char
        mov     %PAUSE_X_SEG+LABEL_STEP_SEG,B
        mov     %10,A                ; A
        call    @draw_label_char
        mov     %PAUSE_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %13,A                ; U
        call    @draw_label_char
        mov     %PAUSE_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %0,A                 ; S
        call    @draw_label_char
        mov     %PAUSE_X_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG+LABEL_STEP_SEG,B
        mov     %4,A                 ; E
        call    @draw_label_char
        pop     B
        pop     A
        rets

; ============================================================================
; DRAW_LOGO_GAME_AREA
; Draw the EXELNOID logo bitmap centred in the game area (12 segs at seg 8).
; Caller sets cur_y before calling. Uses line_cnt (OK outside game loop).
; ============================================================================
draw_logo_game_area:
        push    A
        push    B
        ; block 0 (19 rows)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dlga0_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %8,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dlga0_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl0(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl0(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dlga0_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dlga0_row
        ; block 1 (19 rows)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dlga1_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %8,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dlga1_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl1(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl1(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dlga1_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dlga1_row
        ; block 2 (19 rows)
        mov     %19,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dlga2_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %8,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dlga2_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl2(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl2(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dlga2_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dlga2_row
        ; block 3 (17 rows)
        mov     %17,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
dlga3_row:
        lda     @loop_i
        mpy     %12,A
        mov     B,A
        sta     @tmp1
        mov     %8,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        mov     %12,A
        sta     @loop_j
dlga3_seg:
        lda     @tmp1
        mov     A,B
        lda     @gtitle_b_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_g_tbl3(B)
        movp    A,P46
        lda     @tmp1
        mov     A,B
        lda     @gtitle_r_tbl3(B)
        movp    A,P46
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @dlga3_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dlga3_row
        pop     B
        pop     A
        rets

; ============================================================================
; ============================================================================
; CLEAR_GAME_AREA_ONLY — clears the game area (segs 0..26) without touching HUD
; ============================================================================
clear_game_area_only:
        push    A
        push    B
        clr     A
        sta     @cur_y
cga_row:
        lda     @cur_y
        cmp     %222,A
        jhs     @cga_done
        ; Clear seg 0..26 on this row (27 segments)
        clr     A
        sta     @line_cnt           ; segment counter
cga_seg:
        lda     @line_cnt
        mov     A,B
        lda     @cur_y
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @line_cnt
        inc     A
        sta     @line_cnt
        cmp     %27,A
        jl      @cga_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        br      @cga_row
cga_done:
        pop     B
        pop     A
        rets

; SFX_VICTORY - triumphant fanfare: ascending run + chord stabs + final hold
; Buzzer via xorp %8,P6. Inner loop N ≈ frequency.
; ~4MHz: period = N*4 cycles → freq ≈ 1000000/N Hz
sfx_victory:
        push    A
        push    B
        ; Short pause before fanfare starts
        eint
        mov     %200,B
sv_wait_lp:
        call    @frame_delay
        djnz    B,sv_wait_lp
        dint
        movp    P6,A
        and     %$F7,A
        movp    A,P6            ; silence

        ; Repeat melody 4 times
        mov     %4,A
        sta     @tmp1
sv_loop:
        ; --- Quick ascending run: C4 D4 E4 F4 G4 A4 B4 C5 ---
        ; C4 (inner=250, 15 half)
        mov     %15,B
sv_r1:  mov     %8,A
        xorp    A,P6
        mov     %250,A
sv_r1i: dec     A
        jnz     @sv_r1i
        djnz    B,sv_r1
        ; D4 (inner=222, 15 half)
        mov     %15,B
sv_r2:  mov     %8,A
        xorp    A,P6
        mov     %222,A
sv_r2i: dec     A
        jnz     @sv_r2i
        djnz    B,sv_r2
        ; E4 (inner=198, 15 half)
        mov     %15,B
sv_r3:  mov     %8,A
        xorp    A,P6
        mov     %198,A
sv_r3i: dec     A
        jnz     @sv_r3i
        djnz    B,sv_r3
        ; F4 (inner=187, 15 half)
        mov     %15,B
sv_r4:  mov     %8,A
        xorp    A,P6
        mov     %187,A
sv_r4i: dec     A
        jnz     @sv_r4i
        djnz    B,sv_r4
        ; G4 (inner=167, 15 half)
        mov     %15,B
sv_r5:  mov     %8,A
        xorp    A,P6
        mov     %167,A
sv_r5i: dec     A
        jnz     @sv_r5i
        djnz    B,sv_r5
        ; A4 (inner=148, 15 half)
        mov     %15,B
sv_r6:  mov     %8,A
        xorp    A,P6
        mov     %148,A
sv_r6i: dec     A
        jnz     @sv_r6i
        djnz    B,sv_r6
        ; B4 (inner=132, 15 half)
        mov     %15,B
sv_r7:  mov     %8,A
        xorp    A,P6
        mov     %132,A
sv_r7i: dec     A
        jnz     @sv_r7i
        djnz    B,sv_r7
        ; C5 stab (inner=125, 30 half)
        mov     %30,B
sv_c5s: mov     %8,A
        xorp    A,P6
        mov     %125,A
sv_c5si:dec     A
        jnz     @sv_c5si
        djnz    B,sv_c5s

        ; --- Gap ---
        mov     %100,A
sv_g1:  dec     A
        jnz     @sv_g1

        ; --- Chord stab 1: E5 (inner=99, 25 half) ---
        mov     %25,B
sv_e5:  mov     %8,A
        xorp    A,P6
        mov     %99,A
sv_e5i: dec     A
        jnz     @sv_e5i
        djnz    B,sv_e5
        ; gap
        mov     %80,A
sv_g2:  dec     A
        jnz     @sv_g2
        ; --- Chord stab 2: G5 (inner=83, 25 half) ---
        mov     %25,B
sv_g5:  mov     %8,A
        xorp    A,P6
        mov     %83,A
sv_g5i: dec     A
        jnz     @sv_g5i
        djnz    B,sv_g5
        ; gap
        mov     %80,A
sv_g3:  dec     A
        jnz     @sv_g3

        ; --- Final long C6 (inner=62, 120 half-periods) ---
        mov     %120,B
sv_c6:  mov     %8,A
        xorp    A,P6
        mov     %62,A
sv_c6i: dec     A
        jnz     @sv_c6i
        djnz    B,sv_c6

        ; --- Gap between repeats ---
        mov     %200,A
sv_gap: dec     A
        jnz     @sv_gap
        lda     @tmp1
        dec     A
        sta     @tmp1
        jz      @sv_done
        br      @sv_loop
sv_done:
        ; --- Silence ---
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        eint
        pop     B
        pop     A
        rets

; DRAW_BRAVO_SCREEN
; Shown when all 3 levels are cleared. Displays "BRAVO" + logo in game area.
; Waits for SPACE then returns to difficulty/intro screen.
; B=16, R=3, A=10, V=8, M=2  centred at x=9 y=40
; Logo at y=62
; ============================================================================
draw_bravo_screen:
        push    A
        push    B
        call    @clear_game_area_only
        call    @draw_border
        ; --- "BRAVO" in white large labels ---
        mov     %40,A
        sta     @label_y
        mov     %9,B
        mov     %16,A               ; B
        call    @draw_label_char
        mov     %11,B
        mov     %3,A                ; R
        call    @draw_label_char
        mov     %13,B
        mov     %10,A               ; A
        call    @draw_label_char
        mov     %15,B
        mov     %8,A                ; V
        call    @draw_label_char
        mov     %17,B
        mov     %2,A                ; O
        call    @draw_label_char
        ; --- Logo below BRAVO ---
        mov     %62,A
        sta     @cur_y
        call    @draw_logo_game_area
        ; --- Victory text below logo ---
        mov     %138,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt1,TEMP1
        call    @draw_text_line_green
        mov     %146,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt2,TEMP1
        call    @draw_text_line_green
        mov     %158,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt3,TEMP1
        call    @draw_text_line_green
        mov     %166,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt4,TEMP1
        call    @draw_text_line_green
        mov     %178,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt5,TEMP1
        call    @draw_text_line_green
        mov     %186,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt6,TEMP1
        call    @draw_text_line_green
        mov     %198,A
        sta     @text_y
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        movd    %bravo_txt7,TEMP1
        call    @draw_text_line_green
        ; --- Play victory music AFTER text is displayed ---
        call    @sfx_victory
        ; --- Wait for SPACE ---
dbs_wait:
        call    @frame_delay
        mov     VALUE0,A
        cmp     %KEY_SPACE,A
        jne     @dbs_wait
        pop     B
        pop     A
        ; Return to difficulty/intro
        call    @show_difficulty_menu
        call    @game_start
        br      @main_loop

clear_game_over:
        push    A
        push    B
        mov     %GAME_OVER_Y,A
        sta     @cur_y
        mov     %LABEL_H,A          ; row counter in A (line_cnt=$C40A=key_last!)
cgo_lp:
        push    A
        mov     %GAME_OVER_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %GAME_OVER_SEGS,B
cgo_seg:
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        djnz    B,cgo_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        pop     A
        dec     A
        jnz     @cgo_lp
        pop     B
        pop     A
        rets

; ============================================================================
; CHECK_KONAMI: detect UP UP DN DN LF RT LF RT B A while paused
; ============================================================================
check_konami:
        push    A
        push    B
        lda     @key_cur
        jnz     @ckk_has_key
        br      @ckk_done
ckk_has_key:
        cmp     %$86,A
        jne     @ckk_g1
        br      @ckk_done
ckk_g1:
        cmp     %$04,A
        jne     @ckk_g2
        br      @ckk_done
ckk_g2:
        ; Only process new keypresses
        lda     @key_last
        mov     A,B
        lda     @key_cur
        cmp     R0,R1
        jne     @ckk_newkey
        br      @ckk_done
ckk_newkey:
        lda     @konami_idx
        jnz     @ckk_n1
        mov     %$80,B
        br      @ckk_chk
ckk_n1: cmp     %1,A
        jne     @ckk_n2
        mov     %$80,B
        br      @ckk_chk
ckk_n2: cmp     %2,A
        jne     @ckk_n3
        mov     %$82,B
        br      @ckk_chk
ckk_n3: cmp     %3,A
        jne     @ckk_n4
        mov     %$82,B
        br      @ckk_chk
ckk_n4: cmp     %4,A
        jne     @ckk_n5
        mov     %$83,B
        br      @ckk_chk
ckk_n5: cmp     %5,A
        jne     @ckk_n6
        mov     %$81,B
        br      @ckk_chk
ckk_n6: cmp     %6,A
        jne     @ckk_n7
        mov     %$83,B
        br      @ckk_chk
ckk_n7: cmp     %7,A
        jne     @ckk_n8
        mov     %$81,B
        br      @ckk_chk
ckk_n8: cmp     %8,A
        jne     @ckk_n9
        mov     %$42,B
        br      @ckk_chk
ckk_n9: mov     %$41,B
ckk_chk:
        lda     @key_cur
        cmp     R0,R1
        jne     @ckk_wrong
        lda     @konami_idx
        inc     A
        sta     @konami_idx
        cmp     %KONAMI_LEN,A
        jne     @ckk_done
        ; Complete: toggle auto_mode and unpause
        lda     @auto_mode
        xor     %1,A
        sta     @auto_mode
        clr     A
        sta     @konami_idx
        sta     @paused
        sta     @pause_latch
        call    @clear_pause
        br      @ckk_done
ckk_wrong:
        clr     A
        sta     @konami_idx
ckk_done:
        pop     B
        pop     A
        rets






clear_pause:
        push    A
        push    B
        mov     %LABEL_H,A
        sta     @line_cnt
        mov     %PAUSE_Y,A
        sta     @cur_y
cp_lp:
        mov     %PAUSE_X_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %PAUSE_SEGS,B
cp_seg:
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        djnz    B,cp_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @cp_lp
        pop     B
        pop     A
        rets

add_score:
        push    A
        lda     @score_d0
        inc     A
        cmp     %10,A
        jl     @as_store0
        clr     A
        sta     @score_d0
        lda     @score_d1
        inc     A
        cmp     %10,A
        jl     @as_store1
        clr     A
        sta     @score_d1
        lda     @score_d2
        inc     A
        cmp     %10,A
        jl     @as_store2
        clr     A
        sta     @score_d2
        lda     @score_d3
        inc     A
        cmp     %10,A
        jl     @as_store3
        clr     A
as_store3:
        sta     @score_d3
        br      @as_done
as_store2:
        sta     @score_d2
        br      @as_done
as_store1:
        sta     @score_d1
        br      @as_done
as_store0:
        sta     @score_d0
as_done:
        call    @draw_score
        pop     A
        rets

add_life:
        push    A
        lda     @lives_d0
        cmp     %9,A
        jl     @al_inc0
        clr     A
        sta     @lives_d0
        lda     @lives_d1
        cmp     %9,A
        jl     @al_inc1
        br      @al_done
al_inc1:
        inc     A
        sta     @lives_d1
        br      @al_done
al_inc0:
        inc     A
        sta     @lives_d0
al_done:
        call    @draw_lives
        pop     A
        rets

lose_life:
        push    A
        lda     @lives_d1
        jnz     @ll_dec
        lda     @lives_d0
        jz     @ll_done
ll_dec:
        lda     @lives_d0
        jnz     @ll_dec0
        mov     %9,A
        sta     @lives_d0
        lda     @lives_d1
        dec     A
        sta     @lives_d1
        br      @ll_done
ll_dec0:
        dec     A
        sta     @lives_d0
ll_done:
        call    @draw_lives
        lda     @lives_d1
        jnz     @ll_exit
        lda     @lives_d0
        jnz     @ll_exit
        mov     %1,A
        sta     @game_over
        call    @draw_game_over
ll_exit:
        pop     A
        rets

; draw_label_char: A=char index, B=start segment
draw_label_char:
        push    A
        push    B
        sta     @score_digit
        mov     B,A
        sta     @score_xseg
        mov     %LABEL_H,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
        lda     @label_y
        sta     @cur_y
dlc_lp:
        lda     @score_xseg
        mov     A,B
        lda     @cur_y
        call    @set_line_at

        lda     @loop_i
        mov     A,B
        lda     @score_digit
        call    @get_label_masks

        lda     @tmp1
        movp    A,P46
        movp    A,P46
        movp    A,P46
        lda     @tmp2
        movp    A,P46
        movp    A,P46
        movp    A,P46

        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dlc_lp
        pop     B
        pop     A
        rets

; draw_label_simple_char: A=char index, B=start segment (8px wide, 7px tall)
draw_label_simple_char:
        push    A
        push    B
        sta     @score_digit
        mov     B,A
        sta     @score_xseg
        mov     %LABEL_SIMPLE_H,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
        lda     @label_y
        sta     @cur_y
dl_simple_lp:
        lda     @score_xseg
        mov     A,B
        lda     @cur_y
        call    @set_line_at

        lda     @loop_i
        mov     A,B
        lda     @score_digit
        call    @get_label_simple_masks

        lda     @tmp1
        movp    A,P46
        movp    A,P46
        movp    A,P46

        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dl_simple_lp
        pop     B
        pop     A
        rets

; draw_digit20: A=digit (0..9), B=start segment
draw_digit20:
        push    A
        push    B
        sta     @score_digit
        mov     B,A
        sta     @score_xseg
        mov     %SCORE_H,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
        lda     @digit_y
        sta     @cur_y
dd20_lp:
        lda     @score_xseg
        mov     A,B
        lda     @cur_y
        call    @set_line_at

        lda     @loop_i
        mov     A,B
        lda     @score_digit
        call    @get_digit_masks

        wvdp(%$00)
        lda     @tmp1
        movp    A,P46
        movp    A,P46
        wvdp(%$00)
        lda     @tmp2
        movp    A,P46
        movp    A,P46
        wvdp(%$00)
        lda     @tmp3
        movp    A,P46
        movp    A,P46

        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dd20_lp
        pop     B
        pop     A
        rets

; get_digit_masks: A=digit, B=row -> tmp1=seg0, tmp2=seg1, tmp3=seg2
get_digit_masks:
        push    A
        push    B
        sta     @tmp2                ; save digit
        mov     B,A
        sta     @tmp3                ; save row
        lda     @tmp2
        mov     A,B
        lda     @digit_ofs(B)        ; A = digit * 20
        mov     A,B                  ; B = offset
        lda     @tmp3                ; A = row
        add     R0,R1                ; B = offset + row
        lda     @digit_s0_tbl(B)
        sta     @tmp1
        lda     @digit_s1_tbl(B)
        sta     @tmp2
        lda     @digit_s2_tbl(B)
        sta     @tmp3
        pop     B
        pop     A
        rets

; get_label_masks: A=char, B=row -> tmp1=seg0, tmp2=seg1
get_label_masks:
        push    A
        push    B
        sta     @tmp2                ; save char
        mov     B,A
        sta     @tmp3                ; save row
        lda     @tmp2
        mov     A,B
        lda     @label_ofs(B)        ; A = char * 12
        mov     A,B
        lda     @tmp3
        add     R0,R1                ; B = offset + row
        lda     @label_s0_tbl(B)
        sta     @tmp1
        lda     @label_s1_tbl(B)
        sta     @tmp2
        pop     B
        pop     A
        rets

; get_label_simple_masks: A=char, B=row -> tmp1=seg0
get_label_simple_masks:
        push    A
        push    B
        sta     @tmp2                ; save char
        mov     B,A
        sta     @tmp3                ; save row
        lda     @tmp2
        mov     A,B
        lda     @label_simple_ofs(B) ; A = char * 7
        mov     A,B
        lda     @tmp3
        add     R0,R1                ; B = offset + row
        lda     @label_simple_tbl(B)
        sta     @tmp1
        pop     B
        pop     A
        rets

draw_cannons:
        push    A
        push    B
        ; left cannon base (red)
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y-1,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%CANNON_BASE)

        ; left cannon tip (red)
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y-2,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%CANNON_TIP)

        ; right cannon base (red)
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        add     R0,R1                ; B = paddle_x + paddle_w
        mov     B,A
        dec     A
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y-1,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%CANNON_BASE)

        ; right cannon tip (red)
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        add     R0,R1                ; B = paddle_x + paddle_w
        mov     B,A
        dec     A
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y-2,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%CANNON_TIP)

        pop     B
        pop     A
        rets

debug_bullet1:
        push    A
        push    B
        ; col = bullet_seg / 2 (looped subtract, no rotate)
        lda     @bullet1_seg
        call    @seg_to_col_calc
        sta     @tmp2
        ; row = $FF if outside brick rows
        mov     %$FF,A
        sta     @tmp1
        lda     @bullet1_y
        cmp     %BRICK_START_Y,A
        jl     @dbg_draw
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @dbg_draw          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @dbg_draw
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @dbg_draw
        mov     B,A
        sta     @tmp1
dbg_draw:
        lda     @tmp2
        call    @debug_draw_col
        lda     @tmp1
        call    @debug_draw_row
        pop     B
        pop     A
        rets

debug_draw_col:
        push    A
        push    B
        ; length = min(col + 1, DBG_SEG_LEN)
        inc     A
        cmp     %DBG_SEG_LENP1,A
        jhs     @dbg_col_clamp
        br      @dbg_col_ok
dbg_col_clamp:
        mov     %DBG_SEG_LEN,A
dbg_col_ok:
        mov     %DBG_COL_Y,B
        call    @debug_draw_bar
        pop     B
        pop     A
        rets

debug_draw_row:
        push    A
        push    B
        cmp     %$FF,A
        jeq     @dbg_row_zero
        mov     A,B
        lda     @dbg_row_len(B)
        jmp     @dbg_row_draw
dbg_row_zero:
        clr     A
dbg_row_draw:
        mov     %DBG_ROW_Y,B
        call    @debug_draw_bar
        pop     B
        pop     A
        rets

; A = length (0..DBG_SEG_LEN), B = Y
debug_draw_bar:
        push    A
        push    B
        sta     @tmp3                ; length
        mov     B,A
        sta     @cur_y
        ; clear full bar
        mov     %DBG_SEG_START,B
        lda     @cur_y
        call    @set_line_at
        mov     %DBG_SEG_LEN,B
dbg_bar_clr:
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        djnz    B,dbg_bar_clr
        ; draw length segments in white
        lda     @tmp3
        jz     @dbg_bar_done
        mov     %DBG_SEG_START,B
        lda     @cur_y
        call    @set_line_at
        lda     @tmp3
        mov     A,B
dbg_bar_draw:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,dbg_bar_draw
dbg_bar_done:
        pop     B
        pop     A
        rets

dbg_row_len:
        .byte   3,6,9,12

; SEG_TO_COL_CALC: A = seg (0..25) -> A = col (0..12)
; seg is game-relative (0-based), no offset needed
seg_to_col_calc:
        push    B
        clr     B
stc_lp:
        cmp     %2,A
        jl     @stc_done
        sub     %2,A
        inc     B
        br      @stc_lp
stc_done:
        mov     B,A
        pop     B
        rets

draw_powerup:
        push    A
        push    B
        ; Small white "o" circle, 8 lines, same footprint as the ball
        ; $3C = 00111100  narrow top/bottom cap
        ; $7E = 01111110  wider ring
        ; $42 = 01000010  hollow sides only (left + right edge)
        ; White = B:1 G:1 R:1 -> same byte on all 3 planes

        ; --- Line 0: $3C White ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$3C)
        wvdp(%$3C)
        wvdp(%$3C)

        ; --- Line 1: $7E White ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+1,A
        call    @set_line_at
        wvdp(%$7E)
        wvdp(%$7E)
        wvdp(%$7E)

        ; --- Line 2: $42 White hollow ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+2,A
        call    @set_line_at
        wvdp(%$42)
        wvdp(%$42)
        wvdp(%$42)

        ; --- Line 3: $42 White hollow ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+3,A
        call    @set_line_at
        wvdp(%$42)
        wvdp(%$42)
        wvdp(%$42)

        ; --- Line 4: $42 White hollow ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+4,A
        call    @set_line_at
        wvdp(%$42)
        wvdp(%$42)
        wvdp(%$42)

        ; --- Line 5: $42 White hollow ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+5,A
        call    @set_line_at
        wvdp(%$42)
        wvdp(%$42)
        wvdp(%$42)

        ; --- Line 6: $7E White ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+6,A
        call    @set_line_at
        wvdp(%$7E)
        wvdp(%$7E)
        wvdp(%$7E)

        ; --- Line 7: $3C White ---
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @power_y
        add     %GAME_Y+7,A
        call    @set_line_at
        wvdp(%$3C)
        wvdp(%$3C)
        wvdp(%$3C)

        pop     B
        pop     A
        rets

erase_powerup:
        push    A
        push    B
        mov     %8,A                ; draw_powerup draws 8 lines
        sta     @line_cnt
        lda     @power_y
        sta     @cur_y
epu_lp:
        lda     @power_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @epu_lp
        call    @powerup_redraw_rows
        call    @draw_paddle
        lda     @ball_active
        jnz     @epu_done
        call    @draw_ball
epu_done:
        pop     B
        pop     A
        rets

restore_brick_under_powerup:
        push    A
        push    B
        lda     @power_y
        call    @restore_brick_at_y_power
        lda     @power_y
        add     %BALL_H-1,A
        call    @restore_brick_at_y_power
        pop     B
        pop     A
        rets

powerup_redraw_rows:
        push    A
        push    B
        lda     @power_y
        call    @powerup_redraw_row
        lda     @power_y
        add     %BALL_H-1,A
        call    @powerup_redraw_row
        pop     B
        pop     A
        rets

powerup_redraw_row:
        push    A
        push    B
        cmp     %BRICK_START_Y,A
        jl     @prr_done
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @prr_done          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @prr_done
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @prr_done
        mov     B,A
        sta     @tmp1
        call    @redraw_row
prr_done:
        pop     B
        pop     A
        rets

restore_brick_at_y_power:
        push    A
        push    B
        cmp     %BRICK_START_Y,A
        jl     @rpy_miss
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @rpy_miss          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @rpy_miss
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @rpy_miss
        mov     B,A
        sta     @tmp1
        lda     @power_seg
        clrc
        rr      A
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @rpy_miss
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jz     @rpy_miss
        call    @draw_one_brick
rpy_miss:
        pop     B
        pop     A
        rets

; ============================================================================
; FIRE POWERUP - BULLETS
; ============================================================================
fire_bullets:
        push    A
        push    B
        lda     @bullet1_y
        cmp     %$FF,A
        jne     @fb_done

        lda     @paddle_x
        sta     @bullet1_seg
        lda     @paddle_x
        mov     A,B
        lda     @paddle_w
        add     R0,R1                ; B = paddle_x + paddle_w
        mov     B,A
        dec     A
        sta     @bullet2_seg

        mov     %PADDLE_Y-1,A
        sta     @bullet1_y
        mov     %PADDLE_Y-1,A
        sta     @bullet2_y
        mov     %FIRE_SPD,A
        sta     @bullet_tmr

        call    @draw_bullet1
        call    @draw_bullet2
fb_done:
        pop     B
        pop     A
        rets

move_bullets:
        push    A
        push    B
        lda     @fire_active
        jnz     @mbu_chk
        br      @mbu_done
mbu_chk:
        lda     @bullet1_y
        cmp     %$FF,A
        jne     @mbu_have
        lda     @bullet2_y
        cmp     %$FF,A
        jeq     @mbu_done
mbu_have:
        lda     @bullet_tmr
        dec     A
        sta     @bullet_tmr
        jz     @mbu_tick
        br      @mbu_done
mbu_tick:
        mov     %FIRE_SPD,A
        sta     @bullet_tmr

        ; bullet 1
        lda     @bullet1_y
        cmp     %$FF,A
        jeq     @mbu_b2
        call    @check_bullet1_hit
        lda     @bullet1_y
        cmp     %$FF,A
        jeq     @mbu_b2
        call    @erase_bullet1
        lda     @bullet1_y
        cmp     %FIRE_STEP,A
        jl     @mbu_b1_off
        sub     %FIRE_STEP,A
        sta     @bullet1_y
        call    @check_bullet1_hit
        lda     @bullet1_y
        cmp     %$FF,A
        jeq     @mbu_b2
        call    @draw_bullet1
        br      @mbu_b2
mbu_b1_off:
        mov     %$FF,A
        sta     @bullet1_y

mbu_b2:
        lda     @bullet2_y
        cmp     %$FF,A
        jeq     @mbu_done
        call    @check_bullet2_hit
        lda     @bullet2_y
        cmp     %$FF,A
        jeq     @mbu_done
        call    @erase_bullet2
        lda     @bullet2_y
        cmp     %FIRE_STEP,A
        jl     @mbu_b2_off
        sub     %FIRE_STEP,A
        sta     @bullet2_y
        call    @check_bullet2_hit
        lda     @bullet2_y
        cmp     %$FF,A
        jeq     @mbu_done
        call    @draw_bullet2
        br      @mbu_done
mbu_b2_off:
        mov     %$FF,A
        sta     @bullet2_y

mbu_done:
        pop     B
        pop     A
        rets

draw_bullet1:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet1_y
        sta     @cur_y
db1_lp:
        lda     @bullet1_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%FIRE_MSK)
        wvdp(%FIRE_MSK)
        wvdp(%FIRE_MSK)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @db1_lp
        pop     B
        pop     A
        rets

erase_bullet1:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet1_y
        sta     @cur_y
eb1_lp:
        lda     @bullet1_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @eb1_lp
        call    @restore_brick_under_bullet1
        pop     B
        pop     A
        rets

erase_bullet1_raw:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet1_y
        sta     @cur_y
eb1r_lp:
        lda     @bullet1_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @eb1r_lp
        ; Restore any surviving brick the bullet just erased
        lda     @bullet1_y
        call    @restore_brick_at_y_bullet1
        lda     @bullet1_y
        inc     A
        call    @restore_brick_at_y_bullet1
        pop     B
        pop     A
        rets

restore_brick_under_bullet1:
        push    A
        push    B
        lda     @bullet1_y
        call    @restore_brick_at_y_bullet1
        lda     @bullet1_y
        add     %FIRE_H-1,A
        call    @restore_brick_at_y_bullet1
        pop     B
        pop     A
        rets

restore_brick_at_y_bullet1:
        push    A
        push    B
        cmp     %BRICK_START_Y,A
        jl     @rbu1_miss
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @rbu1_miss          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @rbu1_miss
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @rbu1_miss
        mov     B,A
        sta     @tmp1
        lda     @bullet1_seg
        call    @seg_to_col_calc
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @rbu1_miss
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jz     @rbu1_miss
        call    @draw_one_brick
rbu1_miss:
        pop     B
        pop     A
        rets

check_bullet1_hit:
        push    A
        push    B
        ; test bullet top then bottom edge against brick rows
        lda     @bullet1_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cb1_have_row
        lda     @bullet1_y
        add     %FIRE_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cb1_have_row
        br      @cb1_done
cb1_have_row:
        lda     @bullet1_seg
        call    @seg_to_col_calc
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jl      @cb1_col_ok
        br      @cb1_done
cb1_col_ok:
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jz     @cb1_done
        sta     @tmp3
        ; Explosive brick
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @cb1_chk_indes
        call    @explode_brick
        call    @erase_bullet1_raw
        br      @cb1_no_destroy
cb1_chk_indes:
        ; Indestructible brick: just bounce, redraw explicitly
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @cb1_chk_armor
        lda     @tmp3               ; A = color for draw
        call    @draw_one_brick     ; redraw using exact tmp1/tmp2 from probe
        br      @cb1_no_destroy
cb1_chk_armor:
        ; Armor brick: 2-hit mechanic
        lda     @tmp3
        cmp     %BRICK_COLOR_ARMOR,A
        jne     @cb1_chk_arm2
        mov     %BRICK_COLOR_ARMOR2,A  ; downgrade to damaged
        sta     @bricks(B)
        call    @draw_one_brick        ; redraw cracked
        call    @sfx_brick
        br      @cb1_no_destroy
cb1_chk_arm2:
        cmp     %BRICK_COLOR_ARMOR2,A
        jne     @cb1_chk_power
        call    @sfx_brick             ; second hit: destroy
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        call    @erase_bullet1_raw
        lda     @brick_count
        dec     A
        sta     @brick_count
        br      @cb1_no_destroy        ; no score for armor
cb1_chk_power:
        cmp     %BRICK_COLOR_POWER,A
        jne     @cb1_no_power
        call    @spawn_powerup
cb1_no_power:
        call    @sfx_brick
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        call    @erase_bullet1_raw
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
cb1_no_destroy:
        call    @draw_all_bricks
        mov     %$FF,A
        sta     @bullet1_y
cb1_done:
        pop     B
        pop     A
        rets

draw_bullet2:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet2_y
        sta     @cur_y
db2_lp:
        lda     @bullet2_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%FIRE_MSK)
        wvdp(%FIRE_MSK)
        wvdp(%FIRE_MSK)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @db2_lp
        pop     B
        pop     A
        rets

erase_bullet2:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet2_y
        sta     @cur_y
eb2_lp:
        lda     @bullet2_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @eb2_lp
        call    @restore_brick_under_bullet2
        pop     B
        pop     A
        rets

erase_bullet2_raw:
        push    A
        push    B
        mov     %FIRE_H,A
        sta     @line_cnt
        lda     @bullet2_y
        sta     @cur_y
eb2r_lp:
        lda     @bullet2_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @eb2r_lp
        ; Restore any surviving brick the bullet just erased
        lda     @bullet2_y
        call    @restore_brick_at_y_bullet2
        lda     @bullet2_y
        inc     A
        call    @restore_brick_at_y_bullet2
        pop     B
        pop     A
        rets

restore_brick_under_bullet2:
        push    A
        push    B
        lda     @bullet2_y
        call    @restore_brick_at_y_bullet2
        lda     @bullet2_y
        add     %FIRE_H-1,A
        call    @restore_brick_at_y_bullet2
        pop     B
        pop     A
        rets

restore_brick_at_y_bullet2:
        push    A
        push    B
        cmp     %BRICK_START_Y,A
        jl     @rbu2_miss
        mov     A,B                ; B = probe_y
        lda     @brick_end_y       ; A = brick_end_y
        cmp     R0,R1              ; B-A = probe_y - brick_end_y
        jhs     @rbu2_miss          ; probe_y >= brick_end_y -> miss
        mov     B,A                ; restore A = probe_y
        call    @get_brick_row
        cmp     %BRICK_H,A
        jhs     @rbu2_miss
        mov     B,A
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jhs     @rbu2_miss
        mov     B,A
        sta     @tmp1
        lda     @bullet2_seg
        call    @seg_to_col_calc
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @rbu2_miss
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jz     @rbu2_miss
        call    @draw_one_brick
rbu2_miss:
        pop     B
        pop     A
        rets

check_bullet2_hit:
        push    A
        push    B
        ; test bullet top then bottom edge against brick rows
        lda     @bullet2_y
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cb2_have_row
        lda     @bullet2_y
        add     %FIRE_H-1,A
        call    @probe_brick_at_y
        lda     @probe_hit
        jnz     @cb2_have_row
        br      @cb2_done
cb2_have_row:
        lda     @bullet2_seg
        call    @seg_to_col_calc
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jl      @cb2_col_ok
        br      @cb2_done
cb2_col_ok:
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        lda     @bricks(B)
        jz     @cb2_done
        sta     @tmp3
        ; Explosive brick
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @cb2_chk_indes
        call    @explode_brick
        call    @erase_bullet2_raw
        br      @cb2_no_destroy
cb2_chk_indes:
        ; Indestructible brick: just bounce, redraw explicitly
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @cb2_chk_armor
        lda     @tmp3               ; A = color for draw
        call    @draw_one_brick     ; redraw using exact tmp1/tmp2 from probe
        br      @cb2_no_destroy
cb2_chk_armor:
        ; Armor brick: 2-hit mechanic
        lda     @tmp3
        cmp     %BRICK_COLOR_ARMOR,A
        jne     @cb2_chk_arm2
        mov     %BRICK_COLOR_ARMOR2,A  ; downgrade to damaged
        sta     @bricks(B)
        call    @draw_one_brick        ; redraw cracked
        call    @sfx_brick
        br      @cb2_no_destroy
cb2_chk_arm2:
        cmp     %BRICK_COLOR_ARMOR2,A
        jne     @cb2_chk_power
        call    @sfx_brick             ; second hit: destroy
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        call    @erase_bullet2_raw
        lda     @brick_count
        dec     A
        sta     @brick_count
        br      @cb2_no_destroy        ; no score for armor
cb2_chk_power:
        cmp     %BRICK_COLOR_POWER,A
        jne     @cb2_no_power
        call    @spawn_powerup
cb2_no_power:
        call    @sfx_brick
        clr     A
        sta     @bricks(B)
        call    @erase_one_brick
        call    @erase_bullet2_raw
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
cb2_no_destroy:
        call    @draw_all_bricks
        mov     %$FF,A
        sta     @bullet2_y
cb2_done:
        pop     B
        pop     A
        rets

redraw_row:
        push    A
        push    B
        ; tmp1 = row already
        clr     A
        sta     @loop_j
rr_c:
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @loop_j
        add     R0,R1
        lda     @bricks(B)
        jz     @rr_nx
        push    A
        lda     @loop_j
        sta     @tmp2
        pop     A
        call    @draw_one_brick
rr_nx:
        lda     @loop_j
        inc     A
        sta     @loop_j
        cmp     %BRICK_COLS,A
        jl     @rr_c
        pop     B
        pop     A
        rets

; ============================================================================
; RANDOM / WHITE BRICKS
; ============================================================================
place_white_bricks:
        push    A
        push    B
        mov     %POWER_BRICK_COUNT,A
        sta     @tmp2
pwb_loop:
        lda     @tmp2
        jz     @pwb_done
        call    @rand_brick_index
        mov     A,B
        lda     @bricks(B)
        cmp     %BRICK_COLOR_POWER,A
        jeq     @pwb_loop
        mov     %BRICK_COLOR_POWER,A
        sta     @bricks(B)
        lda     @tmp2
        dec     A
        sta     @tmp2
        br      @pwb_loop
pwb_done:
        pop     B
        pop     A
        rets

rand_brick_index:
        call    @rand_next
        sta     @tmp1
rbi_loop:
        lda     @tmp1
        cmp     %BRICK_TOTAL,A
        jl     @rbi_done
        sub     %BRICK_TOTAL,A
        sta     @tmp1
        br      @rbi_loop
rbi_done:
        lda     @tmp1
        rets

; ============================================================================
; ============================================================================

; NULL_ISR - monitor calls BRJOY0/BRTIME via software CALL, so use RETS.
; (hardware ISR saves PC+ST=3 bytes, but monitor's ISR wraps BRJOY0 call
;  as software CALL, so only PC=2 bytes pushed -> RETS is correct.)
; ============================================================================
null_isr:
        rets

; SFX_PADDLE - two-phase thud on paddle bounce.
; dint/eint bracket keeps A=$08 from being executed as opcode if a
; keyboard interrupt fires mid-loop (with BRJOY0/BRTIME->null_isr,
; the queued interrupt fires safely on eint and returns via null_isr).
; SFX_LOSE
sfx_lose:
        push    A
        push    B
        dint
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        mov     %40,B
sfx_ls_h:
        mov     %8,A
        xorp    A,P6
        mov     %60,A
sfx_ls_hi:
        dec     A
        jnz     @sfx_ls_hi
        djnz    B,sfx_ls_h
        mov     %40,B
sfx_ls_m:
        mov     %8,A
        xorp    A,P6
        mov     %120,A
sfx_ls_mi:
        dec     A
        jnz     @sfx_ls_mi
        djnz    B,sfx_ls_m
        mov     %40,B
sfx_ls_l:
        mov     %8,A
        xorp    A,P6
        mov     %200,A
sfx_ls_li:
        dec     A
        jnz     @sfx_ls_li
        djnz    B,sfx_ls_l
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        eint
        pop     B
        pop     A
        rets

sfx_paddle:
        push    A
        push    B
        dint
        movp    P6,A
        and     %$F7,A
        movp    A,P6             ; silence before start
        mov     %40,B            ; phase 1: 40 half-periods ~2.8kHz
sfx_pd_hi:
        mov     %8,A
        xorp    A,P6
        mov     %80,A
sfx_pd_hi_i:
        dec     A
        jnz     @sfx_pd_hi_i
        djnz    B,sfx_pd_hi
        mov     %30,B            ; phase 2: 30 half-periods ~1kHz
sfx_pd_lo:
        mov     %8,A
        xorp    A,P6
        mov     %220,A
sfx_pd_lo_i:
        dec     A
        jnz     @sfx_pd_lo_i
        djnz    B,sfx_pd_lo
        movp    P6,A
        and     %$F7,A
        movp    A,P6             ; silence after
        eint
        pop     B
        pop     A
        rets

; SFX_BRICK - short high-pitched click on brick hit
sfx_brick:
        push    A
        push    B
        dint
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        mov     %60,B
sfx_bk_o:
        mov     %8,A
        xorp    A,P6
        mov     %30,A
sfx_bk_i:
        dec     A
        jnz     @sfx_bk_i
        djnz    B,sfx_bk_o
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        eint
        pop     B
        pop     A
        rets

sfx_explode:
        push    A
        push    B
        dint
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        ; Band 1: crack (very short = highest pitch)
        mov     %20,B
sfx_ex_h:
        mov     %8,A
        xorp    A,P6
        mov     %10,A
sfx_ex_hi:
        dec     A
        jnz     @sfx_ex_hi
        djnz    B,sfx_ex_h
        ; Band 2: rumble descent
        mov     %60,B
sfx_ex_m:
        mov     %8,A
        xorp    A,P6
        mov     %40,A
sfx_ex_mi:
        dec     A
        jnz     @sfx_ex_mi
        djnz    B,sfx_ex_m
        ; Band 3: deep boom
        mov     %80,B
sfx_ex_l:
        mov     %8,A
        xorp    A,P6
        mov     %100,A
sfx_ex_li:
        dec     A
        jnz     @sfx_ex_li
        djnz    B,sfx_ex_l
        movp    P6,A
        and     %$F7,A
        movp    A,P6
        eint
        pop     B
        pop     A
        rets

; Power type cycle table: 4 entries, indexed by tmp3 (0..3)
power_type_cycle:
        .byte   POWER_TYPE_SLOW
        .byte   POWER_TYPE_WIDE
        .byte   POWER_TYPE_FIRE
        .byte   POWER_TYPE_LIFE

rand_next:
        lda     @rand_seed
        add     %$3D,A
        xor     %$C7,A
        sta     @rand_seed
        rets

; GET_BRICK_ROW: A = Y pixel -> B = row, A = offset within row
get_brick_row:
        sub     %BRICK_START_Y,A
        clr     B
gbr_lp:
        cmp     %BRICK_PITCH,A
        jl     @gbr_dn
        sub     %BRICK_PITCH,A
        inc     B
        jmp     @gbr_lp
gbr_dn:
        rets

; ============================================================================
; ERASE_ONE_BRICK at (tmp1=row, tmp2=col)
; ============================================================================
erase_one_brick:
        push    A
        push    B

        ; start_seg = col * 2 + GAME_X_SEG
        lda     @tmp2
        clrc
        rl      A
        add     %GAME_X_SEG,A
        sta     @brick_idx

        ; start_y = BRICK_START_Y + row * BRICK_PITCH
        lda     @tmp1
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @cur_y

        mov     %BRICK_H,A
        sta     @line_cnt
eob_ln:
        lda     @brick_idx
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @eob_ln

        pop     B
        pop     A
        rets

; ============================================================================
; DRAW / ERASE BALL (1 seg × 4 lines, 4px centered: $3C = 00111100)
; ============================================================================
draw_ball:
        push    A
        push    B
        ; 8-line 2-color ball:
        ; Circle mask:  $3C=..####.. (4px)  $7E=.######. (6px)
        ; White  = B:1 G:1 R:1  -> same value for all 3 planes
        ; Yellow = B:0 G:1 R:1  -> B=0, G=val, R=val
        ;
        ;   Line 0: $3C  WHITE   ..####..   narrow top cap
        ;   Line 1: $7E  WHITE   .######.   top highlight ring
        ;   Line 2: $7E  YELLOW  .######.   body
        ;   Line 3: $7E  YELLOW  .######.   body
        ;   Line 4: $7E  YELLOW  .######.   body
        ;   Line 5: $7E  YELLOW  .######.   body
        ;   Line 6: $7E  WHITE   .######.   bottom highlight ring
        ;   Line 7: $3C  WHITE   ..####..   narrow bottom cap

        ; --- Line 0: White $3C ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$3C)              ; B
        wvdp(%$3C)              ; G
        wvdp(%$3C)              ; R  -> White

        ; --- Line 1: White $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+1,A
        call    @set_line_at
        wvdp(%$7E)
        wvdp(%$7E)
        wvdp(%$7E)              ; White

        ; --- Line 2: Yellow $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+2,A
        call    @set_line_at
        wvdp(%$00)              ; B=0
        wvdp(%$7E)              ; G
        wvdp(%$7E)              ; R  -> Yellow

        ; --- Line 3: Yellow $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+3,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$7E)
        wvdp(%$7E)

        ; --- Line 4: Yellow $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+4,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$7E)
        wvdp(%$7E)

        ; --- Line 5: Yellow $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+5,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$7E)
        wvdp(%$7E)

        ; --- Line 6: White $7E ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+6,A
        call    @set_line_at
        wvdp(%$7E)
        wvdp(%$7E)
        wvdp(%$7E)              ; White

        ; --- Line 7: White $3C ---
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @ball_y
        add     %GAME_Y+7,A
        call    @set_line_at
        wvdp(%$3C)
        wvdp(%$3C)
        wvdp(%$3C)              ; White

        pop     B
        pop     A
        rets

erase_ball:
        push    A
        push    B
        mov     %8,A                ; draw_ball draws 8 lines (not BALL_H=4)
        sta     @line_cnt
        lda     @ball_y
        sta     @cur_y
ebl_lp:
        lda     @ball_seg
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @ebl_lp
        call    @restore_brick_under_ball
        ; Safety: also restore adjacent segments to prevent half-erased bricks
        lda     @ball_seg
        sta     @char_buf           ; save ball_seg (tmp3 is clobbered by draw_one_brick)
        ; left neighbor
        lda     @ball_seg
        jz      @eb_rbu_right
        dec     A
        sta     @ball_seg
        call    @restore_brick_under_ball
eb_rbu_right:
        ; right neighbor
        lda     @char_buf
        cmp     %BALL_MAX_SEG,A
        jeq     @eb_rbu_restore
        inc     A
        sta     @ball_seg
        call    @restore_brick_under_ball
eb_rbu_restore:
        lda     @char_buf
        sta     @ball_seg
        pop     B
        pop     A
        rets

; ============================================================================
; DRAW / ERASE PADDLE (capsule: paddle_w seg × 6 lines)
; ============================================================================
draw_paddle:
        push    A
        push    B
        ; mid_count = paddle_w - 2
        lda     @paddle_w
        sub     %2,A
        sta     @tmp1

        ; Line 0: White rounded ($1F/$FF/$F8)
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$1F)
        wvdp(%$1F)
        wvdp(%$1F)
        lda     @tmp1
        mov     A,B
dp0_mid:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,dp0_mid
        wvdp(%$F8)
        wvdp(%$F8)
        wvdp(%$F8)

        ; Line 1: White ($7F/$FF/$FE)
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y+1,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$7F)
        wvdp(%$7F)
        wvdp(%$7F)
        lda     @tmp1
        mov     A,B
dp1_mid:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,dp1_mid
        wvdp(%$FE)
        wvdp(%$FE)
        wvdp(%$FE)

        ; Lines 2-4: Cyan body (B:1 G:1 R:0)
        mov     %3,A
        sta     @line_cnt
        mov     %PADDLE_Y+2,A
        sta     @cur_y
dp_bd:
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$7F)
        wvdp(%$7F)
        wvdp(%$00)
        lda     @tmp1
        mov     A,B
dpb_mid:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$00)
        djnz    B,dpb_mid
        wvdp(%$FE)
        wvdp(%$FE)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dp_bd

        ; Line 5: Blue shadow rounded (B:1 G:0 R:0)
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        mov     %PADDLE_Y+5,A
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$1F)
        wvdp(%$00)
        wvdp(%$00)
        lda     @tmp1
        mov     A,B
dp5_mid:
        wvdp(%$FF)
        wvdp(%$00)
        wvdp(%$00)
        djnz    B,dp5_mid
        wvdp(%$F8)
        wvdp(%$00)
        wvdp(%$00)

        ; Fire cannons
        lda     @fire_active
        jz     @dp_no_cannon
        call    @draw_cannons
dp_no_cannon:
        pop     B
        pop     A
        rets

erase_paddle:
        push    A
        push    B
        ; clear cannon lines (PADDLE_Y-2, PADDLE_Y-1)
        mov     %PADDLE_Y-2,A
        sta     @cur_y
ep_can_ln:
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @paddle_bytes
        mov     A,B
ep_can:
        wvdp(%$00)
        djnz    B,ep_can
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @cur_y
        cmp     %PADDLE_Y,A
        jl     @ep_can_ln

        mov     %PADDLE_Y,A
        sta     @cur_y
        mov     %PADDLE_H,A         ; counter in A, pushed around set_line_at (line_cnt=$C40A=key_last!)
ep_lp:
        push    A                   ; save counter — never use line_cnt/$C40A as it aliases key_last
        lda     @paddle_x
        add     %GAME_X_SEG,A
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @paddle_bytes
        mov     A,B
ep_bk:
        wvdp(%$00)
        djnz    B,ep_bk
        lda     @cur_y
        inc     A
        sta     @cur_y
        pop     A                   ; restore counter
        dec     A
        jnz     @ep_lp
        pop     B
        pop     A
        rets

; ============================================================================
; INIT_BRICKS - Fill array with colors and draw
; ============================================================================
; ============================================================================
; LEVEL DATA (ASCII descriptors, 13 chars wide)
; R=red(1) M=Magenta(2) G=green(3) B=blue(4) W=white(5) 1-4=powerup .=empty
; ============================================================================
        .include "level1.h"
        .include "level2.h"
        .include "level3.h"
        .include "level4.h"
        .include "level5.h"

level_rows_table:
        .byte   LEVEL1_ROWS, LEVEL2_ROWS, LEVEL3_ROWS, LEVEL4_ROWS, LEVEL5_ROWS
level_ptr_hi:
        .byte   >level1_data, >level2_data, >level3_data, >level4_data, >level5_data
level_ptr_lo:
        .byte   <level1_data, <level2_data, <level3_data, <level4_data, <level5_data

; ============================================================================
; INIT_BRICKS - Generic ASCII level decoder
; ============================================================================
; ── CRAM DEBUG: display cram_l1 address and first byte as hex on screen ──
; Call from game loop or after init. Shows at y=160 on right panel.
; ============================================================================
; CRAM DEBUG: show cram_l1 address and first byte as readable text
; Uses draw_text_line_green at y=200/210 on left side of screen
; ============================================================================
init_bricks:
        push    A
        push    B
        lda     @cram_loaded
        jz      @ib_rom_path
        pop     B
        pop     A
        call    @ib_cram_path
        rets
ib_rom_path:
        lda     @current_level
        jnz     @ib_chk_l2
        mov     %LEVEL1_ROWS,A
        sta     @current_brick_rows
        movd    %level1_data,TEMP1
        jmp     @ib_got_ptr
ib_chk_l2:
        cmp     %2,A
        jhs     @ib_chk_l3
        mov     %LEVEL2_ROWS,A
        sta     @current_brick_rows
        movd    %level2_data,TEMP1
        jmp     @ib_got_ptr
ib_chk_l3:
        cmp     %3,A
        jhs     @ib_chk_l4
        mov     %LEVEL3_ROWS,A
        sta     @current_brick_rows
        movd    %level3_data,TEMP1
        jmp     @ib_got_ptr
ib_chk_l4:
        cmp     %4,A
        jhs     @ib_l5
        mov     %LEVEL4_ROWS,A
        sta     @current_brick_rows
        movd    %level4_data,TEMP1
        jmp     @ib_got_ptr
ib_l5:
        mov     %LEVEL5_ROWS,A
        sta     @current_brick_rows
        movd    %level5_data,TEMP1
ib_got_ptr:
        mov     TEMP1-1,A
        sta     @tmp_lev_hi
        mov     TEMP1,A
        sta     @tmp_lev_lo
        lda     @current_brick_rows
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @brick_end_y
        clr     A
        sta     @loop_i
ib_clr_loop:
ib_clr:
        lda     @loop_i
        mov     A,B
        clr     A
        sta     @bricks(B)
        sta     @power_map(B)
        lda     @loop_i
        inc     A
        sta     @loop_i
        cmp     %BRICK_TOTAL_MAX,A
        jl     @ib_clr
        clr     A
        sta     @loop_i
        sta     @tmp2
        ; fall through to ib_dec

ib_dec:
        lda     @tmp_lev_hi
        mov     A,TEMP1-1
        lda     @tmp_lev_lo
        mov     A,TEMP1
        lda     *TEMP1
        sta     @tmp3
        add     %1,TEMP1
        adc     %0,TEMP1-1
        mov     TEMP1-1,A
        sta     @tmp_lev_hi
        mov     TEMP1,A
        sta     @tmp_lev_lo
        lda     @loop_i
        mov     A,B
        lda     @tmp3
        call    @ib_classify
ib_next:
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @current_brick_rows
        mpy     %BRICK_COLS,A
        mov     B,A
        sta     @tmp1
        lda     @loop_i
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jhs     @ib_done
        jmp     @ib_dec
ib_done:
        lda     @tmp2
        sta     @brick_count
        call    @draw_all_bricks
        pop     B
        pop     A
        rets

; ============================================================================
; IB_CRAM_PATH: decode bricks from CRAM for current_level
; ============================================================================
ib_cram_path:
        push    A
        push    B
        lda     @current_level
        jnz     @icp_l2
        lda     @cram_l1_hi
        sta     @tmp_lev_hi
        lda     @cram_l1_lo
        sta     @tmp_lev_lo
        br      @icp_rows
icp_l2:
        cmp     %2,A
        jhs     @icp_l3
        lda     @cram_l2_hi
        sta     @tmp_lev_hi
        lda     @cram_l2_lo
        sta     @tmp_lev_lo
        br      @icp_rows
icp_l3:
        cmp     %3,A
        jhs     @icp_l4
        lda     @cram_l3_hi
        sta     @tmp_lev_hi
        lda     @cram_l3_lo
        sta     @tmp_lev_lo
        br      @icp_rows
icp_l4:
        cmp     %4,A
        jhs     @icp_l5
        lda     @cram_l4_hi
        sta     @tmp_lev_hi
        lda     @cram_l4_lo
        sta     @tmp_lev_lo
        br      @icp_rows
icp_l5:
        lda     @cram_l5_hi
        sta     @tmp_lev_hi
        lda     @cram_l5_lo
        sta     @tmp_lev_lo
icp_rows:
        mov     %18,A               ; always 18 rows in CRAM
        sta     @current_brick_rows
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @brick_end_y
        lda     @current_brick_rows
        mpy     %BRICK_COLS,A
        mov     B,A
        sta     @tmp1
        clr     A
        mov     A,B
icp_clr:
        sta     @bricks(B)
        sta     @power_map(B)
        inc     B
        cmp     %BRICK_TOTAL_MAX,B
        jl      @icp_clr
        clr     B
        clr     A
        sta     @tmp2
        ; Z/X driven decode: 18 rows, each Z[13 chars]X
        ; ctrl chars ($00-$20) = empty brick (advance B)
        ; 'Z' and 'X' are structural markers
        mov     %18,A
        sta     @loop_j             ; row counter (loop_j safe here)
        clr     B                   ; brick slot index

icp_nextrow:
        ; Scan to next 'Z'
icp_to_z:
        lda     @tmp_lev_hi
        cmp     %CRAM_SCAN_END,A
        jhs     @icp_tz_ok
        br      @icp_done
icp_tz_ok:
        push    B
        call    @crl_read
        pop     B
        cmp     %$5A,A
        jne     @icp_to_z

        ; Read up to 13 chars, stop at X
        mov     %13,A
        sta     @tmp1               ; col counter

icp_col:
        push    B
        call    @crl_read
        pop     B
        cmp     %$58,A              ; 'X' = row end
        jeq     @icp_rowend
        ; Store brick: ctrl = empty, else classify
        cmp     %$21,A
        jhs     @icp_cls
        clr     A
        sta     @bricks(B)
        inc     B
        br      @icp_colnxt
icp_cls:
        sta     @tmp3               ; ib_classify reads tmp3
        call    @ib_classify
        inc     B
icp_colnxt:
        lda     @tmp1
        dec     A
        sta     @tmp1
        jnz     @icp_col
        ; col limit reached without X: drain until X
icp_drain:
        push    B
        call    @crl_read
        pop     B
        cmp     %$58,A
        jne     @icp_drain

icp_rowend:
        lda     @loop_j
        dec     A
        sta     @loop_j
        jnz     @icp_nextrow
icp_done:
        lda     @tmp2
        sta     @brick_count
        call    @draw_all_bricks
        pop     B
        pop     A
        rets

; ============================================================================
; IB_USE_ED_GRID  standalone subroutine (called via 16-bit call from init_bricks)
; ============================================================================
ib_use_ed_grid:
        push    A
        push    B
        ; select row count for current_level
        lda     @current_level
        jnz     @ib_ed_sel_l2
        lda     @ed_rows0
        sta     @current_brick_rows
        br      @ib_ed_cap
ib_ed_sel_l2:
        cmp     %2,A
        jhs     @ib_ed_sel_l3
        lda     @ed_rows1
        sta     @current_brick_rows
        br      @ib_ed_cap
ib_ed_sel_l3:
        lda     @ed_rows2
        sta     @current_brick_rows
ib_ed_cap:
ib_ed_rows_ok:
        ; brick_end_y
        lda     @current_brick_rows
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @brick_end_y
        ; total cells
        lda     @current_brick_rows
        mpy     %BRICK_COLS,A
        mov     B,A
        sta     @tmp1               ; total cell count
        clr     A
        sta     @tmp2               ; brick_count = 0
        ; Level 0 special: bricks[]=ed_grid0 (SAME address).
        ; Must NOT clear bricks (would wipe source). Clear power_map only, then count.
        lda     @current_level
        jnz     @ib_ed_clr_both     ; levels 1/2: safe to clear bricks+power_map
        ; ---- Level 0: skip power_map clear (power_map=ed_grid1; clearing destroys level2 data)
        ; Power bricks not functional in editor-mode gameplay. Count bricks in-place.
        clr     B
ib_ed_cp0_lp:
        lda     @tmp1
        cmp     R0,R1               ; jl = B < tmp1 → continue
        jl      @ib_ed_cp0_do
        br      @ib_ed_cp_done
ib_ed_cp0_do:
        lda     @bricks(B)          ; bricks=ed_grid0: data already in place
        jz      @ib_ed_cp0_nx
        cmp     %BRICK_COLOR_INDES,A
        jeq     @ib_ed_cp0_nx
        lda     @tmp2
        inc     A
        sta     @tmp2
ib_ed_cp0_nx:
        inc     B
        br      @ib_ed_cp0_lp
        ; ---- Levels 1/2: copy from grid FIRST, then clear power_map. Mark bricks dirty. ----
        ; power_map=$C5EA=ed_grid1: copy ed_grid1→bricks first, then zero power_map safely.
ib_ed_clr_both:
        mov     %1,A
        sta     @ed_l0_dirty
        lda     @current_level
        cmp     %2,A
        jhs     @ib_ed_cp2
        br      @ib_ed_cp1
        ; ---- copy grid 1, then clear power_map ----
ib_ed_cp1:
        clr     A
        sta     @tmp2               ; brick_count=0
        clr     B
ib_ed_cp1_lp:
        lda     @tmp1
        cmp     R0,R1
        jl      @ib_ed_cp1_do
        br      @ib_ed_clr_pm1
ib_ed_cp1_do:
        lda     @ed_grid1(B)        ; read ed_grid1 BEFORE power_map is cleared
        sta     @bricks(B)
        jz      @ib_ed_cp1_nx
        cmp     %BRICK_COLOR_INDES,A
        jeq     @ib_ed_cp1_nx
        lda     @tmp2
        inc     A
        sta     @tmp2
ib_ed_cp1_nx:
        inc     B
        br      @ib_ed_cp1_lp
ib_ed_clr_pm1:
        ; clear bricks[tmp1..BRICK_TOTAL_MAX-1] and full power_map
        clr     A
        mov     B,A                 ; B = tmp1 (first cell past copy)
ib_ed_clr1_lp:
        cmp     %BRICK_TOTAL_MAX,A
        jhs     @ib_ed_clr1_pm
        mov     A,B
        clr     A
        sta     @bricks(B)
        inc     B
        mov     B,A
        br      @ib_ed_clr1_lp
ib_ed_clr1_pm:
        ; power_map=ed_grid1: skip clear in editor mode to preserve level2 user edits.
        lda     @ed_saved
        jnz     @ib_ed_cp_done
        clr     A
        mov     A,B
ib_ed_clr1_pm_lp:
        sta     @power_map(B)
        inc     B
        cmp     %BRICK_TOTAL_MAX,B
        jl      @ib_ed_clr1_pm_lp
        br      @ib_ed_cp_done
        ; ---- copy grid 2, then clear power_map ----
ib_ed_cp2:
        clr     A
        sta     @tmp2
        clr     B
ib_ed_cp2_lp:
        lda     @tmp1
        cmp     R0,R1
        jl      @ib_ed_cp2_do
        br      @ib_ed_clr_pm2
ib_ed_cp2_do:
        lda     @ed_grid2(B)
        sta     @bricks(B)
        jz      @ib_ed_cp2_nx
        cmp     %BRICK_COLOR_INDES,A
        jeq     @ib_ed_cp2_nx
        lda     @tmp2
        inc     A
        sta     @tmp2
ib_ed_cp2_nx:
        inc     B
        br      @ib_ed_cp2_lp
ib_ed_clr_pm2:
        clr     A
        mov     B,A
ib_ed_clr2_lp:
        cmp     %BRICK_TOTAL_MAX,A
        jhs     @ib_ed_clr2_pm
        mov     A,B
        clr     A
        sta     @bricks(B)
        inc     B
        mov     B,A
        br      @ib_ed_clr2_lp
ib_ed_clr2_pm:
        ; power_map=ed_grid1: skip clear in editor mode to preserve level2 user edits.
        lda     @ed_saved
        jnz     @ib_ed_cp_done
        clr     A
        mov     A,B
ib_ed_clr2_pm_lp:
        sta     @power_map(B)
        inc     B
        cmp     %BRICK_TOTAL_MAX,B
        jl      @ib_ed_clr2_pm_lp
ib_ed_cp_done:
        lda     @tmp2
        sta     @brick_count
        call    @draw_all_bricks    ; FIX: ROM path calls this in ib_done; ed path must too
        pop     B
        pop     A
        rets

; ib_classify: classify char in tmp3, store to bricks(B)/power_map(B), update tmp2
; Inputs: A=char(tmp3), B=brick index(loop_i). Preserves B.
ib_classify:
        cmp     %$2E,A
        jne     @ib_cls_notempty    ; '.' = empty (invert: skip over ib_empty)
ib_empty:
        clr     A
        sta     @bricks(B)
        rets
ib_cls_notempty:
        cmp     %$31,A
        jl     @ib_letter
        cmp     %$35,A
        jhs     @ib_letter
        sub     %$30,A
        sta     @power_map(B)
        mov     %BRICK_COLOR_POWER,A
        sta     @bricks(B)
        jmp     @ib_alive
ib_letter:
        lda     @tmp3
        cmp     %$52,A
        jne     @ib_chk_M
        mov     %1,A
        jmp     @ib_color
ib_chk_M:
        cmp     %$4D,A              ; 'M' Magenta
        jeq     @ib_is_M
        cmp     %$4F,A              ; 'O' Orange (legacy alias for Magenta)
        jne     @ib_chk_G
ib_is_M:
        mov     %2,A
        jmp     @ib_color
ib_chk_G:
        cmp     %$47,A
        jne     @ib_chk_B
        mov     %3,A
        jmp     @ib_color
ib_chk_B:
        cmp     %$42,A
        jne     @ib_chk_U
        mov     %4,A
        jmp     @ib_color
ib_chk_U:
        cmp     %$55,A              ; 'U'=$55 indestructible
        jne     @ib_chk_W
        mov     %BRICK_COLOR_INDES,A
        sta     @bricks(B)          ; store but do NOT count
        rets                        ; skip ib_alive -> tmp2 not incremented
ib_chk_W:
        cmp     %$57,A              ; 'W'=$57
        jne     @ib_chk_A
        mov     %5,A
        jmp     @ib_color
ib_chk_A:
        cmp     %$41,A              ; 'A'=$41 armor (2-hit)
        jne     @ib_chk_D
        mov     %BRICK_COLOR_ARMOR,A
        jmp     @ib_color
ib_chk_D:
        cmp     %$44,A              ; 'D'=$44 dark blue
        jne     @ib_chk_Y
        mov     %6,A
        jmp     @ib_color
ib_chk_Y:
        cmp     %$59,A              ; 'Y'=$59 yellow
        jne     @ib_chk_E
        mov     %7,A
        jmp     @ib_color
ib_chk_E:
        cmp     %$45,A              ; 'E'=$45 explosive
        jne     @ib_unknown
        mov     %BRICK_COLOR_EXPLO,A
        jmp     @ib_color
ib_unknown:
        clr     A                   ; unknown char = treat as empty
        sta     @bricks(B)
        rets                        ; do NOT increment brick_count
ib_color:
        sta     @bricks(B)
ib_alive:
        lda     @tmp2
        inc     A
        sta     @tmp2
        rets

; ============================================================================
; EXPLODE_BRICK - destroy brick at (tmp1,tmp2) and all 4 neighbors
; Indestructible bricks (color 10) are immune
; ============================================================================
explode_brick:
        push    A
        push    B
        ; Save row/col - add_score->draw_digit20 clobbers tmp1/tmp2
        lda     @tmp1
        sta     @eb_row
        lda     @tmp2
        sta     @eb_col
        ; Destroy self first
        lda     @eb_row
        mpy     %BRICK_COLS,A
        lda     @eb_col
        add     R0,R1
        mov     B,A
        sta     @tmp_lev_lo
        lda     @bricks(B)
        jz     @eb_self_done
        call    @sfx_explode
        lda     @tmp_lev_lo
        mov     A,B
        clr     A
        sta     @bricks(B)
        lda     @eb_row
        sta     @tmp1
        lda     @eb_col
        sta     @tmp2
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
        ; Restore after add_score clobbers tmp1/tmp2
        lda     @eb_row
        sta     @tmp1
        lda     @eb_col
        sta     @tmp2
eb_self_done:
        ; Neighbor: row-1 (up)
        lda     @tmp1
        jz     @eb_skip_up
        dec     A
        sta     @tmp1
        call    @explo_kill_at
        lda     @tmp1
        inc     A
        sta     @tmp1
eb_skip_up:
        ; Neighbor: row+1 (down)
        lda     @tmp1
        inc     A
        sta     @tmp1
        lda     @current_brick_rows
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jhs     @eb_skip_dn
        call    @explo_kill_at
eb_skip_dn:
        lda     @tmp1
        dec     A
        sta     @tmp1
        ; Neighbor: col-1 (left)
        lda     @tmp2
        jz     @eb_skip_lt
        dec     A
        sta     @tmp2
        call    @explo_kill_at
        lda     @tmp2
        inc     A
        sta     @tmp2
eb_skip_lt:
        ; Neighbor: col+1 (right)
        lda     @tmp2
        inc     A
        sta     @tmp2
        cmp     %BRICK_COLS,A
        jhs     @eb_skip_rt
        call    @explo_kill_at
eb_skip_rt:
        lda     @tmp2
        dec     A
        sta     @tmp2
        pop     B
        pop     A
        rets

; Kill brick at (tmp1,tmp2) unless empty or indestructible
explo_kill_at:
        push    A
        push    B
        lda     @tmp1
        mpy     %BRICK_COLS,A
        lda     @tmp2
        add     R0,R1
        mov     B,A
        sta     @tmp_lev_lo
        lda     @bricks(B)
        jz     @eka_done
        cmp     %BRICK_COLOR_INDES,A    ; immune
        jeq     @eka_done
        ; Save NEIGHBOR row/col before calls clobber tmp1/tmp2
        lda     @tmp1
        sta     @tmp_lev_hi         ; neighbor row
        lda     @tmp2
        sta     @tmp_lev_lo         ; neighbor col
        call    @sfx_brick
        lda     @tmp_lev_lo         ; restore brick index
        ; Recompute index (sfx trashed B)
        lda     @tmp_lev_hi
        mpy     %BRICK_COLS,A
        lda     @tmp_lev_lo
        add     R0,R1
        clr     A
        sta     @bricks(B)
        lda     @tmp_lev_hi
        sta     @tmp1
        lda     @tmp_lev_lo
        sta     @tmp2
        call    @erase_one_brick
        lda     @brick_count
        dec     A
        sta     @brick_count
        call    @add_score
        ; Restore neighbor coords after add_score clobbers tmp1/tmp2
        lda     @tmp_lev_hi
        sta     @tmp1
        lda     @tmp_lev_lo
        sta     @tmp2
eka_done:
        pop     B
        pop     A
        rets

draw_all_bricks:
        push    A
        push    B

        clr     A
        sta     @loop_i
dab_r:
        clr     A
        sta     @loop_j
dab_c:
        lda     @loop_i
        mpy     %BRICK_COLS,A
        lda     @loop_j
        add     R0,R1
        lda     @bricks(B)
        jz     @dab_nx

        ; A = color, set up and draw
        push    A
        lda     @loop_i
        sta     @tmp1
        lda     @loop_j
        sta     @tmp2
        pop     A
        call    @draw_one_brick

dab_nx:
        lda     @loop_j
        inc     A
        sta     @loop_j
        cmp     %BRICK_COLS,A
        jl     @dab_c

        lda     @loop_i
        inc     A
        sta     @loop_i
        mov     A,B
        lda     @current_brick_rows
        cmp     R0,R1
        jl     @dab_r

        pop     B
        pop     A
        rets

; ============================================================================
; DRAW_ONE_BRICK - Draw beveled brick
; ============================================================================
; IN: A = color (1-5), tmp1 = row, tmp2 = col
; Brick 16px × 8px:
;   Line 0: Yellow top
;   Line 1: Y(1)+White(14)+K(1)
;   Lines 2-6: Y(1)+Body(14)+K(1)
;   Line 7: Black shadow
; ============================================================================
draw_one_brick:
        push    A
        push    B

        ; save color (for power brick styling)
        sta     @tmp3

        ; Compute position (needed by all paths including rainbow)
        ; start_seg = col * 2 + GAME_X_SEG
        lda     @tmp2
        clrc
        rl      A
        add     %GAME_X_SEG,A
        mov     A,TEMP1              ; TEMP1 = start_seg

        ; start_y = BRICK_START_Y + row * BRICK_PITCH
        lda     @tmp1
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @cur_y

        ; Indestructible: rainbow special draw
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @dob_chk_explo
        br      @dob_rainbow
dob_chk_explo:
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @dob_normal
        br      @dob_hazard
dob_normal:

        ; Compute table offset: (color-1)*6
        dec     A
        mov     A,B
        clrc
        rl      A                    ; *2
        add     B,A                  ; *3
        clrc
        rl      A                    ; *6
        sta     @brick_idx

        ; --- Line 0: Yellow (or White for power bricks) ---
        push    TEMP1
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @tmp3
        cmp     %BRICK_COLOR_POWER,A
        jeq     @dob_line0_white
        cmp     %BRICK_COLOR_ARMOR,A   ; armor bricks: white border
        jhs     @dob_line0_white
        wvdp(%$00)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$00)
        wvdp(%$FF)
        wvdp(%$FF)
        jmp     @dob_line0_done
dob_line0_white:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
dob_line0_done:

        ; --- Line 1: White highlight (solid white for power bricks) ---
        lda     @cur_y
        inc     A
        sta     @cur_y
        pop     TEMP1
        push    TEMP1
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @tmp3
        cmp     %BRICK_COLOR_POWER,A
        jeq     @dob_line1_white
        cmp     %BRICK_COLOR_ARMOR,A   ; color 8: full white top
        jeq     @dob_line1_white
        cmp     %BRICK_COLOR_ARMOR2,A  ; color 9: border only
        jeq     @dob_line1_armor2
        wvdp(%$7F)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FE)
        wvdp(%$FE)
        wvdp(%$FE)
        jmp     @dob_line1_done
dob_line1_armor2:
        wvdp(%$C0)
        wvdp(%$C0)
        wvdp(%$C0)
        wvdp(%$03)
        wvdp(%$03)
        wvdp(%$03)
        jmp     @dob_line1_done
dob_line1_white:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
dob_line1_done:

        ; --- Lines 2-3: Body highlight (2 lines) ---
        mov     %2,A
        sta     @line_cnt
        lda     @cur_y
        inc     A
        sta     @cur_y
dob_hi:
        pop     TEMP1
        push    TEMP1
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at

        ; Write 6 bytes from brick_body_hi table
        lda     @brick_idx
        mov     A,B
        lda     @brick_body_hi(B)
        movp    A,P46
        inc     B
        lda     @brick_body_hi(B)
        movp    A,P46
        inc     B
        lda     @brick_body_hi(B)
        movp    A,P46
        inc     B
        lda     @brick_body_hi(B)
        movp    A,P46
        inc     B
        lda     @brick_body_hi(B)
        movp    A,P46
        inc     B
        lda     @brick_body_hi(B)
        movp    A,P46

        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dob_hi

        ; --- Lines 4-6: Body (3 lines) ---
        mov     %3,A
        sta     @line_cnt
dob_bd:
        pop     TEMP1
        push    TEMP1
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at

        ; Write 6 bytes from brick_body table
        lda     @brick_idx
        mov     A,B
        lda     @brick_body(B)
        movp    A,P46
        inc     B
        lda     @brick_body(B)
        movp    A,P46
        inc     B
        lda     @brick_body(B)
        movp    A,P46
        inc     B
        lda     @brick_body(B)
        movp    A,P46
        inc     B
        lda     @brick_body(B)
        movp    A,P46
        inc     B
        lda     @brick_body(B)
        movp    A,P46

        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        jnz     @dob_bd

        ; --- Line 7: Black shadow (white for armor bricks) ---
        pop     TEMP1
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @tmp3
        cmp     %BRICK_COLOR_ARMOR,A
        jhs     @dob_line7_armor       ; both 8 and 9: white bottom
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        jmp     @dob_line7_done
dob_line7_armor:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
dob_line7_done:
        br      @dob_end

; --- Hazard stripe draw for explosive brick ---
; 8 lines alternating red/yellow
dob_hazard:
        ; Counter in A on stack (line_cnt=$C40A=key_last — must not use!)
        mov     %8,A
        push    A                   ; stack: [counter=8]
        push    TEMP1               ; stack: [counter, TEMP1]
        clr     A
        sta     @tmp_rb_idx         ; 0=red, 1=yellow
dob_hz_loop:
        pop     TEMP1               ; stack: [counter]
        push    TEMP1               ; stack: [counter, TEMP1]
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @tmp_rb_idx
        jnz     @dob_hz_yellow
        ; Red line: B=0 G=0 R=1
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$FF)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$FE)
        jmp     @dob_hz_next
dob_hz_yellow:
        ; Yellow line: B=0 G=1 R=1
        wvdp(%$00)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$00)
        wvdp(%$FE)
        wvdp(%$FE)
dob_hz_next:
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @tmp_rb_idx
        xor     %1,A               ; toggle 0/1
        sta     @tmp_rb_idx
        pop     TEMP1               ; restore TEMP1
        pop     A                   ; restore counter
        dec     A
        jnz     @dob_hz_loop_push
        jmp     @dob_end
dob_hz_loop_push:
        push    A
        push    TEMP1
        jmp     @dob_hz_loop

; --- Rainbow draw for indestructible brick ---
; 8 lines, cycling through 6 colors: R, M(Magenta), Y, G, C, B, R, M
; Each 6 bytes: seg0(B,G,R) seg1(B,G,R)
dob_rainbow:
        ; cur_y and TEMP1 already computed above
        ; Counter in A on stack (line_cnt=$C40A=key_last — must not use!)
        mov     %8,A
        push    A                   ; stack: [counter=8]
        push    TEMP1               ; stack: [counter, TEMP1]
        clr     A
        sta     @tmp_rb_idx         ; rainbow line counter
dob_rb_loop:
        pop     TEMP1               ; stack: [counter]
        push    TEMP1               ; stack: [counter, TEMP1]
        mov     TEMP1,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        lda     @tmp_rb_idx
        mov     A,B
        clrc
        rl      A                   ; *2
        add     B,A                 ; *3
        clrc
        rl      A                   ; *6 = table offset
        mov     A,B
        lda     @rainbow_body(B)
        movp    A,P46
        inc     B
        lda     @rainbow_body(B)
        movp    A,P46
        inc     B
        lda     @rainbow_body(B)
        movp    A,P46
        inc     B
        lda     @rainbow_body(B)
        movp    A,P46
        inc     B
        lda     @rainbow_body(B)
        movp    A,P46
        inc     B
        lda     @rainbow_body(B)
        movp    A,P46
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @tmp_rb_idx
        inc     A
        cmp     %6,A
        jl     @dob_rb_no_wrap
        clr     A
dob_rb_no_wrap:
        sta     @tmp_rb_idx
        pop     TEMP1               ; restore TEMP1
        pop     A                   ; restore counter
        dec     A
        jnz     @dob_rb_loop_push
        jmp     @dob_end            ; done: dob_end pops B and A
dob_rb_loop_push:
        push    A                   ; save counter
        push    TEMP1               ; save TEMP1
        jmp     @dob_rb_loop

dob_end:
        pop     B
        pop     A
        rets

; ============================================================================
; Brick body color table: 6 bytes per color
; seg0(B,G,R) + seg1(B,G,R)
; Seg0: bit7=yellow(B:0,G:1,R:1), bits6-0=body
; Seg1: bits7-1=body, bit0=black(0,0,0)
; ============================================================================
brick_body_hi:
        ; 1: Red    (B:0 G:0 R:1) + white highlight stripe
        .byte   $30,$B0,$FF,  $00,$00,$FE
        ; 2: Magenta(B:1 G:0 R:1) + white highlight stripe
        .byte   $7F,$B0,$FF,  $FE,$00,$FE
        ; 3: Green  (B:0 G:1 R:0) + white highlight stripe
        .byte   $30,$FF,$B0,  $00,$FE,$00
        ; 4: Cyan   (B:1 G:1 R:0) + white highlight stripe
        .byte   $7F,$FF,$B0,  $FE,$FE,$00
        ; 5: White  (B:1 G:1 R:1)
        .byte   $7F,$FF,$FF,  $FE,$FE,$FE
        ; 6: Dark Blue (B:1 G:0 R:0) + white highlight stripe
        .byte   $7F,$B0,$00,  $FE,$00,$00
        ; 7: Yellow (B:0 G:1 R:1) + white highlight stripe
        .byte   $30,$FF,$FF,  $00,$FE,$FE
        ; 8: Armor full  - side borders only (black inside)
        .byte   $C0,$C0,$C0,  $03,$03,$03
        ; 9: Armor dmgd  - side borders + dither cracks
        .byte   $C0,$CC,$C0,  $03,$33,$03

brick_body:
        ; 1: Red    (B:0 G:0 R:1)
        .byte   $00,$80,$FF,  $00,$00,$FE
        ; 2: Magenta(B:1 G:0 R:1)
        .byte   $7F,$80,$FF,  $FE,$00,$FE
        ; 3: Green  (B:0 G:1 R:0)
        .byte   $00,$FF,$80,  $00,$FE,$00
        ; 4: Cyan   (B:1 G:1 R:0)
        .byte   $7F,$FF,$80,  $FE,$FE,$00
        ; 5: White  (B:1 G:1 R:1)
        .byte   $7F,$FF,$FF,  $FE,$FE,$FE
        ; 6: Dark Blue (B:1 G:0 R:0)
        .byte   $7F,$80,$00,  $FE,$00,$00
        ; 7: Yellow (B:0 G:1 R:1)
        .byte   $00,$FF,$FF,  $00,$FE,$FE
        ; 8: Armor full  - side borders only
        .byte   $C0,$C0,$C0,  $03,$03,$03
        ; 9: Armor dmgd  - dither cracks visible
        .byte   $C0,$AA,$C0,  $03,$55,$03

rainbow_body:
        ; 6 colors, 6 bytes each: seg0(B,G,R) seg1(B,G,R)
        ; 0: Red
        .byte   $00,$00,$FF,  $00,$00,$FE
        ; 1: Magenta
        .byte   $FF,$00,$FF,  $FE,$00,$FE
        ; 2: Yellow
        .byte   $00,$FF,$FF,  $00,$FE,$FE
        ; 3: Green
        .byte   $00,$FF,$00,  $00,$FE,$00
        ; 4: Cyan
        .byte   $FF,$FF,$00,  $FE,$FE,$00
        ; 5: Dark Blue
        .byte   $FF,$00,$00,  $FE,$00,$00

; ============================================================================
; Score digits (20x20), per segment mask (yellow on black)
; ============================================================================
digit_s0_tbl:
        ; 0
        .byte   $01,$03,$07,$08,$18,$38,$38,$18,$08,$00,$00,$00,$08,$18,$38,$18,$08,$01,$03,$07
        ; 1
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ; 2
        .byte   $01,$03,$07,$00,$00,$00,$00,$00,$00,$01,$03,$07,$08,$18,$38,$18,$08,$01,$03,$07
        ; 3
        .byte   $01,$03,$07,$00,$00,$00,$00,$00,$00,$01,$03,$07,$00,$00,$00,$00,$00,$01,$03,$07
        ; 4
        .byte   $00,$00,$00,$08,$18,$38,$38,$18,$08,$01,$03,$07,$00,$00,$00,$00,$00,$00,$00,$00
        ; 5
        .byte   $01,$03,$07,$08,$18,$38,$38,$18,$08,$01,$03,$07,$00,$00,$00,$00,$00,$01,$03,$07
        ; 6
        .byte   $01,$03,$07,$08,$18,$38,$38,$18,$08,$01,$03,$07,$08,$18,$38,$18,$08,$01,$03,$07
        ; 7
        .byte   $01,$03,$07,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ; 8
        .byte   $01,$03,$07,$08,$18,$38,$38,$18,$08,$01,$03,$07,$08,$18,$38,$18,$08,$01,$03,$07
        ; 9
        .byte   $01,$03,$07,$08,$18,$38,$38,$18,$08,$01,$03,$07,$00,$00,$00,$00,$00,$01,$03,$07

digit_s1_tbl:
        ; 0
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 1
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ; 2
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 3
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 4
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00
        ; 5
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 6
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 7
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        ; 8
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF
        ; 9
        .byte   $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$00,$FF,$FF,$FF

digit_s2_tbl:
        ; 0
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$00,$00,$00,$04,$0C,$1C,$0C,$04,$80,$C0,$E0
        ; 1
        .byte   $00,$00,$00,$04,$0C,$1C,$1C,$0C,$04,$00,$00,$00,$04,$0C,$1C,$0C,$04,$00,$00,$00
        ; 2
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$80,$C0,$E0,$00,$00,$00,$00,$00,$80,$C0,$E0
        ; 3
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$80,$C0,$E0
        ; 4
        .byte   $00,$00,$00,$04,$0C,$1C,$1C,$0C,$04,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$00,$00,$00
        ; 5
        .byte   $80,$C0,$E0,$00,$00,$00,$00,$00,$00,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$80,$C0,$E0
        ; 6
        .byte   $80,$C0,$E0,$00,$00,$00,$00,$00,$00,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$80,$C0,$E0
        ; 7
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$00,$00,$00,$04,$0C,$1C,$0C,$04,$00,$00,$00
        ; 8
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$80,$C0,$E0
        ; 9
        .byte   $80,$C0,$E0,$04,$0C,$1C,$1C,$0C,$04,$80,$C0,$E0,$04,$0C,$1C,$0C,$04,$80,$C0,$E0

digit_ofs:
        .byte   0,20,40,60,80,100,120,140,160,180

label_s0_tbl:
        ; S
        .byte   $0F,$0F,$30,$30,$30,$0F,$0F,$00,$00,$00,$0F,$0F
        ; C
        .byte   $0F,$0F,$30,$30,$30,$00,$00,$30,$30,$30,$0F,$0F
        ; O
        .byte   $0F,$0F,$30,$30,$30,$00,$00,$30,$30,$30,$0F,$0F
        ; R
        .byte   $0F,$0F,$30,$30,$30,$3F,$3F,$31,$30,$30,$30,$00
        ; E
        .byte   $0F,$0F,$30,$30,$30,$0F,$0F,$30,$30,$30,$0F,$0F
        ; :
        .byte   $00,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$00
        ; L
        .byte   $00,$30,$30,$30,$30,$30,$30,$30,$30,$30,$3F,$3F
        ; I
        .byte   $3F,$3F,$01,$01,$01,$01,$01,$01,$01,$01,$3F,$3F
        ; V
        .byte   $00,$30,$30,$30,$30,$30,$30,$30,$30,$01,$01,$01
        ; G
        .byte   $0F,$0F,$30,$30,$30,$3F,$3F,$30,$30,$30,$0F,$0F
        ; A
        .byte   $0F,$0F,$30,$30,$30,$3F,$3F,$30,$30,$30,$30,$30
        ; M
        .byte   $00,$3C,$36,$33,$31,$33,$30,$30,$30,$30,$30,$00
        ; P
        .byte   $0F,$0F,$30,$30,$30,$3F,$3F,$30,$30,$30,$30,$30
        ; U
        .byte   $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$0F,$0F
        ; T
        .byte   $3F,$3F,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
        ; D
        .byte   $07,$07,$30,$30,$30,$30,$30,$30,$30,$30,$07,$07
        ; B (index 16)
        .byte   $0F,$0F,$30,$30,$30,$3F,$3F,$30,$30,$30,$0F,$0F

label_s1_tbl:
        ; S
        .byte   $F0,$F0,$00,$00,$00,$F0,$F0,$0C,$0C,$0C,$F0,$F0
        ; C
        .byte   $F0,$F0,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
        ; O
        .byte   $F0,$F0,$0C,$0C,$0C,$00,$00,$0C,$0C,$0C,$F0,$F0
        ; R
        .byte   $F0,$F0,$0C,$0C,$0C,$F0,$F0,$80,$C0,$60,$0C,$00
        ; E
        .byte   $F0,$F0,$00,$00,$00,$F0,$F0,$00,$00,$00,$F0,$F0
        ; :
        .byte   $00,$00,$00,$80,$80,$00,$00,$80,$80,$00,$00,$00
        ; L
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC
        ; I
        .byte   $FC,$FC,$80,$80,$80,$80,$80,$80,$80,$80,$FC,$FC
        ; V
        .byte   $00,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$80,$80,$80
        ; G
        .byte   $00,$00,$00,$00,$00,$00,$00,$0C,$0C,$0C,$00,$00
        ; A
        .byte   $F0,$F0,$0C,$0C,$0C,$FC,$FC,$0C,$0C,$0C,$0C,$0C
        ; M
        .byte   $00,$3C,$6C,$CC,$8C,$CC,$0C,$0C,$0C,$0C,$0C,$00
        ; P
        .byte   $F0,$F0,$0C,$0C,$0C,$F0,$F0,$00,$00,$00,$00,$00
        ; U
        .byte   $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$F0,$F0
        ; T
        .byte   $FC,$FC,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
        ; D
        .byte   $C0,$C0,$1C,$1C,$1C,$1C,$1C,$1C,$18,$10,$C0,$C0
        ; B (index 16)
        .byte   $F0,$F0,$0C,$0C,$0C,$F0,$F0,$0C,$0C,$0C,$F0,$F0

label_ofs:
        .byte   0,12,24,36,48,60,72,84,96,108,120,132,144,156,168,180,192

; Simple 5x7 font (8px wide masks) for labels: S,C,O,R,E,:,V,I,T
label_simple_tbl:
        ; S
        .byte   $F8,$88,$80,$F0,$08,$88,$F8
        ; C
        .byte   $78,$80,$80,$80,$80,$80,$78
        ; O
        .byte   $70,$88,$88,$88,$88,$88,$70
        ; R
        .byte   $F0,$88,$88,$F0,$A0,$90,$88
        ; E
        .byte   $F8,$80,$80,$F0,$80,$80,$F8
        ; :
        .byte   $00,$20,$20,$00,$20,$20,$00
        ; V
        .byte   $88,$88,$88,$88,$88,$50,$20
        ; I
        .byte   $F8,$20,$20,$20,$20,$20,$F8
        ; T
        .byte   $F8,$20,$20,$20,$20,$20,$20
        ; N
        .byte   $88,$C8,$A8,$98,$88,$88,$88
        ; A
        .byte   $70,$88,$88,$F8,$88,$88,$88
        ; U
        .byte   $88,$88,$88,$88,$88,$88,$70

label_simple_ofs:
        .byte   0,7,14,21,28,35,42,49,56,63,70,77

; Title bitmap (EXELNOID), 74 rows x 12 segments, 4 blocks, interleaved B,G,R bytes (blue glow)
gtitle_r_tbl0:
        .byte   $00,$09,$C3,$00,$00,$00,$00,$00,$00,$00,$18,$00
        .byte   $00,$0E,$C3,$80,$00,$00,$00,$00,$00,$00,$30,$00
        .byte   $00,$0F,$79,$C0,$00,$00,$00,$00,$00,$00,$E0,$00
        .byte   $00,$03,$B8,$E0,$00,$00,$00,$10,$00,$01,$C0,$0E
        .byte   $00,$01,$EC,$60,$00,$00,$00,$10,$00,$03,$00,$0E
        .byte   $00,$00,$77,$70,$00,$00,$00,$6C,$06,$0C,$00,$18
        .byte   $00,$00,$39,$98,$00,$00,$00,$30,$0E,$18,$00,$70
        .byte   $01,$80,$1F,$DC,$00,$00,$00,$10,$1C,$30,$00,$F0
        .byte   $01,$E0,$1F,$7E,$00,$00,$00,$00,$18,$60,$03,$C0
        .byte   $00,$F0,$23,$F6,$00,$00,$00,$00,$38,$C0,$1F,$80
        .byte   $00,$1C,$09,$DB,$80,$00,$00,$00,$73,$80,$7C,$00
        .byte   $00,$07,$26,$77,$80,$00,$00,$00,$C7,$0A,$F0,$00
        .byte   $7F,$FF,$F8,$7D,$C0,$1F,$F8,$01,$CC,$13,$83,$FF
        .byte   $7F,$FF,$FE,$1F,$40,$FF,$FC,$03,$B1,$FF,$FB,$FF
        .byte   $FF,$FF,$FE,$07,$B0,$FF,$FE,$07,$41,$FF,$FF,$FF
        .byte   $FF,$FF,$FE,$11,$D8,$FF,$DC,$0E,$C1,$FF,$FF,$FF
        .byte   $F0,$01,$AE,$19,$E0,$F8,$1C,$19,$01,$F0,$7F,$83
        .byte   $F0,$00,$4F,$FF,$FF,$F8,$1F,$FF,$FF,$F0,$7F,$83
        .byte   $F0,$00,$CF,$FF,$FF,$F8,$1F,$FF,$FF,$F0,$7F,$83

gtitle_r_tbl1:
        .byte   $F0,$13,$EF,$FF,$FF,$F8,$1F,$FF,$FF,$F7,$FF,$83
        .byte   $F0,$00,$00,$70,$00,$18,$00,$07,$80,$71,$70,$03
        .byte   $F0,$40,$00,$90,$00,$20,$00,$03,$00,$00,$00,$03
        .byte   $F0,$40,$08,$30,$00,$00,$02,$00,$00,$00,$00,$03
        .byte   $F0,$02,$20,$20,$C0,$08,$00,$04,$00,$30,$80,$03
        .byte   $F0,$00,$04,$00,$8F,$08,$00,$00,$00,$10,$81,$03
        .byte   $F0,$00,$02,$04,$08,$08,$00,$02,$00,$10,$82,$03
        .byte   $F0,$10,$20,$00,$00,$88,$01,$02,$10,$10,$82,$03
        .byte   $F0,$C0,$00,$08,$00,$A8,$01,$22,$10,$10,$82,$03
        .byte   $F0,$40,$02,$00,$0F,$F8,$01,$22,$11,$10,$82,$03
        .byte   $F0,$40,$02,$00,$08,$00,$01,$22,$11,$10,$82,$03
        .byte   $F0,$0C,$03,$00,$08,$18,$01,$22,$10,$10,$80,$03
        .byte   $F0,$00,$00,$00,$00,$00,$01,$26,$80,$00,$A0,$03
        .byte   $F0,$00,$10,$90,$00,$00,$00,$22,$40,$40,$80,$03
        .byte   $F0,$00,$10,$01,$00,$20,$01,$00,$00,$C0,$80,$83
        .byte   $F0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

gtitle_r_tbl2:
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $10,$00,$03,$E0,$00,$00,$00,$0F,$84,$02,$40,$00
        .byte   $30,$00,$1E,$01,$E0,$60,$01,$D7,$C3,$0F,$D0,$00
        .byte   $7C,$00,$7C,$0F,$80,$E0,$00,$DC,$F1,$8F,$F0,$00
        .byte   $7C,$01,$E0,$CF,$E1,$80,$00,$E6,$78,$07,$E0,$00
        .byte   $10,$07,$C1,$17,$F3,$00,$00,$73,$1C,$07,$F0,$00
        .byte   $10,$0F,$8C,$7F,$F2,$00,$00,$39,$8F,$1F,$F8,$00
        .byte   $00,$79,$FA,$CF,$FE,$00,$00,$18,$47,$9F,$F8,$00
        .byte   $00,$70,$FF,$9F,$FC,$00,$00,$0E,$73,$C7,$E0,$00
        .byte   $00,$07,$7E,$7F,$F8,$00,$00,$06,$39,$EF,$F0,$00
        .byte   $00,$0F,$9F,$FF,$B0,$00,$00,$07,$B8,$7E,$D0,$00
        .byte   $00,$07,$7F,$FF,$F0,$00,$00,$03,$9E,$7C,$40,$00
        .byte   $00,$07,$FF,$FC,$20,$00,$00,$03,$C6,$1E,$00,$00
        .byte   $00,$0F,$FF,$F9,$00,$00,$00,$01,$C3,$0F,$00,$00
        .byte   $00,$3F,$FF,$F0,$20,$00,$00,$00,$E1,$03,$00,$00
        .byte   $00,$1F,$FF,$E0,$00,$00,$00,$00,$60,$81,$00,$00
        .byte   $00,$3F,$FF,$80,$00,$00,$00,$00,$00,$60,$00,$00
        .byte   $00,$00,$5F,$00,$00,$00,$00,$00,$00,$20,$00,$00

gtitle_r_tbl3:
        .byte   $00,$00,$3E,$00,$00,$00,$00,$00,$00,$30,$00,$00
        .byte   $00,$00,$E0,$00,$00,$00,$00,$00,$00,$00,$08,$00
        .byte   $00,$00,$80,$00,$04,$00,$00,$00,$00,$01,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

gtitle_g_tbl0:
        .byte   $1C,$09,$C3,$00,$00,$00,$00,$00,$00,$00,$3C,$E0
        .byte   $1F,$0E,$E3,$80,$00,$00,$00,$00,$00,$00,$33,$E0
        .byte   $07,$8F,$F1,$C0,$00,$00,$00,$00,$00,$00,$E7,$80
        .byte   $01,$C3,$B8,$E0,$00,$00,$00,$10,$00,$01,$CE,$0E
        .byte   $00,$F1,$EC,$60,$00,$00,$00,$10,$00,$03,$1E,$0E
        .byte   $00,$FC,$73,$70,$00,$00,$00,$6C,$06,$0C,$78,$18
        .byte   $00,$3C,$39,$98,$00,$00,$00,$30,$0E,$18,$F0,$70
        .byte   $01,$8F,$1F,$DC,$00,$00,$00,$10,$1C,$31,$C0,$F0
        .byte   $01,$E7,$EF,$7E,$00,$00,$00,$00,$1C,$6F,$03,$C0
        .byte   $00,$F1,$E7,$F6,$00,$00,$00,$00,$78,$CF,$1F,$80
        .byte   $00,$1C,$39,$DB,$80,$00,$00,$00,$73,$BE,$7C,$00
        .byte   $00,$07,$3C,$77,$80,$00,$00,$00,$C7,$F8,$70,$00
        .byte   $00,$03,$9F,$7D,$C0,$00,$00,$01,$DC,$E3,$80,$00
        .byte   $80,$00,$03,$9F,$40,$E0,$04,$03,$B9,$C0,$00,$00
        .byte   $C0,$00,$01,$E7,$B0,$E0,$16,$07,$71,$C0,$0E,$00
        .byte   $C8,$00,$12,$F1,$D8,$E0,$16,$0E,$C1,$D0,$0E,$00
        .byte   $C7,$FF,$E3,$FD,$EC,$E3,$D6,$1D,$81,$CF,$8E,$7C
        .byte   $C7,$FF,$E0,$1C,$EC,$E3,$E6,$19,$81,$CF,$8E,$7C
        .byte   $C7,$FF,$E0,$00,$00,$03,$E0,$00,$00,$0F,$8C,$7C

gtitle_g_tbl1:
        .byte   $C7,$FF,$E0,$00,$00,$03,$E0,$00,$00,$0F,$90,$7C
        .byte   $C7,$C0,$0F,$0F,$9F,$E3,$E6,$03,$01,$A0,$00,$7C
        .byte   $C7,$C0,$1F,$9F,$9F,$E3,$DF,$FB,$7F,$CF,$8F,$FC
        .byte   $C7,$C0,$0F,$DF,$FF,$F3,$DF,$FC,$FF,$EF,$9F,$FE
        .byte   $C7,$FF,$E7,$FF,$FF,$FB,$DF,$FF,$FF,$FF,$BF,$FE
        .byte   $C7,$FF,$E3,$FE,$FF,$FB,$DF,$FF,$FF,$FF,$BF,$FE
        .byte   $C7,$FF,$E3,$FC,$FB,$FB,$DF,$3F,$F1,$FF,$BC,$7E
        .byte   $C7,$FF,$E1,$F8,$FF,$FB,$DF,$3F,$F1,$FF,$BC,$7E
        .byte   $C7,$C0,$01,$F8,$FF,$FB,$DF,$3F,$F1,$FF,$BE,$7E
        .byte   $C7,$C0,$01,$FC,$FF,$FB,$DF,$3F,$F1,$FF,$BC,$7E
        .byte   $C7,$C0,$07,$FC,$F8,$7B,$DF,$3F,$F1,$FF,$BE,$7C
        .byte   $C7,$FF,$E7,$FE,$FF,$FB,$DF,$3F,$FF,$FF,$BF,$FC
        .byte   $C7,$FF,$E7,$FF,$FF,$FB,$DF,$3F,$FF,$FF,$BF,$FC
        .byte   $C7,$FF,$FF,$DF,$FF,$F3,$DF,$3E,$FF,$EF,$9F,$FC
        .byte   $C7,$FF,$FF,$8F,$9F,$E3,$DF,$3E,$3F,$CF,$8F,$FC
        .byte   $C8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
        .byte   $C0,$00,$00,$00,$E0,$00,$00,$00,$00,$00,$00,$00
        .byte   $C0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

gtitle_g_tbl2:
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $10,$00,$07,$E0,$20,$30,$03,$AF,$86,$00,$00,$00
        .byte   $30,$00,$3E,$01,$E0,$60,$03,$DF,$C3,$85,$A0,$00
        .byte   $7C,$00,$7E,$07,$80,$E0,$01,$DC,$F1,$87,$E0,$00
        .byte   $7C,$01,$E0,$DF,$01,$80,$00,$E7,$78,$0F,$F0,$00
        .byte   $10,$07,$C0,$3C,$03,$80,$00,$73,$9C,$0F,$F0,$00
        .byte   $10,$1E,$20,$F2,$32,$00,$00,$79,$8F,$0F,$E0,$00
        .byte   $00,$78,$3B,$E1,$3E,$00,$00,$3C,$E7,$97,$E0,$00
        .byte   $00,$70,$7F,$81,$FC,$00,$00,$0E,$73,$C7,$E0,$00
        .byte   $00,$05,$7E,$34,$D8,$00,$00,$06,$39,$EF,$E0,$00
        .byte   $00,$07,$19,$89,$B0,$00,$00,$07,$98,$70,$80,$00
        .byte   $00,$0F,$7F,$FF,$70,$00,$00,$07,$8E,$79,$C0,$00
        .byte   $00,$1E,$FF,$B8,$60,$00,$00,$03,$C6,$1E,$00,$00
        .byte   $00,$1F,$FF,$F3,$00,$00,$00,$01,$C3,$0F,$00,$00
        .byte   $00,$FF,$F5,$FE,$FC,$00,$00,$10,$E3,$83,$00,$00
        .byte   $00,$1F,$FF,$E6,$10,$00,$00,$00,$60,$C1,$00,$00
        .byte   $00,$FF,$8F,$8C,$B8,$00,$00,$00,$20,$60,$00,$00
        .byte   $00,$00,$1F,$0C,$00,$00,$00,$00,$00,$20,$00,$00

gtitle_g_tbl3:
        .byte   $00,$00,$1E,$11,$E0,$00,$10,$00,$00,$30,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

gtitle_b_tbl0:
        .byte   $3F,$1F,$E7,$80,$00,$00,$00,$00,$00,$00,$FF,$F0
        .byte   $3F,$9D,$DF,$40,$00,$00,$00,$00,$00,$01,$FF,$F0
        .byte   $1F,$DE,$7F,$E0,$00,$00,$00,$10,$00,$03,$FF,$EE
        .byte   $07,$FF,$FD,$50,$00,$00,$00,$38,$00,$07,$FF,$95
        .byte   $01,$FF,$DF,$90,$00,$00,$00,$7C,$06,$0F,$FF,$3F
        .byte   $01,$FF,$FF,$B8,$00,$00,$00,$FE,$09,$1F,$FE,$76
        .byte   $01,$FF,$7F,$F4,$00,$00,$00,$4C,$11,$7F,$F8,$B8
        .byte   $03,$FF,$FD,$FE,$00,$00,$00,$38,$22,$FF,$F3,$C8
        .byte   $03,$FF,$EE,$FD,$00,$00,$00,$10,$73,$FF,$DF,$B0
        .byte   $01,$FF,$F9,$7D,$80,$00,$00,$00,$97,$FF,$F5,$40
        .byte   $00,$FF,$FE,$7E,$40,$00,$00,$00,$CF,$FF,$F7,$80
        .byte   $7F,$FF,$FD,$9F,$40,$1F,$F8,$01,$3F,$7D,$FF,$FF
        .byte   $BF,$E7,$FF,$AF,$A0,$FF,$F4,$02,$BF,$EC,$7F,$FC
        .byte   $7F,$FF,$FF,$E5,$F1,$3F,$FE,$05,$7F,$FF,$FF,$FF
        .byte   $7F,$FF,$FF,$FA,$F9,$FF,$FD,$0A,$FB,$FF,$F3,$FF
        .byte   $78,$00,$0F,$FE,$FD,$FC,$3D,$15,$F3,$F0,$F3,$83
        .byte   $7F,$FF,$FF,$FE,$1F,$7F,$FD,$E3,$FF,$FF,$F7,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$DF,$FF,$FF,$FF,$B3,$7F
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$DF,$FF,$FF,$FF,$BF,$7F

gtitle_b_tbl1:
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$DF,$FF,$FF,$FF,$BF,$7F
        .byte   $FF,$FF,$FF,$FF,$78,$1F,$F9,$FF,$FE,$7E,$FF,$FF
        .byte   $FF,$E0,$3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$DF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$FB,$FF,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$F7,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$FF
        .byte   $FF,$FF,$F3,$FD,$FF,$FF,$FF,$FF,$FB,$FF,$FD,$FF
        .byte   $FF,$FF,$E3,$FD,$FF,$FF,$FF,$FF,$FB,$FF,$FF,$FF
        .byte   $7F,$E0,$05,$FF,$FF,$FF,$FF,$FF,$FB,$FF,$FD,$FF
        .byte   $7F,$FF,$EF,$FF,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$EF,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$DF,$FF,$F7,$FF,$FF,$FF,$FF,$DF,$FF
        .byte   $F7,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

gtitle_b_tbl2:
        .byte   $8F,$E1,$FF,$F0,$7F,$87,$FE,$0F,$F3,$FF,$FF,$FE
        .byte   $9F,$C0,$3F,$92,$3F,$FF,$E8,$7F,$FF,$FD,$FC,$00
        .byte   $EF,$FF,$F8,$1F,$FF,$FF,$FC,$7B,$FF,$FF,$FF,$FF
        .byte   $5C,$00,$5D,$EF,$FD,$F8,$04,$FD,$FF,$FF,$D8,$00
        .byte   $FA,$01,$A5,$D7,$E1,$F0,$02,$7F,$EF,$FF,$F8,$00
        .byte   $FA,$06,$DF,$BF,$13,$E0,$01,$3F,$97,$D7,$E8,$00
        .byte   $7C,$18,$2E,$FC,$AF,$40,$00,$9F,$EF,$1F,$E8,$00
        .byte   $28,$61,$53,$F3,$FF,$80,$00,$8F,$FE,$BF,$FC,$00
        .byte   $10,$96,$B7,$F7,$FF,$00,$00,$5B,$FB,$FF,$F4,$00
        .byte   $00,$8F,$FF,$E7,$DE,$00,$00,$3F,$FD,$FF,$F8,$00
        .byte   $00,$7B,$EF,$9B,$DC,$00,$00,$0F,$FF,$F7,$E8,$00
        .byte   $00,$17,$7C,$FF,$78,$00,$00,$0F,$FF,$DF,$F8,$00
        .byte   $00,$17,$FB,$FE,$E8,$00,$00,$0B,$FF,$AE,$70,$00
        .byte   $00,$26,$F7,$FF,$F0,$00,$00,$07,$FF,$6D,$C0,$00
        .byte   $00,$E5,$CF,$F4,$FC,$00,$00,$12,$E7,$9F,$80,$00
        .byte   $01,$0F,$BF,$F1,$02,$00,$00,$29,$F7,$EF,$80,$00
        .byte   $00,$EE,$FD,$F9,$EC,$00,$00,$10,$B3,$F3,$80,$00
        .byte   $01,$0F,$FF,$F3,$44,$00,$00,$00,$51,$F9,$00,$00
        .byte   $00,$FF,$F7,$93,$F8,$00,$10,$00,$20,$F8,$00,$00

gtitle_b_tbl3:
        .byte   $00,$02,$DD,$2E,$10,$00,$68,$00,$00,$78,$08,$00
        .byte   $00,$01,$DE,$11,$E4,$00,$B0,$00,$00,$39,$14,$00
        .byte   $00,$01,$E0,$00,$0A,$00,$40,$00,$00,$12,$88,$00
        .byte   $00,$00,$80,$00,$04,$00,$00,$00,$00,$01,$20,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$50,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

; 8x8 (segment-style) label font: S,C,O,R,E,:,V,I,T
; 8px label font for "VITESSE :"
; ============================================================================
; UTILITIES
draw_border:
        push    A
        push    B

        ; Top border (5 lines)
        mov     %BORDER_TOP_Y,A
        sta     @cur_y
        mov     %BORDER_W,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
db_top_ln:
        call    @draw_top_border_line
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        jnz     @db_top_ln

        ; Vertical borders (game height)
        mov     %GAME_Y,A
        sta     @cur_y
        mov     %GAME_H,A
        sta     @line_cnt
        clr     A
        sta     @tmp1
db_side:
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        call    @set_line_at
        lda     @tmp1
        jz     @db_side_left_a
        wvdp(%BL_MASK_PAT_B)
        wvdp(%BL_MASK_PAT_B)
        wvdp(%BL_MASK_PAT_B)
        br      @db_side_left_done
db_side_left_a:
        wvdp(%BL_MASK_PAT_A)
        wvdp(%BL_MASK_PAT_A)
        wvdp(%BL_MASK_PAT_A)
db_side_left_done:
        mov     %BORDER_RIGHT_SEG,B
        lda     @cur_y
        call    @set_line_at
        lda     @tmp1
        jz     @db_side_right_a
        wvdp(%BR_MASK_PAT_B)
        wvdp(%BR_MASK_PAT_B)
        wvdp(%BR_MASK_PAT_B)
        br      @db_side_right_done
db_side_right_a:
        wvdp(%BR_MASK_PAT_A)
        wvdp(%BR_MASK_PAT_A)
        wvdp(%BR_MASK_PAT_A)
db_side_right_done:
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        lda     @tmp1
        xor     %1,A
        sta     @tmp1
        lda     @line_cnt
        jnz     @db_side

        ; Bottom border (5 lines)
        mov     %BORDER_BOTTOM_Y,A
        sta     @cur_y
        mov     %BORDER_W,A
        sta     @line_cnt
        clr     A
        sta     @loop_i
db_bot_ln:
        call    @draw_bottom_border_line
        lda     @cur_y
        inc     A
        sta     @cur_y
        lda     @line_cnt
        dec     A
        sta     @line_cnt
        lda     @loop_i
        inc     A
        sta     @loop_i
        lda     @line_cnt
        jnz     @db_bot_ln

        pop     B
        pop     A
        rets

; draw_top_border_line: uses cur_y and loop_i
draw_top_border_line:
        push    A
        push    B
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        call    @set_line_at
        lda     @loop_i
        cmp     %0,A
        jeq     @dt_left_round
        cmp     %BORDER_W-1,A
        jeq     @dt_left_round
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        br      @dt_left_done
dt_left_round:
        wvdp(%BL_MASK_TOP)
        wvdp(%BL_MASK_TOP)
        wvdp(%BL_MASK_TOP)
dt_left_done:
        lda     @loop_i
        cmp     %2,A
        jeq     @dt_mid_pat
        mov     %BORDER_MID_SEGS,B
dt_mid:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,dt_mid
        br      @dt_right
dt_mid_pat:
        mov     %PAT_A,A
        sta     @tmp1
        mov     %BORDER_MID_SEGS,B
dt_mid_pat_lp:
        lda     @tmp1
        movp    A,P46
        movp    A,P46
        movp    A,P46
        lda     @tmp1
        xor     %$FF,A
        sta     @tmp1
        djnz    B,dt_mid_pat_lp
dt_right:
        lda     @loop_i
        cmp     %0,A
        jeq     @dt_right_round
        cmp     %BORDER_W-1,A
        jeq     @dt_right_round
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        br      @dt_done
dt_right_round:
        wvdp(%BR_MASK_TOP)
        wvdp(%BR_MASK_TOP)
        wvdp(%BR_MASK_TOP)
dt_done:
        pop     B
        pop     A
        rets

; draw_bottom_border_line: uses cur_y and loop_i
draw_bottom_border_line:
        push    A
        push    B
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        call    @set_line_at
        lda     @loop_i
        cmp     %0,A
        jeq     @db_left_round
        cmp     %BORDER_W-1,A
        jeq     @db_left_round
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        br      @db_left_done
db_left_round:
        wvdp(%BL_MASK_TOP)
        wvdp(%BL_MASK_TOP)
        wvdp(%BL_MASK_TOP)
db_left_done:
        lda     @loop_i
        cmp     %2,A
        jeq     @db_mid_pat
        mov     %BORDER_MID_SEGS,B
db_mid:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,db_mid
        br      @db_right
db_mid_pat:
        mov     %PAT_B,A
        sta     @tmp1
        mov     %BORDER_MID_SEGS,B
db_mid_pat_lp:
        lda     @tmp1
        movp    A,P46
        movp    A,P46
        movp    A,P46
        lda     @tmp1
        xor     %$FF,A
        sta     @tmp1
        djnz    B,db_mid_pat_lp
db_right:
        lda     @loop_i
        cmp     %0,A
        jeq     @db_right_round
        cmp     %BORDER_W-1,A
        jeq     @db_right_round
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        br      @db_done
db_right_round:
        wvdp(%BR_MASK_TOP)
        wvdp(%BR_MASK_TOP)
        wvdp(%BR_MASK_TOP)
db_done:
        pop     B
        pop     A
        rets

; ============================================================================
; PATCHED MOUSE DRIVER — 145 bytes, copied to MOUSE_DRV_ADDR at game start
; Based on EXELTEL ROM $F064 with:
;   - INV/INC (abs value) replaced with TSTA NOPs → signed deltas preserved
;   - CLR TEMP2 replaced with TSTA NOPs → TEMP2 flags preserved
;   - AND %$60,TEMP2 replaced with STA @$C7EC → raw P49 saved for button check
; Still calls ROM delay at $F0F5 (absolute address, works from SRAM).
; ============================================================================
MOUSE_DRV_SIZE  .equ    145
mouse_drv_patched:
        .byte   $A2,$08,$32,$A2,$03,$31,$52,$06
        .byte   $8E,$F0,$F5,$A2,$02,$32,$80,$31
        .byte   $8B,$C7,$EC,$D0,$10,$D4,$10,$23
        .byte   $0F,$BE,$BE,$BE,$BE,$B8,$A2,$08
        .byte   $32,$A2,$02,$31,$52,$01,$8E,$F0
        .byte   $F5,$A2,$02,$32,$80,$31,$C0,$C4
        .byte   $53,$60,$44,$01,$10,$23,$0F,$C9
        .byte   $64,$D0,$0E,$A2,$08,$32,$A2,$03
        .byte   $31,$52,$01,$8E,$F0,$F5,$A2,$02
        .byte   $32,$80,$31,$C0,$C4,$53,$60,$44
        .byte   $01,$10,$23,$0F,$BE,$BE,$BE,$BE
        .byte   $B8,$A2,$08,$32,$A2,$02,$31,$52
        .byte   $01,$8E,$F0,$F5,$A2,$02,$32,$80
        .byte   $31,$C0,$C4,$53,$60,$44,$01,$10
        .byte   $DC,$10,$DC,$10,$DC,$10,$23,$0F
        .byte   $C9,$64,$D0,$0D,$E5,$04,$B0,$B0
        .byte   $B0,$B0,$B0,$B0,$B0,$32,$0E,$E5
        .byte   $04,$B0,$B0,$B0,$B0,$B0,$B0,$B0
        .byte   $0A

small_lpc:
        .byte   $06,$00,$DC,$C3,$01,$40,$46,$38,$00,$E8,$74,$03,$00,$95
        .byte   $66,$00,$A4,$D2,$14,$00,$74,$BA,$02,$80,$CD,$30,$00,$30
        .byte   $11,$0E,$40,$52,$3C,$00,$4A,$B2,$07,$40,$69,$F6,$00,$08
        .byte   $2B,$16,$00,$6E,$C5,$1C,$80,$9D,$9A,$01,$80,$57,$33,$00
        .byte   $70,$66,$06,$00,$CE,$5D,$01,$C0,$85,$2B,$00,$38,$77,$05
        .byte   $00,$67,$AE,$00,$A0,$D5,$0D,$00,$94,$84,$03,$B0,$D6,$70
        .byte   $00,$36,$E6,$0E,$80,$C6,$DC,$00,$C0,$7B,$18,$00,$C4,$08
        .byte   $05,$80,$18,$A1,$00,$E0,$C3,$05,$00,$7C,$98,$00,$80,$0B
        .byte   $77,$00,$96,$E6,$09,$90,$CA,$3C,$01,$44,$5B,$24,$00,$1A
        .byte   $8B,$00,$10,$6B,$11,$00,$E4,$CC,$1D,$00,$BC,$AA,$01,$80
        .byte   $77,$37,$00,$48,$1E,$0A,$80,$C5,$43,$01,$20,$7B,$28,$00
        .byte   $44,$0F,$05,$00,$1F,$6E,$00,$24,$C3,$1D,$20,$94,$BA,$03
        .byte   $84,$D1,$70,$80,$74,$96,$0E,$D0,$D1,$C2,$00,$D2,$9B,$1B
        .byte   $40,$C8,$30,$03,$60,$1D,$2A,$00,$10,$3C,$04,$00,$82,$85
        .byte   $02,$98,$37,$77,$80,$D1,$E6,$05,$B0,$D2,$BD,$01,$4A,$BA
        .byte   $17,$40,$2A,$F3,$02,$50,$63,$5E,$00,$6A,$DD,$0A,$C0,$6C
        .byte   $58,$02,$A8,$09,$4B,$00,$D3,$A9,$09,$E0,$AA,$34,$01,$5C
        .byte   $A5,$26,$80,$CB,$B0,$00,$50,$59,$16,$00,$AA,$D2,$12,$20
        .byte   $94,$69,$02,$B8,$36,$4B,$00,$33,$66,$01,$10,$3A,$34,$00
        .byte   $4C,$A6,$06,$40,$48,$D7,$00,$30,$E5,$1A,$00,$AA,$CA,$1C
        .byte   $40,$55,$9B,$03,$90,$4A,$0F,$00,$95,$EE,$09,$10,$CA,$A2
        .byte   $00,$5C,$B9,$27,$80,$68,$F7,$04,$20,$EB,$1E,$00,$E4,$DC
        .byte   $03,$00,$BD,$59,$00,$80,$37,$73,$00,$F0,$EE,$0E,$00,$21
        .byte   $DC,$00,$20,$56,$18,$00,$F8,$36,$07,$00,$53,$1E,$00,$2A
        .byte   $DD,$12,$C0,$94,$5B,$00,$88,$36,$0B,$00,$B5,$66,$0E,$E0
        .byte   $D6,$DD,$01,$C4,$BA,$1B,$00,$98,$30,$07,$00,$59,$66,$00
        .byte   $A0,$D2,$0C,$00,$4C,$B8,$02,$A0,$0B,$77,$80,$50,$EE,$09
        .byte   $B0,$D2,$3D,$01,$4C,$BA,$27,$80,$68,$F3,$04,$30,$6B,$11
        .byte   $00,$1C,$2C,$1C,$40,$A2,$5B,$00,$B0,$71,$77,$00,$D2,$EE
        .byte   $0E,$80,$26,$C2,$01,$C8,$A6,$1B,$00,$BB,$34,$03,$20,$9F
        .byte   $66,$00,$62,$DD,$1D,$40,$B5,$85,$03,$98,$51,$0F,$80,$B4
        .byte   $EA,$0E,$E0,$CE,$C2,$00,$2C,$44,$1A,$80,$05,$4F,$05,$30
        .byte   $A7,$A9,$00,$EC,$2C,$04,$80,$BC,$BB,$00,$A0,$F3,$70,$80
        .byte   $E6,$61,$09,$30,$22,$BD,$00,$5C,$A5,$27,$80,$1A,$B7,$00
        .byte   $60,$6B,$16,$00,$EC,$D5,$1D,$80,$A2,$B9,$03,$60,$B2,$30
        .byte   $00,$8A,$E6,$06,$20,$DE,$4D,$01,$C8,$99,$2B,$00,$04,$0B
        .byte   $05,$C0,$E0,$69,$00,$66,$3C,$1D,$A0,$B5,$85,$03,$BC,$51
        .byte   $77,$80,$B7,$62,$0E,$50,$56,$DD,$00,$CC,$59,$1A,$40,$98
        .byte   $70,$03,$68,$95,$66,$00,$6E,$42,$15,$C0,$9D,$BA,$02,$B8
        .byte   $B3,$70,$80,$D3,$EE,$05,$70,$CA,$BC,$00,$42,$B9,$15,$80
        .byte   $1B,$F3,$02,$30,$6B,$91,$00,$E2,$DC,$13,$40,$6C,$58,$02
        .byte   $88,$71,$4D,$00,$D3,$A1,$09,$10,$BA,$2C,$01,$42,$A5,$05
        .byte   $80,$A9,$D0,$00,$10,$9D,$1E,$00,$AA,$D2,$03,$C0,$55,$58
        .byte   $02,$98,$76,$0D,$00,$D3,$A1,$01,$20,$BA,$2C,$00,$44,$97
        .byte   $07,$80,$A9,$F0,$00,$50,$E5,$1E,$00,$A6,$D2,$1C,$C0,$65
        .byte   $AA,$03,$A8,$08,$73,$00,$93,$EE,$09,$50,$DA,$AD,$00,$5C
        .byte   $99,$27,$00,$6A,$F7,$04,$00,$E7,$1E,$00,$10,$22,$02,$00
        .byte   $42,$86,$03,$80,$CF,$70,$00,$F0,$19,$06,$00,$B6,$DC,$00
        .byte   $40,$97,$19,$00,$D8,$74,$03,$00,$9B,$1E,$00,$AC,$DD,$12
        .byte   $C0,$95,$6B,$00,$A4,$76,$09,$00,$D3,$A6,$0E,$60,$DA,$C2
        .byte   $01,$D0,$46,$38,$00,$D8,$34,$07,$20,$99,$66,$00,$A8,$C2
        .byte   $0D,$00,$74,$B8,$02,$A0,$0A,$73,$00,$53,$EE,$09,$D0,$2A
        .byte   $22,$01,$4C,$79,$24,$00,$18,$8B,$00,$00,$6B,$11,$00,$E0
        .byte   $DC,$1D,$00,$9C,$59,$00,$A0,$09,$0D,$00,$D6,$61,$0E,$00
        .byte   $26,$C2,$00,$C0,$66,$18,$00,$B8,$70,$03,$00,$17,$66,$00
        .byte   $AC,$DD,$1C,$80,$95,$99,$03,$B0,$31,$77,$00,$73,$E6,$0E
        .byte   $C0,$4E,$DD,$00,$C0,$99,$2B,$00,$38,$73,$05,$00,$1F,$21
        .byte   $00,$E0,$23,$04,$00,$9C,$BB,$00,$80,$F3,$70,$80,$16,$6E
        .byte   $05,$B0,$22,$AC,$00,$4C,$BA,$27,$00,$1A,$F7,$04,$00,$67
        .byte   $1E,$00,$E0,$2D,$1C,$00,$92,$87,$03,$40,$09,$37,$00,$28
        .byte   $EE,$06,$00,$C9,$5D,$01,$20,$79,$28,$00,$E4,$48,$03,$00
        .byte   $1B,$91,$00,$A9,$C2,$13,$40,$75,$44,$02,$80,$75,$0F,$00
        .byte   $F0,$E6,$01,$00,$D1,$C2,$01,$20,$BA,$3B,$00,$58,$77,$03
        .byte   $00,$97,$6E,$00,$10,$C2,$15,$00,$82,$B9,$01,$80,$B7,$70
        .byte   $00,$33,$E6,$05,$10,$CA,$BD,$00,$4C,$B9,$17,$80,$19,$F7
        .byte   $02,$70,$63,$56,$00,$62,$5C,$0B,$80,$74,$68,$02,$90,$0E
        .byte   $4F,$00,$D6,$E1,$09,$E0,$2A,$35,$01,$52,$94,$26,$40,$8A
        .byte   $B0,$00,$70,$11,$11,$00,$2E,$22,$02,$A0,$A5,$5B,$02,$84
        .byte   $0C,$4D,$00,$17,$A1,$01,$E0,$3C,$2C,$00,$8C,$A5,$05,$40
        .byte   $89,$D0,$00,$70,$19,$1A,$00,$24,$D2,$03,$00,$44,$45,$00
        .byte   $80,$A8,$08,$00,$12,$E1,$09,$E0,$D2,$BD,$00,$4C,$9B,$27
        .byte   $00,$58,$F3,$04,$00,$17,$1E,$00,$E8,$32,$02,$80,$6C,$B9
        .byte   $03,$80,$2E,$73,$00,$D0,$E9,$0E,$80,$BA,$C2,$01,$48,$55
        .byte   $38,$00,$89,$74,$07,$40,$99,$16,$00,$A6,$DC,$12,$20,$94
        .byte   $5B,$00,$84,$76,$0B,$80,$34,$EE,$01,$90,$36,$CC,$01,$44
        .byte   $87,$39,$00,$A8,$54,$07,$40,$99,$EA,$00,$2C,$42,$0D,$80
        .byte   $55,$B8,$03,$B8,$0E,$77,$80,$56,$E6,$09,$B0,$D2,$AD,$00
        .byte   $5C,$9A,$27,$80,$69,$F5,$04,$08,$A3,$16,$00,$6E,$D5,$03
        .byte   $C0,$AC,$79,$00,$A8,$36,$0F,$00,$D6,$EE,$01,$A0,$3A,$DC
        .byte   $01,$5C,$BB,$3B,$40,$A8,$70,$07,$08,$95,$EE,$00,$A5,$DD
        .byte   $1D,$C0,$95,$79,$00,$B8,$72,$0F,$80,$D4,$E6,$01,$D0,$DA
        .byte   $C2,$01,$CA,$BA,$3B,$40,$BA,$70,$07,$18,$E3,$EE,$00,$6B
        .byte   $DC,$1D,$E0,$4D,$B8,$03,$BC,$76,$0D,$80,$57,$AE,$05,$70
        .byte   $D2,$AD,$00,$4A,$9A,$15,$80,$2B,$F3,$04,$70,$63,$9E,$00
        .byte   $6E,$CC,$12,$C0,$AD,$6B,$00,$98,$71,$09,$00,$B7,$6E,$01
        .byte   $50,$2E,$3C,$00,$DE,$85,$07,$C0,$1A,$F7,$04,$58,$13,$56
        .byte   $00,$A7,$C3,$0A,$C0,$95,$5B,$02,$88,$36,$4F,$00,$33,$E6
        .byte   $09,$90,$CE,$2C,$01,$C2,$98,$26,$80,$6B,$B7,$04,$08,$13
        .byte   $96,$00,$6F,$C3,$02,$E0,$8D,$5B,$00,$9C,$09,$4B,$40,$D0
        .byte   $66,$05,$70,$CA,$BD,$01,$52,$9B,$17,$40,$18,$F3,$02,$70
        .byte   $6B,$5E,$00,$E6,$DC,$0A,$C0,$AD,$5B,$02,$A8,$31,$4D,$00
        .byte   $D5,$A6,$09,$10,$2A,$2C,$01,$5A,$A7,$25,$40,$6B,$D7,$00
        .byte   $70,$ED,$96,$00,$AE,$DD,$12,$20,$B4,$59,$02,$98,$0E,$0F
        .byte   $00,$33,$69,$01,$10,$3A,$2D,$00,$5C,$A5,$05,$40,$C8,$D0
        .byte   $00,$50,$19,$16,$00,$AC,$D2,$02,$00,$75,$68,$00,$80,$76
        .byte   $0F,$00,$52,$E1,$09,$E0,$DA,$A3,$00,$5C,$9B,$27,$00,$5A
        .byte   $F3,$04,$00,$EF,$1E,$00,$E0,$C3,$03,$00,$5C,$9A,$03,$80
        .byte   $0D,$73,$00,$70,$E1,$0E,$80,$3E,$DD,$01,$D8,$A6,$19,$00
        .byte   $E8,$34,$07,$00,$9D,$16,$00,$A6,$DC,$02,$C0,$B5,$59,$00
        .byte   $84,$36,$0F,$80,$D4,$E6,$0E,$10,$D6,$CD,$01,$D8,$BA,$39
        .byte   $00,$D8,$70,$07,$40,$93,$6E,$00,$68,$D2,$0D,$00,$5D,$B8
        .byte   $01,$B0,$73,$77,$00,$57,$E6,$09,$B0,$D2,$2C,$01,$5C,$9A
        .byte   $27,$80,$6A,$F3,$04,$30,$A3,$16,$00,$E2,$CD,$03,$80,$83
        .byte   $7B,$00,$A8,$75,$0F,$00,$D1,$EE,$0E,$00,$C6,$C3,$01,$C8
        .byte   $46,$18,$00,$9B,$70,$03,$20,$93,$66,$00,$6A,$DC,$0D,$40
        .byte   $95,$BA,$03,$A8,$D2,$70,$00,$D7,$1E,$0E,$10,$C6,$C3,$00
        .byte   $C2,$7B,$18,$80,$07,$0B,$05,$50,$EF,$A1,$00,$E2,$3D,$14
        .byte   $C0,$BD,$BB,$02,$B8,$D7,$70,$80,$56,$66,$09,$50,$D2,$BD
        .byte   $00,$54,$BB,$27,$00,$1A,$F3,$04,$00,$67,$11,$00,$18,$3C
        .byte   $1C,$00,$BD,$99,$03,$80,$33,$77,$00,$08,$16,$06,$80,$C1
        .byte   $C2,$00,$C8,$6B,$18,$00,$04,$0B,$03,$40,$AF,$6E,$00,$E6
        .byte   $CC,$18,$C0,$AD

; ============================================================================
; ============================================================================
; LEVEL EDITOR  (v3)
; ============================================================================
; Keys: I/K=up/dn  J/L=left/right  N=next level  S=save  Q=quit
;       Bricks: R O G B D Y A U E W  digits 1-4  .=erase  SPC=erase
; ed_quit_ask: 0=normal  1=confirm pending  2=exit now (signals ed_loop)
; ============================================================================

; ============================================================================
; LEVEL_EDITOR  (entry via sdm_key_edit / show_difficulty_menu)
; ============================================================================
level_editor:
        push    A
        push    B
        ; Preserve edits if ed_saved=1; only reload from ROM when entering fresh.
        lda     @ed_saved
        jnz     @led_has_data
        clr     A
        sta     @ed_level
        sta     @ed_cursor_row
        sta     @ed_cursor_col
        sta     @ed_quit_ask
        sta     @ed_blink_state
        mov     %ED_BLINK_RATE,A
        sta     @ed_blink
        mov     %1,A
        sta     @ed_key_tmr
        call    @ed_load_all_from_rom
        jmp     @led_draw
led_has_data:
        clr     A
        sta     @ed_quit_ask
        sta     @ed_blink_state
        mov     %ED_BLINK_RATE,A
        sta     @ed_blink
        mov     %1,A
        sta     @ed_key_tmr
        ; If level0 bricks were partially destroyed during gameplay, restore ROM data.
        lda     @ed_l0_dirty
        jz      @led_draw
        push    A
        push    B
        clr     A
        sta     @current_level
        call    @ed_rom_fill_bricks
        sta     @ed_l0_dirty        ; A=0: clear dirty
        pop     B
        pop     A
led_draw:
        call    @ed_draw_screen

; ─── main loop: call edlp_frame each tick, check quit flag ───────────────────
ed_loop:
        call    @edlp_frame         ; 16-bit absolute, no range limit
        lda     @ed_quit_ask
        cmp     %2,A                ; 2 = quit confirmed
        jne     @ed_loop            ; backward ~8 bytes: SAFE
        clr     A
        sta     @ed_quit_ask
        pop     B
        pop     A
        rets

; ============================================================================
; EDLP_FRAME  one editor frame; rets back to ed_loop
; ============================================================================
edlp_frame:
        call    @frame_delay
        lda     @key_cur
        sta     @key_last
        mov     VALUE0,A
        ; Normalize no-key codes to $00
        cmp     %KEY_NO_KEY_EXL,A
        jeq     @edlp_nokey
        cmp     %KEY_NO_KEY_EXT,A
        jeq     @edlp_nokey
        cmp     %$04,A
        jne     @edlp_storekey
edlp_nokey:
        clr     A
edlp_storekey:
        sta     @key_cur

        ; Confirm-quit pending? jz skips confirm (forward ~33B), falls thru if pending
        lda     @ed_quit_ask
        jz      @edlp_dispatch      ; ed_quit_ask==0: normal dispatch (forward ~33B)
        ; ed_quit_ask!=0: confirm handler (fallthrough, ~0 bytes away)
; ── confirm handler (placed before dispatch; jz above skips over it) ─────────
edlp_confirm_check:
        lda     @key_cur
        cmp     %KEY_ED_YES_U,A
        jeq     @edlp_cfm_yes
        cmp     %KEY_ED_YES_L,A
        jeq     @edlp_cfm_yes
        ; not Y: check for new key press (cancel confirm)
        lda     @key_last
        jz      @edlp_cfm_rets      ; no key last frame: wait
        lda     @key_cur
        jz      @edlp_cfm_rets      ; no key this frame: wait
        ; is it the same held key?
        push    A                   ; save key_cur
        lda     @key_last
        mov     A,B                 ; B = key_last
        pop     A                   ; A = key_cur
        cmp     B,A                 ; EQ if same key held
        jeq     @edlp_cfm_rets
        ; new key: cancel
        clr     A
        sta     @ed_quit_ask
        call    @ed_clear_quit_msg
edlp_cfm_rets:
        rets
edlp_cfm_yes:
        call    @edlp_quit_confirmed
        rets

; ── dispatch (after confirm handler; jz @edlp_dispatch from preamble lands here) ─
edlp_dispatch:
        lda     @key_cur
        ; --- Arrow keys first (no case issue) ---
        cmp     %KEY_ARROW_UP,A
        jeq     @edlp_tr_move
        cmp     %KEY_ARROW_DN,A
        jeq     @edlp_tr_move
        cmp     %KEY_ARROW_LF,A
        jeq     @edlp_tr_move
        cmp     %KEY_ARROW_RT,A
        jeq     @edlp_tr_move
        ; --- Non-alpha specials (exact match) ---
        cmp     %KEY_ED_CLR,A
        jeq     @edlp_tr_clear
        cmp     %KEY_SPACE,A
        jeq     @edlp_tr_clear
        ; --- Uppercase all letters once ---
        and     %$DF,A
        ; --- Letter commands ---
        cmp     %KEY_ED_QUI_U,A
        jeq     @edlp_tr_quit
        cmp     %KEY_ED_SAV_U,A
        jeq     @edlp_tr_save
        cmp     %KEY_ED_NXT_U,A
        jeq     @edlp_tr_next
        ; --- Cursor movement letters ---
        cmp     %KEY_ED_UP_U,A      ; I
        jeq     @edlp_tr_move
        cmp     %KEY_ED_DN_U,A      ; K
        jeq     @edlp_tr_move
        cmp     %KEY_ED_LF_U,A      ; J
        jeq     @edlp_tr_move
        cmp     %KEY_ED_RT_U,A      ; L
        jeq     @edlp_tr_move
        cmp     %$5A,A              ; Z = up
        jeq     @edlp_tr_move
        cmp     %$58,A              ; X = down
        jeq     @edlp_tr_move
        cmp     %$43,A              ; C = left
        jeq     @edlp_tr_move
        cmp     %$56,A              ; V = right
        jeq     @edlp_tr_move
        ; --- Brick color keys (also yes-confirm Y is handled by ed_key_to_color not here) ---
        call    @ed_key_to_color
        jnz     @edlp_tr_place
        ; Idle: blink cursor
        mov     %1,A
        sta     @ed_key_tmr
        call    @ed_blink_cursor
        rets


edlp_tr_quit:
        call    @edlp_quit
        rets
edlp_tr_save:
        call    @edlp_save
        rets
edlp_tr_next:
        call    @edlp_next
        rets
edlp_tr_move:
        call    @edlp_move
        rets
edlp_tr_clear:
        call    @edlp_clear
        rets
edlp_tr_place:
        call    @edlp_place
        rets

; ============================================================================
; HANDLERS (each rets back through trampolines to edlp_frame, then ed_loop)
; ============================================================================

; ── Quit confirmed: set flag, ed_loop will exit ───────────────────────────────
edlp_quit_confirmed:
        mov     %2,A
        sta     @ed_quit_ask
        rets

; ── Quit handler ─────────────────────────────────────────────────────────────
edlp_quit:
        lda     @key_last
        and     %$DF,A
        cmp     %KEY_ED_QUI_U,A
        jne     @edlp_quit_do
        rets                        ; held: ignore
edlp_quit_do:
        lda     @ed_saved
        jnz     @edlp_quit_confirmed
        mov     %1,A
        sta     @ed_quit_ask
        call    @ed_draw_quit_confirm
        rets

; ── Save handler ─────────────────────────────────────────────────────────────
edlp_save:
        lda     @key_last
        and     %$DF,A
        cmp     %KEY_ED_SAV_U,A
        jne     @edlp_save_do
        rets
edlp_save_do:
        mov     %1,A
        sta     @ed_saved
        clr     A
        sta     @ed_l0_dirty
        call    @ed_draw_saved_flash
        rets

; ── Next-level handler ────────────────────────────────────────────────────────
edlp_next:
        lda     @key_last
        and     %$DF,A
        cmp     %KEY_ED_NXT_U,A
        jne     @edlp_next_do
        rets
edlp_next_do:
        call    @ed_hide_cursor
        lda     @ed_level
        inc     A
        cmp     %ED_NUM_LEVELS,A
        jl      @edlp_nxt_set
        clr     A
edlp_nxt_set:
        sta     @ed_level
        lda     @ed_level
        call    @ed_get_rows
        sta     @tmp1
        lda     @ed_cursor_row
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jl      @edlp_nxt_ok
        lda     @tmp1
        dec     A
        sta     @ed_cursor_row
edlp_nxt_ok:
        call    @ed_draw_screen
        rets

; ── Movement handler (auto-repeat) ────────────────────────────────────────────
edlp_move:
        lda     @key_cur
        and     %$DF,A
        sta     @ed_tmp_col         ; save masked key to SAFE location (tmp3 clobbered by draw_one_brick)
        lda     @key_last
        and     %$DF,A
        ; compare upper(key_last) with upper(key_cur)
        push    A                   ; save upper(key_last)
        lda     @ed_tmp_col         ; A = upper(key_cur)
        mov     A,B                 ; B = upper(key_cur)
        pop     A                   ; A = upper(key_last)
        cmp     B,A                 ; EQ if same key held
        jne     @edlp_mv_new
        ; same key: auto-repeat rate limit
        lda     @ed_key_tmr
        dec     A
        sta     @ed_key_tmr
        jz      @edlp_mv_tick
        rets
edlp_mv_tick:
        mov     %ED_KEY_RATE,A
        sta     @ed_key_tmr
        jmp     @edlp_mv_do
edlp_mv_new:
        mov     %ED_KEY_FIRST,A     ; longer delay before first auto-repeat
        sta     @ed_key_tmr
edlp_mv_do:
        call    @ed_hide_cursor
        lda     @ed_tmp_col         ; read key (tmp3 was clobbered by draw_one_brick)
        cmp     %KEY_ED_UP_U,A      ; 'I'
        jeq     @edlp_up
        cmp     %KEY_ARROW_UP,A     ; arrow up ($80, unchanged by and $DF)
        jeq     @edlp_up
        cmp     %KEY_ED_DN_U,A      ; 'K'
        jeq     @edlp_dn
        cmp     %KEY_ARROW_DN,A     ; arrow down ($82)
        jeq     @edlp_dn
        cmp     %KEY_ED_LF_U,A      ; 'J'
        jeq     @edlp_lf
        cmp     %KEY_ARROW_LF,A     ; arrow left ($83)
        jeq     @edlp_lf
        cmp     %$5A,A              ; 'Z' = up
        jeq     @edlp_up
        cmp     %$58,A              ; 'X' = down
        jeq     @edlp_dn
        cmp     %$43,A              ; 'C' = left
        jeq     @edlp_lf
        ; else: 'L', arrow right ($81), or 'V' = right
        jmp     @edlp_rt

edlp_up:
        lda     @ed_cursor_row
        jz      @edlp_up_wrap
        dec     A
        jmp     @edlp_up_set
edlp_up_wrap:
        mov     %ED_MAX_ROWS_M1,A   ; wrap: row 0 → row 17
edlp_up_set:
        sta     @ed_cursor_row
        call    @ed_show_cursor
        rets

edlp_dn:
        lda     @ed_cursor_row
        inc     A
        cmp     %ED_MAX_ROWS,A      ; wrap at 18 rows
        jl      @edlp_dn_set
        clr     A
edlp_dn_set:
        sta     @ed_cursor_row
        call    @ed_show_cursor
        rets

edlp_lf:
        lda     @ed_cursor_col
        jz      @edlp_lf_wrap
        dec     A
        jmp     @edlp_lf_set
edlp_lf_wrap:
        mov     %12,A               ; ED_COLS-1
edlp_lf_set:
        sta     @ed_cursor_col
        call    @ed_show_cursor
        rets

edlp_rt:
        lda     @ed_cursor_col
        inc     A
        cmp     %ED_COLS,A
        jl      @edlp_rt_set
        clr     A
edlp_rt_set:
        sta     @ed_cursor_col
        call    @ed_show_cursor
        rets

; ── Clear handler ─────────────────────────────────────────────────────────────
edlp_clear:
        lda     @key_cur
        and     %$DF,A
        sta     @tmp3
        lda     @key_last
        and     %$DF,A
        push    A
        lda     @tmp3
        mov     A,B
        pop     A
        cmp     B,A
        jeq     @edlp_held_rets     ; held: skip
        clr     A
        call    @ed_cell_write
        ; ed_saved intentionally NOT cleared: keep save state across edits
        call    @ed_draw_cell
        call    @ed_show_cursor
        rets

; ── Place handler (A = color from ed_key_to_color, preserved through call) ───
edlp_place:
        sta     @tmp3               ; save color
        lda     @key_cur
        and     %$DF,A
        sta     @tmp2
        lda     @key_last
        and     %$DF,A
        push    A
        lda     @tmp2
        mov     A,B
        pop     A
        cmp     B,A
        jeq     @edlp_held_rets     ; held: skip
        ; Expand ed_rowsX if placing beyond current row count
        lda     @ed_level
        call    @ed_get_rows        ; A = current row count for this level
        mov     A,B                 ; B = current rows
        lda     @ed_cursor_row
        inc     A                   ; cursor_row+1 = rows needed
        cmp     R0,R1               ; B-A = current_rows-(cursor_row+1); jhs = B>=A = no expand needed
        jhs     @edlp_pl_rows_ok
        ; cursor_row+1 > current rows: update ed_rowsX
        push    A                   ; save new row count (cursor_row+1)
        lda     @ed_level
        jnz     @edlp_pl_r2
        pop     A
        sta     @ed_rows0
        jmp     @edlp_pl_rows_ok
edlp_pl_r2:
        cmp     %2,A
        jhs     @edlp_pl_r3
        pop     A
        sta     @ed_rows1
        jmp     @edlp_pl_rows_ok
edlp_pl_r3:
        pop     A
        sta     @ed_rows2
edlp_pl_rows_ok:
        lda     @tmp3
        call    @ed_cell_write
        ; ed_saved intentionally NOT cleared: keep save state across edits
        call    @ed_draw_cell
        call    @ed_show_cursor
        rets

edlp_held_rets:
        rets

; ============================================================================
; ED_LOAD_ALL_FROM_ROM
; ============================================================================
; ============================================================================
; ED_ROM_FILL_BRICKS  Fill bricks[] from ROM level data WITHOUT touching power_map.
; In:  current_level set to 0/1/2
; Out: bricks[0..rows*13-1] = color values; power_map UNTOUCHED
; Used only by ed_load_all_from_rom; game uses init_bricks instead.
; ============================================================================
ed_rom_fill_bricks:
        push    A
        push    B
        lda     @current_level
        jnz     @erfb_chk_l2
        mov     %LEVEL1_ROWS,A
        sta     @current_brick_rows
        movd    %level1_data,TEMP1
        jmp     @erfb_got_ptr
erfb_chk_l2:
        cmp     %2,A
        jhs     @erfb_chk_l3
        mov     %LEVEL2_ROWS,A
        sta     @current_brick_rows
        movd    %level2_data,TEMP1
        jmp     @erfb_got_ptr
erfb_chk_l3:
        cmp     %3,A
        jhs     @erfb_chk_l4
        mov     %LEVEL3_ROWS,A
        sta     @current_brick_rows
        movd    %level3_data,TEMP1
        jmp     @erfb_got_ptr
erfb_chk_l4:
        cmp     %4,A
        jhs     @erfb_l5
        mov     %LEVEL4_ROWS,A
        sta     @current_brick_rows
        movd    %level4_data,TEMP1
        jmp     @erfb_got_ptr
erfb_l5:
        mov     %LEVEL5_ROWS,A
        sta     @current_brick_rows
        movd    %level5_data,TEMP1
erfb_got_ptr:
        mov     TEMP1-1,A
        sta     @tmp_lev_hi
        mov     TEMP1,A
        sta     @tmp_lev_lo
erfb_cont:
        ; clear bricks[] ONLY (not power_map=ed_grid1)
        clr     A
        mov     A,B
erfb_clr:
        sta     @bricks(B)
        inc     B
        cmp     %BRICK_TOTAL_MAX,B
        jl      @erfb_clr
        ; decode ROM chars into bricks[]; power bricks stored as BRICK_COLOR_POWER
        clr     A
        sta     @loop_i
        lda     @current_brick_rows
        mpy     %BRICK_COLS,A
        mov     B,A
        sta     @tmp1               ; total cells
erfb_dec:
        lda     @tmp_lev_hi
        mov     A,TEMP1-1
        lda     @tmp_lev_lo
        mov     A,TEMP1
        lda     *TEMP1
        sta     @tmp3               ; char
        add     %1,TEMP1
        adc     %0,TEMP1-1
        mov     TEMP1-1,A
        sta     @tmp_lev_hi
        mov     TEMP1,A
        sta     @tmp_lev_lo
        lda     @loop_i
        mov     A,B
        lda     @tmp3               ; char to classify (bricks only, no power_map write)
        call    @erfb_classify
erfb_nxt:
        lda     @loop_i
        inc     A
        sta     @loop_i
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jhs     @erfb_done
        jmp     @erfb_dec
erfb_done:
        pop     B
        pop     A
        rets

; erfb_classify: like ib_classify but writes ONLY to bricks(B), never power_map
erfb_classify:
        cmp     %$2E,A
        jne     @erfb_cls_nz
        clr     A
        sta     @bricks(B)
        rets
erfb_cls_nz:
        ; digits 1-4 = power bricks
        cmp     %$31,A
        jl      @erfb_cls_letter
        cmp     %$35,A
        jhs     @erfb_cls_letter
        mov     %BRICK_COLOR_POWER,A
        sta     @bricks(B)
        rets
erfb_cls_letter:
        lda     @tmp3
        cmp     %$52,A
        jne     @erfb_c2
        mov     %1,A
        jmp     @erfb_store
erfb_c2:
        cmp     %$4D,A              ; 'M' Magenta
        jne     @erfb_c3
        mov     %2,A
        jmp     @erfb_store
erfb_c3:
        cmp     %$47,A
        jne     @erfb_c4
        mov     %3,A
        jmp     @erfb_store
erfb_c4:
        cmp     %$42,A
        jne     @erfb_c5
        mov     %4,A
        jmp     @erfb_store
erfb_c5:
        cmp     %$57,A
        jne     @erfb_c6
        mov     %5,A
        jmp     @erfb_store
erfb_c6:
        cmp     %$44,A
        jne     @erfb_c7
        mov     %6,A
        jmp     @erfb_store
erfb_c7:
        cmp     %$59,A
        jne     @erfb_c8
        mov     %7,A
        jmp     @erfb_store
erfb_c8:
        cmp     %$41,A
        jne     @erfb_c9
        mov     %BRICK_COLOR_ARMOR,A
        jmp     @erfb_store
erfb_c9:
        cmp     %$55,A
        jne     @erfb_c10
        mov     %BRICK_COLOR_INDES,A
        jmp     @erfb_store
erfb_c10:
        cmp     %$45,A
        jne     @erfb_cfb
        mov     %BRICK_COLOR_EXPLO,A
        jmp     @erfb_store
erfb_cfb:
        mov     %5,A                ; fallback white
erfb_store:
        sta     @bricks(B)
        rets

; ============================================================================
; ED_LOAD_ALL_FROM_ROM  Fill all 3 editor grids from ROM level data.
; Uses ed_rom_fill_bricks (NOT init_bricks) so power_map/ed_grid1 is never clobbered.
; ============================================================================
ed_load_all_from_rom:
        push    A
        push    B
        lda     @current_level
        sta     @tmp3
        clr     A
        sta     @ed_saved

        ; Level 0: ed_rom_fill_bricks fills bricks[]=ed_grid0. No copy needed.
        sta     @current_level
        call    @ed_rom_fill_bricks
        mov     %LEVEL1_ROWS,A
        sta     @ed_rows0

        ; Level 1: fill bricks[] with level2 colors, copy to ed_grid1.
        mov     %1,A
        sta     @current_level
        call    @ed_rom_fill_bricks
        mov     %LEVEL2_ROWS,A
        sta     @ed_rows1
        call    @ed_copy_to_grid1

        ; Level 2: fill bricks[] with level3 colors, copy to ed_grid2.
        mov     %2,A
        sta     @current_level
        call    @ed_rom_fill_bricks
        mov     %LEVEL3_ROWS,A
        sta     @ed_rows2
        call    @ed_copy_to_grid2

        ; Fill bricks[]=ed_grid0 with level1 data so editor opens on level 1.
        clr     A
        sta     @current_level
        call    @ed_rom_fill_bricks

        lda     @tmp3
        sta     @current_level
        pop     B
        pop     A
        rets

; ============================================================================
; ED_COPY_TO_GRID0/1/2  copies bricks[]→ed_grid0/1/2 (all now separate addresses)
; ============================================================================
ed_copy_to_grid0:
        push    A
        push    B
        lda     @ed_rows0
        mpy     %ED_COLS,A
        mov     B,A
        sta     @tmp1
        clr     B
ectg0_cp:
        lda     @tmp1
        cmp     R0,R1
        jl      @ectg0_do
        jmp     @ectg0_zr
ectg0_do:
        lda     @bricks(B)
        sta     @ed_grid0(B)
        inc     B
        jmp     @ectg0_cp
ectg0_zr:
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jhs     @ectg0_done
ectg0_zrl:
        mov     A,B
        clr     A
        sta     @ed_grid0(B)
        inc     B
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jl      @ectg0_zrl
ectg0_done:
        pop     B
        pop     A
        rets

ed_copy_to_grid1:
        push    A
        push    B
        lda     @ed_rows1
        mpy     %ED_COLS,A
        mov     B,A
        sta     @tmp1
        clr     B
ectg1_cp:
        lda     @tmp1
        cmp     R0,R1
        jl      @ectg1_do
        jmp     @ectg1_zr
ectg1_do:
        lda     @bricks(B)
        sta     @ed_grid1(B)
        inc     B
        jmp     @ectg1_cp
ectg1_zr:
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jhs     @ectg1_done
ectg1_zrl:
        mov     A,B
        clr     A
        sta     @ed_grid1(B)
        inc     B
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jl      @ectg1_zrl
ectg1_done:
        pop     B
        pop     A
        rets

ed_copy_to_grid2:
        push    A
        push    B
        lda     @ed_rows2
        mpy     %ED_COLS,A
        mov     B,A
        sta     @tmp1
        clr     B
ectg2_cp:
        lda     @tmp1
        cmp     R0,R1
        jl      @ectg2_do
        jmp     @ectg2_zr
ectg2_do:
        lda     @bricks(B)
        sta     @ed_grid2(B)
        inc     B
        jmp     @ectg2_cp
ectg2_zr:
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jhs     @ectg2_done
ectg2_zrl:
        mov     A,B
        clr     A
        sta     @ed_grid2(B)
        inc     B
        mov     B,A
        cmp     %ED_GRID_SIZE,A
        jl      @ectg2_zrl
ectg2_done:
        pop     B
        pop     A
        rets

; ============================================================================
; ED_GET_ROWS  In:A=level(0-2)  Out:A=row count
; ============================================================================
ed_get_rows:
        push    B
        jnz     @egr_l2
        lda     @ed_rows0
        pop     B
        rets
egr_l2:
        cmp     %2,A
        jhs     @egr_l3
        lda     @ed_rows1
        pop     B
        rets
egr_l3:
        lda     @ed_rows2
        pop     B
        rets

; ============================================================================
; ED_CELL_INDEX  Out:B = cursor_row*ED_COLS + cursor_col
; ============================================================================
ed_cell_index:
        push    A
        lda     @ed_cursor_row
        mpy     %ED_COLS,A
        lda     @ed_cursor_col
        add     R0,R1
        pop     A
        rets

; ============================================================================
; ED_CELL_READ  Out:A = color at cursor (0=empty)
; ============================================================================
ed_cell_read:
        push    B
        call    @ed_cell_index      ; B = grid index
        lda     @ed_level
        jnz     @ecr_l2
        lda     @ed_grid0(B)
        pop     B
        rets
ecr_l2:
        cmp     %2,A
        jhs     @ecr_l3
        lda     @ed_grid1(B)
        pop     B
        rets
ecr_l3:
        lda     @ed_grid2(B)
        pop     B
        rets

; ============================================================================
; ED_CELL_WRITE  In:A = color
; ============================================================================
ed_cell_write:
        push    A
        push    B
        sta     @tmp3
        call    @ed_cell_index
        lda     @ed_level
        jnz     @ecw_l2
        lda     @tmp3
        sta     @ed_grid0(B)
        pop     B
        pop     A
        rets
ecw_l2:
        cmp     %2,A
        jhs     @ecw_l3
        lda     @tmp3
        sta     @ed_grid1(B)
        pop     B
        pop     A
        rets
ecw_l3:
        lda     @tmp3
        sta     @ed_grid2(B)
        pop     B
        pop     A
        rets

; ============================================================================
; ED_KEY_TO_COLOR  Out:A = internal color (0 = not a brick key)
; ============================================================================
ed_key_to_color:
        lda     @key_cur
        and     %$DF,A
        cmp     %$31,A
        jl      @ekkc_let
        cmp     %$35,A
        jhs     @ekkc_let
        mov     %BRICK_COLOR_POWER,A
        rets
ekkc_let:
        cmp     %$52,A
        jeq     @ekkc_r
        cmp     %$4D,A              ; 'M' Magenta
        jeq     @ekkc_m
        cmp     %$47,A
        jeq     @ekkc_g
        cmp     %$42,A
        jeq     @ekkc_b
        cmp     %$57,A
        jeq     @ekkc_w
        cmp     %$44,A
        jeq     @ekkc_d
        cmp     %$59,A
        jeq     @ekkc_y
        cmp     %$41,A
        jeq     @ekkc_a
        cmp     %$55,A
        jeq     @ekkc_u
        cmp     %$45,A
        jeq     @ekkc_e
        clr     A
        rets
ekkc_r:
        mov     %1,A
        rets
ekkc_m:
        mov     %2,A
        rets
ekkc_g:
        mov     %3,A
        rets
ekkc_b:
        mov     %4,A
        rets
ekkc_w:
        mov     %5,A
        rets
ekkc_d:
        mov     %6,A
        rets
ekkc_y:
        mov     %7,A
        rets
ekkc_a:
        mov     %BRICK_COLOR_ARMOR,A
        rets
ekkc_u:
        mov     %BRICK_COLOR_INDES,A
        rets
ekkc_e:
        mov     %BRICK_COLOR_EXPLO,A
        rets

; ============================================================================
; ED_DRAW_CELL
; ============================================================================
ed_draw_cell:
        push    A
        push    B
        lda     @ed_cursor_row
        sta     @tmp1
        lda     @ed_cursor_col
        sta     @tmp2
        call    @ed_cell_read       ; A = color; but pop B inside clears Z flag!
        xor     %0,A                ; re-test A: Z=1 iff A=0 (empty cell); XOR 0 preserves value
        jz      @edc_erase
        call    @draw_one_brick
        pop     B
        pop     A
        rets
edc_erase:
        call    @ed_erase_cell
        pop     B
        pop     A
        rets

; ============================================================================
; ED_ERASE_CELL
; ============================================================================
ed_erase_cell:
        push    A
        push    B
        lda     @tmp1
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @cur_y
        lda     @tmp2
        clrc
        rl      A
        add     %GAME_X_SEG,A
        sta     @ed_tmp_row         ; segment address in ed-private SRAM
        mov     %BRICK_H,A          ; counter in A; pushed around set_line_at (TEMP1 clobbered by it)
eecel_lp:
        push    A                   ; save row counter
        lda     @ed_tmp_row
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at        ; clobbers TEMP1 — counter is on stack
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        wvdp(%$00)
        lda     @cur_y
        inc     A
        sta     @cur_y
        pop     A                   ; restore row counter
        dec     A
        jnz     @eecel_lp
        pop     B
        pop     A
        rets

; ============================================================================
; ED_SHOW_CURSOR
; ============================================================================
ed_show_cursor:
        push    A
        push    B
        call    @ed_draw_cell       ; may call ed_erase_cell which uses ed_tmp_row
        ; compute segment AFTER ed_draw_cell (ed_erase_cell clobbers ed_tmp_row)
        lda     @ed_cursor_col
        clrc
        rl      A
        add     %GAME_X_SEG,A
        sta     @ed_tmp_row         ; safe SRAM for segment (tmp3 is clobbered by draw_one_brick)
        ; compute start y
        lda     @ed_cursor_row
        mpy     %BRICK_PITCH,A
        mov     B,A
        add     %BRICK_START_Y,A
        sta     @cur_y
        ; draw BRICK_H rows of white cursor overlay (bright white = $FF for all B,G,R planes)
        mov     %BRICK_H,A          ; counter in A; pushed around set_line_at
esc_row:
        push    A                   ; save row counter (TEMP1 clobbered by set_line_at)
        lda     @ed_tmp_row
        mov     A,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        lda     @cur_y
        inc     A
        sta     @cur_y
        pop     A                   ; restore row counter
        dec     A
        jnz     @esc_row
        mov     %1,A
        sta     @ed_blink_state
        pop     B
        pop     A
        rets

; ============================================================================
; ED_HIDE_CURSOR
; ============================================================================
ed_hide_cursor:
        push    A
        push    B
        clr     A
        sta     @ed_blink_state
        call    @ed_draw_cell
        pop     B
        pop     A
        rets

; ============================================================================
; ED_BLINK_CURSOR
; ============================================================================
ed_blink_cursor:
        push    A
        lda     @ed_blink
        dec     A
        sta     @ed_blink
        jnz     @ebc_done
        mov     %ED_BLINK_RATE,A
        sta     @ed_blink
        lda     @ed_blink_state
        jnz     @ebc_hide
        call    @ed_show_cursor
        jmp     @ebc_done
ebc_hide:
        call    @ed_hide_cursor
ebc_done:
        pop     A
        rets

; ============================================================================
; ED_DRAW_SCREEN
; ============================================================================
ed_draw_screen:
        push    A
        push    B
        call    @clear_screen
        call    @draw_border
        call    @draw_title_game
        call    @ed_draw_all_bricks
        call    @ed_draw_cap_line
        call    @ed_draw_panel
        call    @ed_show_cursor
        pop     B
        pop     A
        rets

; ============================================================================
; ED_DRAW_ALL_BRICKS
; ============================================================================
ed_draw_all_bricks:
        push    A
        push    B
        lda     @ed_cursor_row
        push    A                   ; push cursor_row — ed_key_tmr is the movement timer, can't borrow it
        lda     @ed_cursor_col
        sta     @ed_tmp_col
        mov     %ED_MAX_ROWS,A      ; always show all 18 rows in editor
        sta     @tmp1
        clr     A
        sta     @loop_i
edab_row:
        lda     @loop_i
        mov     A,B
        lda     @tmp1
        cmp     R0,R1
        jl      @edab_row_do
        jmp     @edab_done
edab_row_do:
        lda     @loop_i
        sta     @ed_cursor_row
        clr     A
        sta     @loop_j
edab_col:
        lda     @loop_j
        cmp     %ED_COLS,A
        jhs     @edab_nxt_row
        sta     @ed_cursor_col
        call    @ed_cell_read
        xor     %0,A                ; re-test Z immediately (pop B inside ed_cell_read clears Z)
        jnz     @edab_draw          ; non-empty: go draw
        ; empty cell — erase it
        lda     @loop_i
        sta     @tmp1
        lda     @loop_j
        sta     @tmp2
        call    @ed_erase_cell
        jmp     @edab_nxt_col
edab_draw:
        push    A                   ; save color (lda @loop_i will clobber A)
        lda     @loop_i
        sta     @tmp1
        lda     @loop_j
        sta     @tmp2
        pop     A                   ; restore color for draw_one_brick
        call    @draw_one_brick
edab_nxt_col:
        mov     %ED_MAX_ROWS,A      ; restore tmp1 for outer row loop
        sta     @tmp1
        lda     @loop_j
        inc     A
        sta     @loop_j
        jmp     @edab_col
edab_nxt_row:
        lda     @loop_i
        inc     A
        sta     @loop_i
        jmp     @edab_row
edab_done:
        pop     A                   ; restore cursor_row from stack
        sta     @ed_cursor_row
        lda     @ed_tmp_col
        sta     @ed_cursor_col
        pop     B
        pop     A
        rets

; ============================================================================
; ED_DRAW_CAP_LINE
; ============================================================================
ed_draw_cap_line:
        ; Cap line removed: BRICK_ROWS_MAX=18 = ED_MAX_ROWS, no divider needed
        rets

; ============================================================================
; ED_DRAW_PANEL
; ============================================================================
ed_draw_panel:
        push    A
        push    B
        mov     %ED_PANEL_SEG,A
        sta     @text_x_seg
        mov     %5,A
        sta     @text_y
        movd    %ed_str_niv,TEMP1
        call    @draw_text_line_green
        mov     %5,A
        sta     @digit_y
        mov     %ED_PANEL_SEG+4,B
        lda     @ed_level
        inc     A
        call    @draw_digit20
        mov     %34,A
        sta     @text_y
        movd    %ed_str_brq,TEMP1
        call    @draw_text_line_green
        mov     %46,A
        sta     @text_y
        movd    %ed_str_br_r,TEMP1
        call    @draw_text_line_green
        mov     %58,A
        sta     @text_y
        movd    %ed_str_br_o,TEMP1
        call    @draw_text_line_green
        mov     %70,A
        sta     @text_y
        movd    %ed_str_br_g,TEMP1
        call    @draw_text_line_green
        mov     %82,A
        sta     @text_y
        movd    %ed_str_br_b,TEMP1
        call    @draw_text_line_green
        mov     %94,A
        sta     @text_y
        movd    %ed_str_br_d,TEMP1
        call    @draw_text_line_green
        mov     %106,A
        sta     @text_y
        movd    %ed_str_br_y,TEMP1
        call    @draw_text_line_green
        mov     %118,A
        sta     @text_y
        movd    %ed_str_br_a,TEMP1
        call    @draw_text_line_green
        mov     %130,A
        sta     @text_y
        movd    %ed_str_br_u,TEMP1
        call    @draw_text_line_green
        mov     %142,A
        sta     @text_y
        movd    %ed_str_br_e,TEMP1
        call    @draw_text_line_green
        mov     %154,A
        sta     @text_y
        movd    %ed_str_br_w,TEMP1
        call    @draw_text_line_green
        mov     %166,A
        sta     @text_y
        movd    %ed_str_br_p,TEMP1
        call    @draw_text_line_green
        mov     %182,A
        sta     @text_y
        movd    %ed_str_cmv,TEMP1
        call    @draw_text_line_green
        mov     %194,A
        sta     @text_y
        movd    %ed_str_cnxt,TEMP1
        call    @draw_text_line_green
        mov     %206,A
        sta     @text_y
        movd    %ed_str_csav,TEMP1
        call    @draw_text_line_green
        mov     %218,A
        sta     @text_y
        movd    %ed_str_cclr,TEMP1
        call    @draw_text_line_green
        mov     %230,A
        sta     @text_y
        movd    %ed_str_cqui,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

; ============================================================================
; ED_DRAW_SAVED_FLASH
; ============================================================================
ed_draw_saved_flash:
        push    A
        push    B
        mov     %ED_PANEL_SEG,A
        sta     @text_x_seg
        mov     %242,A
        sta     @text_y
        movd    %ed_str_saved,TEMP1
        call    @draw_text_line_green
        mov     %80,A
edsf_w:
        call    @frame_delay
        dec     A
        jnz     @edsf_w
        mov     %242,A
        sta     @text_y
        movd    %ed_str_blank,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

; ============================================================================
; ED_DRAW_QUIT_CONFIRM / ED_CLEAR_QUIT_MSG
; ============================================================================
ed_draw_quit_confirm:
        push    A
        push    B
        mov     %ED_PANEL_SEG,A
        sta     @text_x_seg
        mov     %242,A
        sta     @text_y
        movd    %ed_str_qask,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

ed_clear_quit_msg:
        push    A
        push    B
        mov     %ED_PANEL_SEG,A
        sta     @text_x_seg
        mov     %242,A
        sta     @text_y
        movd    %ed_str_blank,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

; ============================================================================
; EDITOR STRINGS
; ============================================================================
ed_str_niv:
        .byte   'N','I','V',':',$00
ed_str_brq:
        .byte   'B','R','I','Q','U','E','S',':',$00
ed_str_br_r:
        .byte   'R','=','R','o','u','g','e',$00
ed_str_br_o:
        .byte   'O','=','O','r','a','n','g','e',$00
ed_str_br_g:
        .byte   'G','=','V','e','r','t',$00
ed_str_br_b:
        .byte   'B','=','B','l','e','u',$00
ed_str_br_d:
        .byte   'D','=','S','o','m','b','r','e',$00
ed_str_br_y:
        .byte   'Y','=','J','a','u','n','e',$00
ed_str_br_a:
        .byte   'A','=','A','r','m','u','r','e',$00
ed_str_br_u:
        .byte   'U','=','I','n','v','i','n','c',$00
ed_str_br_e:
        .byte   'E','=','E','x','p','l','o',$00
ed_str_br_w:
        .byte   'W','=','P','o','w','e','r',$00
ed_str_br_p:
        .byte   '1','-','4','=','P','w','r','u','p',$00
ed_str_cmv:
        .byte   'I','J','K','L','Z','X','C','V',$00
ed_str_cnxt:
        .byte   'N','=','N','i','v','e','a','u',$00
ed_str_csav:
        .byte   'S','=','S','a','u','v','e',$00
ed_str_cclr:
        .byte   '.','=','V','i','d','e',$00
ed_str_cqui:
        .byte   'Q','=','Q','u','i','t','t','e','r',$00
ed_str_saved:
        .byte   'S','A','U','V','E','!',$00
ed_str_qask:
        .byte   'Q','u','i','t','?',' ','Y','/',$00
ed_str_blank:
        .byte   ' ',' ',' ',' ',' ',' ',' ',' ',' ',$00

; ============================================================================
; END OF LEVEL EDITOR
; ============================================================================


        .end