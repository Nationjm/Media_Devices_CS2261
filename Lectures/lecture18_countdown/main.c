#include "mylib.h"
#include "digits.h"

int time_m, time_s, time_cs;
int initial_time_m;
int striping_mode, percent_complete;

u16 pal0_color = COLOR(0,20,0);//COLOR(0,0,24);


short digit_to_sprite_tile_index[] = {132, 0, 4, 8, 12, 16, 20, 24, 28, 128};
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

void displayTime(){
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;
  short time_cs_1s = time_cs % 10;
  short time_cs_10s = time_cs / 10;

  char y = 64;
  char x = 8;
  shadowOAM[0].attr0 = ATTR0_AFFINE | y;
  shadowOAM[0].attr1 = ATTR1_MEDIUM | x;
  shadowOAM[0].attr2 = digit_to_sprite_tile_index[time_m_10s];

  shadowOAM[1].attr0 = ATTR0_AFFINE | y;
  shadowOAM[1].attr1 = ATTR1_MEDIUM | (x + 32) | (3 << 9);
  shadowOAM[1].attr2 = digit_to_sprite_tile_index[time_m_1s];

  shadowOAM[2].attr0 = ATTR0_TALL | ATTR0_AFFINE | y;
  shadowOAM[2].attr1 = ATTR1_MEDIUM | (x + 64);
  shadowOAM[2].attr2 = 136;

  shadowOAM[3].attr0 = ATTR0_AFFINE | y;
  shadowOAM[3].attr1 = ATTR1_MEDIUM | (x + 64 + 16) | (2 << 9);
  shadowOAM[3].attr2 = digit_to_sprite_tile_index[time_s_10s];

  shadowOAM[4].attr0 = ATTR0_AFFINE | y;
  shadowOAM[4].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 32) | (1 << 9);  // use affine matrix 1
  shadowOAM[4].attr2 = digit_to_sprite_tile_index[time_s_1s];

  if (time_cs < 50) {
    shadowOAM[7].fill -= 8;
  } else {
    shadowOAM[7].fill = 256;
  }

  if (time_s_1s == 0) {
    shadowOAM[11].fill -= 2;
  } else {
    shadowOAM[11].fill = 256;
  }

  if (time_s_1s == 0 && time_s_10s == 0) {
    shadowOAM[15].fill -= 2;
  } else {
    shadowOAM[15].fill = 256;
  }

  shadowOAM[5].attr0 = ATTR0_TALL | ATTR0_AFFINE | y;
  shadowOAM[5].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64);
  shadowOAM[5].attr2 = 138;

  shadowOAM[6].attr0 = ATTR0_AFFINE | y;
  shadowOAM[6].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64 + 16);
  shadowOAM[6].attr2 = digit_to_sprite_tile_index[time_cs_10s];

  shadowOAM[7].attr0 = ATTR0_AFFINE | y;
  shadowOAM[7].attr1 = ATTR1_MEDIUM | (x + 64 + 16 + 64 + 16 + 32);
  shadowOAM[7].attr2 = digit_to_sprite_tile_index[time_cs_1s];
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void interruptHandler(void) {
  REG_IME = 0; //disable interrupts

  if (REG_IF & INT_HBLANK) { // gotta go fast special case!
    PALETTE[0] = (BUTTON_HELD(BUTTON_START) && (SCANLINECOUNTER & 16)) ? pal0_color ^ COLOR(31,31,31) : pal0_color;

    REG_IF = INT_HBLANK; // handled just the one!
    REG_IME = 1;
    return; // exit early so we don't take too long
  }

  // Check which event happened, and do something if you care about it
  if (REG_IF & INT_TM0) {
    time_cs--;
    if (time_cs < 0) time_cs += 100;
    REG_IF = INT_TM0;
  }
  if (REG_IF & INT_TM1) {
    time_s--;
    if (time_s < 0) {
      time_s += 60;
      // time_m--;
    }
    if (time_m < 0) {
      time_m = 0;
      time_s = 0;
      time_cs = 0;
      pal0_color = RED;
      REG_TM0CNT = 0;
      REG_TM1CNT = 0;
    } else if (time_m < 10){
      pal0_color = COLOR(31, 20, 0);
    } else if (time_m < 30) {
      pal0_color = COLOR(25, 20, 0);
    } else {
      pal0_color = COLOR(percent_complete * 31 / 100,  20, 0);
    }
    REG_IF = INT_TM1;
  }

  if (REG_IF & INT_TM2) {
    time_m--;
    REG_IF = INT_TM2;
  }


  REG_IME = 1;      //re-enable interrupts
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void enableTimerInterrupts(void) {
  REG_IE |= INT_TM0 | INT_TM1 | INT_TM2;// | INT_TM2; // Enable timer interrupts
  // once per cs
  REG_TM0CNT = 0;
  REG_TM0D = 65536 - 164;
  REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;

  // once per s
  REG_TM1CNT = 0;
  REG_TM1D = 0;
  REG_TM1CNT = TM_FREQ_256 | TIMER_ON | TM_IRQ;

  // // timer 2 ticks when timer 1 overflows and triggers once per minute
  REG_TM2CNT = 0;
  REG_TM2D = 65536 - 60; // 60 seconds in a minute
  REG_TM2CNT = TM_CASCADE | TIMER_ON | TM_IRQ; // cascades from Timer1
}

void enableHBlankInterrupt(void){
  REG_IE |= INT_HBLANK;
  REG_DISPSTAT |= DISPSTAT_HBLANK_INT_ENABLE;
}

void setupInterrupts(void) {
  REG_IME = 0; //disable interrupts
  REG_INTERRUPT = interruptHandler; //set int handler
  enableTimerInterrupts();
  enableHBlankInterrupt();
  REG_IME = 1; //enable interrupts
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
int main(){
  REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

  // set affine matrix to the identity matrix initially.
  shadowOAM[0].fill = 256;
  shadowOAM[3].fill = 256;

  shadowOAM[4].fill = 256;
  shadowOAM[7].fill = 256;

  shadowOAM[8].fill = 256;
  shadowOAM[11].fill = 256;

  shadowOAM[12].fill = 256;
  shadowOAM[15].fill = 256;

  // hide all the sprites I don't plan to use;
  hideSprites();

  time_m = 74;
  time_s = 59;
  time_cs = 99;

  initial_time_m = time_m;

  // start the clock
  setupInterrupts();

  // digits sprites into memory
  DMANow(3, digitsPal, SPRITEPALETTE, digitsPalLen/2);
  DMANow(3, digitsTiles, &CHARBLOCK[4], digitsTilesLen/2);

  PALETTE[0] = pal0_color;

  while(1){
    percent_complete = 100 * (initial_time_m - time_m) / initial_time_m;
    displayTime();
    __asm__("swi 0x02 << 16");  // low power CPU until VBlank
    DMANow(3, &shadowOAM, OAM, 80);
  }
}