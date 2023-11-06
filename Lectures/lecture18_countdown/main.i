# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "mylib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "mylib.h"
extern unsigned short *videoBuffer;
# 85 "mylib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "mylib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "mylib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "mylib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMArec;
# 227 "mylib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 268 "mylib.h"
typedef void (*ihp_t)(void);
# 2 "main.c" 2
# 1 "digits.h" 1
# 21 "digits.h"
extern const unsigned short digitsTiles[16384];


extern const unsigned short digitsPal[256];
# 3 "main.c" 2

int time_m, time_s, time_cs;
int initial_time_m;
int striping_mode, percent_complete;

u16 pal0_color = ((0) | (20)<<5 | (0)<<10);


short digit_to_sprite_tile_index[] = {132, 0, 4, 8, 12, 16, 20, 24, 28, 128};


void displayTime(){
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;
  short time_cs_1s = time_cs % 10;
  short time_cs_10s = time_cs / 10;

  char y = 64;
  char x = 8;
  shadowOAM[0].attr0 = (1<<8) | y;
  shadowOAM[0].attr1 = (2<<14) | x;
  shadowOAM[0].attr2 = digit_to_sprite_tile_index[time_m_10s];

  shadowOAM[1].attr0 = (1<<8) | y;
  shadowOAM[1].attr1 = (2<<14) | (x + 32) | (3 << 9);
  shadowOAM[1].attr2 = digit_to_sprite_tile_index[time_m_1s];

  shadowOAM[2].attr0 = (2<<14) | (1<<8) | y;
  shadowOAM[2].attr1 = (2<<14) | (x + 64);
  shadowOAM[2].attr2 = 136;

  shadowOAM[3].attr0 = (1<<8) | y;
  shadowOAM[3].attr1 = (2<<14) | (x + 64 + 16) | (2 << 9);
  shadowOAM[3].attr2 = digit_to_sprite_tile_index[time_s_10s];

  shadowOAM[4].attr0 = (1<<8) | y;
  shadowOAM[4].attr1 = (2<<14) | (x + 64 + 16 + 32) | (1 << 9);
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

  shadowOAM[5].attr0 = (2<<14) | (1<<8) | y;
  shadowOAM[5].attr1 = (2<<14) | (x + 64 + 16 + 64);
  shadowOAM[5].attr2 = 138;

  shadowOAM[6].attr0 = (1<<8) | y;
  shadowOAM[6].attr1 = (2<<14) | (x + 64 + 16 + 64 + 16);
  shadowOAM[6].attr2 = digit_to_sprite_tile_index[time_cs_10s];

  shadowOAM[7].attr0 = (1<<8) | y;
  shadowOAM[7].attr1 = (2<<14) | (x + 64 + 16 + 64 + 16 + 32);
  shadowOAM[7].attr2 = digit_to_sprite_tile_index[time_cs_1s];
}


void interruptHandler(void) {
  *(unsigned short*)0x4000208 = 0;

  if (*(volatile unsigned short*)0x4000202 & (1 << 1)) {
    ((unsigned short *)0x5000000)[0] = ((~((*(volatile unsigned short *)0x04000130)) & ((1<<3))) && ((*(volatile unsigned short *)0x4000006) & 16)) ? pal0_color ^ ((31) | (31)<<5 | (31)<<10) : pal0_color;

    *(volatile unsigned short*)0x4000202 = (1 << 1);
    *(unsigned short*)0x4000208 = 1;
    return;
  }


  if (*(volatile unsigned short*)0x4000202 & (1<<3)) {
    time_cs--;
    if (time_cs < 0) time_cs += 100;
    *(volatile unsigned short*)0x4000202 = (1<<3);
  }
  if (*(volatile unsigned short*)0x4000202 & (1<<4)) {
    time_s--;
    if (time_s < 0) {
      time_s += 60;

    }
    if (time_m < 0) {
      time_m = 0;
      time_s = 0;
      time_cs = 0;
      pal0_color = ((31) | (0)<<5 | (0)<<10);
      *(volatile unsigned short*)0x4000102 = 0;
      *(volatile unsigned short*)0x4000106 = 0;
    } else if (time_m < 10){
      pal0_color = ((31) | (20)<<5 | (0)<<10);
    } else if (time_m < 30) {
      pal0_color = ((25) | (20)<<5 | (0)<<10);
    } else {
      pal0_color = ((percent_complete * 31 / 100) | (20)<<5 | (0)<<10);
    }
    *(volatile unsigned short*)0x4000202 = (1<<4);
  }

  if (*(volatile unsigned short*)0x4000202 & (1<<5)) {
    time_m--;
    *(volatile unsigned short*)0x4000202 = (1<<5);
  }


  *(unsigned short*)0x4000208 = 1;
}


void enableTimerInterrupts(void) {
  *(unsigned short*)0x4000200 |= (1<<3) | (1<<4) | (1<<5);

  *(volatile unsigned short*)0x4000102 = 0;
  *(volatile unsigned short*)0x4000100 = 65536 - 164;
  *(volatile unsigned short*)0x4000102 = 3 | (1<<7) | (1<<6);


  *(volatile unsigned short*)0x4000106 = 0;
  *(volatile unsigned short*)0x4000104 = 0;
  *(volatile unsigned short*)0x4000106 = 2 | (1<<7) | (1<<6);


  *(volatile unsigned short*)0x400010A = 0;
  *(volatile unsigned short*)0x4000108 = 65536 - 60;
  *(volatile unsigned short*)0x400010A = (1<<2) | (1<<7) | (1<<6);
}

void enableHBlankInterrupt(void){
  *(unsigned short*)0x4000200 |= (1 << 1);
  *(unsigned short*)0x4000004 |= (1<<4);
}

void setupInterrupts(void) {
  *(unsigned short*)0x4000208 = 0;
  *((ihp_t *)0x03007FFC) = interruptHandler;
  enableTimerInterrupts();
  enableHBlankInterrupt();
  *(unsigned short*)0x4000208 = 1;
}


int main(){
  (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


  shadowOAM[0].fill = 256;
  shadowOAM[3].fill = 256;

  shadowOAM[4].fill = 256;
  shadowOAM[7].fill = 256;

  shadowOAM[8].fill = 256;
  shadowOAM[11].fill = 256;

  shadowOAM[12].fill = 256;
  shadowOAM[15].fill = 256;


  hideSprites();

  time_m = 74;
  time_s = 59;
  time_cs = 99;

  initial_time_m = time_m;


  setupInterrupts();


  DMANow(3, digitsPal, ((unsigned short *)0x5000200), 512/2);
  DMANow(3, digitsTiles, &((charblock *)0x6000000)[4], 32768/2);

  ((unsigned short *)0x5000000)[0] = pal0_color;

  while(1){
    percent_complete = 100 * (initial_time_m - time_m) / initial_time_m;
    displayTime();
    __asm__("swi 0x02 << 16");
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 80);
  }
}
