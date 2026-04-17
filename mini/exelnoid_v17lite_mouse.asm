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
MOUSE_DRV_SIZE  .equ    148         ; driver size in bytes
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


        .org    $8004

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

        ; Force color mode (reg6/reg7) before any drawing
        movp    %6,P45
        movp    %$88,P45
        movp    %7,P45
        movp    %$00,P45

        ; Set R35 (VDP06) = $88 so ROM INT1 handler preserves color mode.
        ; The interrupt at $F6BD reads R35 and writes it to VDP register 6.
        mov     %$88,A
        sta     @$23                 ; R35 = VDP06 in TMS7020 register file

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

        ; Install ExelMouse driver into SRAM at MOUSE_DRV_ADDR ($C6D4)
        movd    %mouse_drv_rom,TEMP1    ; src = driver data in CRAM
        movd    %MOUSE_DRV_ADDR,TEMP2   ; dst = $C6D4 in SRAM
        mov     %MOUSE_DRV_SIZE,B        ; 148 bytes
mouse_install_lp:
        lda     *TEMP1
        sta     *TEMP2
        add     %1,TEMP1
        adc     %0,TEMP1-1
        add     %1,TEMP2
        adc     %0,TEMP2-1
        djnz    B,@mouse_install_lp

        movd    %small_lpc,PTRSON
        trap    4

        ; 3) Enter main loop - typewriter starts from here
intro_main_loop:
        mov     %$58,B
        ldsp
        call    @frame_delay
        ; Draw short story text once
        lda     @text_done
        jnz     @iml_wait
        mov     %1,A
        sta     @text_done
        ; Draw story text lines
        mov     %TEXT_START_X_SEG,A
        sta     @text_x_seg
        mov     %TEXT_START_Y,A
        sta     @text_y
        movd    %story_text,TEMP1
        call    @draw_text_line_green
        mov     %TEXT_START_Y+10,A
        sta     @text_y
        movd    %story_line2,TEMP1
        call    @draw_text_line_green
        mov     %TEXT_START_Y+20,A
        sta     @text_y
        movd    %story_line3,TEMP1
        call    @draw_text_line_green
iml_wait:
        ; Check for keypress
        mov     VALUE0,A
        sta     @key_cur
        cmp     %$86,A
        jeq     @iml_no_key
        cmp     %$89,A
        jeq     @iml_no_key
        jz      @iml_no_key
        cmp     %$04,A
        jeq     @iml_no_key
        ; Key pressed — show menu
        lda     @menu_shown
        jnz     @iml_no_key
        mov     %1,A
        sta     @menu_shown
        call    @show_difficulty_menu
        call    @game_start
iml_no_key:
ml_no_menu:
        br      @intro_main_loop

; type_step stub (not used in lite)
type_step:
        rets

; --- Stars stub (removed for lite version) ---
draw_stars:
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

; --- Simplified text-based title (lite version) ---
draw_title:
        push    A
        push    B
        mov     %30,A
        sta     @text_y
        mov     %8,A
        sta     @text_x_seg
        movd    %title_str,TEMP1
        call    @draw_text_line_green
        mov     %46,A
        sta     @text_y
        mov     %12,A
        sta     @text_x_seg
        movd    %title_str2,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

title_str:
        .byte   'E','X','E','L','N','O','I','D',$00
title_str2:
        .byte   'L','i','t','e',$00

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
        .byte   'C','a','s','s','e','-','b','r','i','q','u','e','s',' ','p','o','u','r',$00
story_line2:
        .byte   'E','X','L','1','0','0',' ','/',' ','E','X','E','L','T','E','L',$00
story_line3:
        .byte   'A','p','p','u','y','e','z',' ','s','u','r',' ','u','n','e',' ','t','o','u','c','h','e',$00


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
        ; Full clear + redraw title
        call    @clear_screen
        call    @draw_title

        ; Draw "Difficulte :" at y=130
        mov     %130,A
        sta     @text_y
        mov     %14,A
        sta     @text_x_seg
        movd    %menu_diff_str,TEMP1
        call    @draw_text_line_green

        ; Draw choices at y=146
        mov     %146,A
        sta     @text_y
        mov     %6,A
        sta     @text_x_seg
        movd    %menu_choice_str,TEMP1
        call    @draw_text_line_green

        ; Draw mouse hint at y=162
        mov     %162,A
        sta     @text_y
        mov     %4,A
        sta     @text_x_seg
        movd    %menu_mouse_hint_str,TEMP1
        call    @draw_text_line_green

        ; Wait for key 1, 2, or 3
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
        cmp     %$73,A              ; 's' - toggle mouse (Souris)
        jeq     @sdm_toggle_mouse
        cmp     %$53,A              ; 'S' - toggle mouse (Souris)
        jeq     @sdm_toggle_mouse
        br      @sdm_key_wait
sdm_toggle_mouse:
        lda     @mouse_enabled
        xor     %1,A
        sta     @mouse_enabled
        ; Redraw the mouse status line at y=162
        mov     %162,A
        sta     @text_y
        mov     %4,A
        sta     @text_x_seg
        lda     @mouse_enabled
        jnz     @sdm_show_enabled
        movd    %menu_mouse_hint_str,TEMP1
        call    @draw_text_line_green
        br      @sdm_wait_release
sdm_show_enabled:
        movd    %menu_mouse_on_str,TEMP1
        call    @draw_text_line_green
sdm_wait_release:
        call    @frame_delay        ; wait for S key to be released
        mov     VALUE0,A
        sta     @key_cur
        lda     @key_cur
        cmp     %$73,A              ; still holding s?
        jeq     @sdm_wait_release
        cmp     %$53,A              ; still holding S?
        jeq     @sdm_wait_release
        br      @sdm_key_wait
sdm_key1:
        mov     %BALL_SPEED_EASY,A
        sta     @difficulty
        mov     %0,A
        sta     @lives_d0
        mov     %1,A
        sta     @lives_d1
        br      @sdm_done_diff
sdm_key2:
        mov     %BALL_SPEED_NORM,A
        sta     @difficulty
        mov     %LIVES_NORM,A
        sta     @lives_d0
        clr     A
        sta     @lives_d1
        br      @sdm_done_diff
sdm_key3:
        mov     %BALL_SPEED_HARD,A
        sta     @difficulty
        mov     %LIVES_HARD,A
        sta     @lives_d0
        clr     A
        sta     @lives_d1
sdm_done_diff:
sdm_set_diff:
        pop     B
        pop     A
        rets

; --- Stubs for removed menu features ---
sdm_key_edit:
sdm_do_mouse:
sdm_do_cram:
        rets

; Menu strings
menu_diff_str:
        .byte   ' ','D','i','f','f','i','c','u','l','t',$E9,' ',':',' ',$00
menu_choice_str:
        .byte   '1','-','T','r','a','n','q','u','i','l','l','o','u',' ',' ','2','-','T','K','T',' ',' ','3','-','F','l','e','m','m','e',$00
menu_mouse_hint_str:
        .byte   'S',' ',':',' ','A','c','t','i','v','e','r',' ','l','a',' ','s','o','u','r','i','s',$00
menu_mouse_on_str:
        .byte   'S','o','u','r','i','s',' ','a','c','t','i','v',$E9,'e',' ',' ',' ',' ',' ',' ',' ',$00


; ============================================================================

; --- CRAM stub (removed for lite version) ---
crl_read:
cram_load:
crl_success:
crl_fail:
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

        ; Reinstall ExelMouse driver (game_start may overwrite SRAM area)
        lda     @mouse_enabled
        jz      @gs_no_mouse_install
        movd    %mouse_drv_rom,TEMP1    ; src = driver data
        movd    %MOUSE_DRV_ADDR,TEMP2   ; dst = $C6D4
        mov     %MOUSE_DRV_SIZE,B
gs_mouse_lp:
        lda     *TEMP1
        sta     *TEMP2
        add     %1,TEMP1
        adc     %0,TEMP1-1
        add     %1,TEMP2
        adc     %0,TEMP2-1
        djnz    B,@gs_mouse_lp
gs_no_mouse_install:
        ; Flush stale mouse reads at game start (P49/P50 settle)
        lda     @mouse_enabled
        jz      @gs_no_flush
        call    @read_mouse
        call    @read_mouse
        call    @read_mouse
        call    @read_mouse
        clr     A
        sta     @mouse_btn_latch    ; clear button edge latch
gs_no_flush:
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
        lda     @auto_mode
        xor     %1,A
        sta     @auto_mode          ; O key: toggle auto mode
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
; MOUSE ROUTINES
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

mouse_delay:
        push    A
        push    B
md_lp:  lda     @mouse_btn_old       ; 3-byte instruction as timing padding
        lda     @mouse_btn_old       ; 3-byte instruction as timing padding
        djnz    B,@md_lp
        pop     B
        pop     A
        rets

check_mouse:
        push    A
        push    B

        call    @read_mouse

        ; --- Process delta X (TEMP1 = signed delta from P49/P50) ---
        mov     TEMP1,A
        jz      @cm_no_move
        and     %$80,A
        jnz     @cm_dir1
        ; bit 7 clear = positive delta -> move left
        call    @do_move_left
        br      @cm_no_move
cm_dir1:
        ; bit 7 set = negative delta -> move right
        call    @do_move_right
cm_no_move:

        ; --- Button check (mouse_btn_old bits 6,5 active low) ---
        lda     @mouse_btn_old
        xor     %$FF,A
        and     %$60,A
        jz      @cm_no_btn
        lda     @mouse_btn_latch
        jnz     @cm_done
        mov     %1,A
        sta     @mouse_btn_latch
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

check_mouse_btn:
        push    A
        push    B
        call    @read_mouse
        lda     @mouse_btn_old
        xor     %$FF,A
        and     %$60,A
        jz      @cmb_no_btn
        lda     @mouse_btn_latch
        jnz     @cmb_done
        mov     %1,A
        sta     @mouse_btn_latch
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
        mov     %POWER_TYPE_LIFE,A
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



; --- Simplified logo (lite: just clear area) ---
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
        mov     %28,A
        sta     @text_x_seg
        mov     %20,A
        sta     @text_y
        movd    %lite_hud_str,TEMP1
        call    @draw_text_line_green
        pop     B
        pop     A
        rets

lite_hud_str:
        .byte   'E','X','E','L','N','O','I','D',$00

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
; --- Bravo screen stub (lite: just restart from level 0) ---
draw_bravo_screen:
        push    A
        push    B
        call    @clear_game_area_only

        ; Display BRAVO text
        mov     %80,A
        sta     @text_y
        mov     %9,A
        sta     @text_x_seg
        movd    %bravo_str1,TEMP1
        call    @draw_text_line_green

        mov     %100,A
        sta     @text_y
        mov     %5,A
        sta     @text_x_seg
        movd    %bravo_str2,TEMP1
        call    @draw_text_line_green

        mov     %120,A
        sta     @text_y
        mov     %3,A
        sta     @text_x_seg
        movd    %bravo_str3,TEMP1
        call    @draw_text_line_green

        ; Victory music
        call    @sfx_victory

        ; Wait for keypress
dbs_wait:
        call    @frame_delay
        mov     VALUE0,A
        cmp     %$86,A
        jeq     @dbs_wait
        cmp     %$89,A
        jeq     @dbs_wait
        jz      @dbs_wait
        cmp     %$04,A
        jeq     @dbs_wait

        ; Return to difficulty menu and restart
        pop     B
        pop     A
        call    @show_difficulty_menu
        call    @game_start
        rets

bravo_str1:
        .byte   'B','R','A','V','O',' ','!',$00
bravo_str2:
        .byte   'T','o','u','s',' ','l','e','s',' ','n','i','v','e','a','u','x',$00
bravo_str3:
        .byte   's','o','n','t',' ','t','e','r','m','i','n',$E9,'s',' ','!',$00

check_konami:
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



; --- Null ISR (interrupt returns safely) ---
null_isr:
        rets

; --- Sound effects ---
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

; --- Fire/bullet stubs (removed for lite version) ---
draw_cannons:
erase_cannons:
fire_bullets:
move_bullets:
draw_bullet1:
draw_bullet2:
erase_bullet1:
erase_bullet2:
erase_bullet1_raw:
erase_bullet2_raw:
debug_bullet1:
check_bullet1_hit:
check_bullet2_hit:
seg_to_col_calc:
        rets

; Power-up cycle (fire removed → replaced with life)
power_type_cycle:
        .byte   POWER_TYPE_SLOW
        .byte   POWER_TYPE_WIDE
        .byte   POWER_TYPE_LIFE
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
; EXPLODE_BRICK - destroy brick at (tmp1,tmp2) and all 4 neighbors
; Indestructible bricks (color 10) are immune
; ============================================================================
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
        call    @draw_paddle
        lda     @ball_active
        jnz     @epu_done
        call    @draw_ball
epu_done:
        pop     B
        pop     A
        rets


; ============================================================================
; INIT_BRICKS — ROM-only level decoder (lite version, no CRAM/editor)
; ============================================================================
init_bricks:
        push    A
        push    B
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

; --- Editor stub ---
ed_rom_fill_bricks:
        rets

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

        ; Indestructible: draw as white (color 4 = blue, reuse)
        lda     @tmp3
        cmp     %BRICK_COLOR_INDES,A
        jne     @dob_chk_explo
        mov     %4,A                ; substitute color
        sta     @tmp3
        br      @dob_normal
dob_chk_explo:
        ; Explosive: draw as red (color 1)
        lda     @tmp3
        cmp     %BRICK_COLOR_EXPLO,A
        jne     @dob_normal
        mov     %1,A
        sta     @tmp3
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
; 8x8 (segment-style) label font: S,C,O,R,E,:,V,I,T
; 8px label font for "VITESSE :"
; ============================================================================
; UTILITIES
; --- Simplified border (lite: solid white bars, no rounded corners) ---

; EXELNOID HUD title bitmap data (12 segments × 4 blocks × 3 planes)
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
        clr     A
        sta     @cur_y
db_line:
        ; Left border (segment 0)
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        wvdp(%BL_MASK)
        ; Right border (segment 27)
        mov     %BORDER_RIGHT_SEG,B
        lda     @cur_y
        add     %GAME_Y,A
        call    @set_line_at
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        wvdp(%BR_MASK)
        lda     @cur_y
        inc     A
        sta     @cur_y
        cmp     %SCREEN_H,A
        jl      @db_line
        ; --- Top border: 5 lines (y=0..4) ---
        clr     A
        sta     @cur_y
db_top:
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %28,B
db_top_seg:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,db_top_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        cmp     %GAME_Y,A
        jl      @db_top

        ; --- Bottom border: 5 lines (y=245..249) ---
        mov     %BORDER_BOTTOM_Y,A
        sta     @cur_y
db_bot:
        mov     %BORDER_LEFT_SEG,B
        lda     @cur_y
        call    @set_line_at
        mov     %28,B
db_bot_seg:
        wvdp(%$FF)
        wvdp(%$FF)
        wvdp(%$FF)
        djnz    B,db_bot_seg
        lda     @cur_y
        inc     A
        sta     @cur_y
        cmp     %SCREEN_H,A
        jl      @db_bot

        pop     B
        pop     A
        rets

draw_top_border_line:
draw_bottom_border_line:
        rets

; ============================================================================
; MOUSE DRIVER ROM IMAGE -- 148 bytes, copied to MOUSE_DRV_ADDR at startup
; Source: ExelMouse documentation (Exelvision)
; ============================================================================
mouse_drv_rom:
; Patched for base $C6D4: BR target $C6D8 (+4), CALL target $C761 (+141)
        .byte   $8C,$C6,$D8,$0A,$8A,$C7,$FD,$E6
        .byte   $FA,$A4,$04,$06,$52,$06,$8E,$C7
        .byte   $61,$8A,$01,$33,$D0,$0E,$D4,$0E
        .byte   $73,$30,$0E,$23,$0F,$BE,$BE,$BE
        .byte   $BE,$B8,$A3,$FB,$06,$52,$01,$8E
        .byte   $C7,$61,$8A,$01,$33,$C0,$C4,$53
        .byte   $30,$44,$01,$0E,$23,$0F,$C9,$64
        .byte   $B8,$A4,$04,$06,$52,$01,$8E,$C7
        .byte   $61,$8A,$01,$33,$C0,$C4,$53,$30
        .byte   $44,$01,$0E,$23,$0F,$BE,$BE,$BE
        .byte   $BE,$B8,$A3,$FB,$06,$52,$01,$8E
        .byte   $C7,$61,$8A,$01,$33,$C0,$C4,$53
        .byte   $30,$44,$01,$0E,$23,$0F,$C9,$64
        .byte   $C9,$D0,$0D,$44,$01,$0D,$44,$0E
        .byte   $0D,$E6,$01,$0A,$8B,$C7,$FF,$62
        .byte   $8B,$C7,$FE,$12,$0E,$E2,$0A,$BC
        .byte   $BC,$BC,$BC,$23,$03,$8B,$C7,$FD
        .byte   $0A,$22,$04,$E0,$F8,$34,$01,$34
        .byte   $01,$CA,$FA,$0A

small_lpc:
        .byte   $00,$00

        .end