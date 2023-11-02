// notQuiteBouncingRectangleMode4WithSprites.c
/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
#include "lib.h"

#define ALIGN(x) __attribute__((aligned(x)))

typedef struct
{
  u16 attr0;
  u16 attr1;
  u16 attr2;
  short fill;
} ALIGN(4) OBJ_ATTR;

OBJ_ATTR shadowOAM[128];

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
void setSpritePixel(int x, int y, int tileid, volatile u8 color){
  color = color & 0xF;
  int offset = (4*8192) + ((x + y*8) >> 2) + tileid * 16;
  u16 originalShort = (videoBuffer)[offset];
  char mod = x % 4;
  if (mod == 0){
    videoBuffer[offset] = (originalShort & 0xFFF0) | color;
  } else if (mod == 1)
  {
    videoBuffer[offset] = (originalShort & 0xFF0F) | (color << 4);
  } else if (mod == 2)
  {
    videoBuffer[offset] = (originalShort & 0xF0FF) | (color << 8);
  } else if (mod == 3)
  {
    videoBuffer[offset] = (originalShort & 0x0FFF) | (color << 12);
  }
}

void interruptHandler(void){
  REG_IME = 0;

  if (REG_IF & INT_CART){
    PAL_MEM[0] = RGB(31, 0, 0);
    PAL_MEM[1] = RGB(31, 0, 0);
    return;
  }

  if (REG_IF & INT_HB){
    if (SCANLINE_COUNTER == 159){
      PAL_MEM[0] ^= RGB(31,31,31);
      PAL_MEM[1] ^= RGB(31,31,31);
    } else if(SCANLINE_COUNTER == 79){
      PAL_MEM[0] ^= RGB(31,31,31);
      PAL_MEM[1] ^= RGB(31,31,31);
    }
    REG_IF = INT_HB;
    REG_IME = 1;
    return;
  }

  if (REG_IF & INT_VB){
    enableInput = 1;
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM)/2);
  }

  REG_IF = REG_IF;
  REG_IME = 1;
  __asm__("swi 0x02 << 16"); // low power CPU until interrupt
}

void enableVBlankInterrupt() {
 REG_IE |= INT_VB; // Enable vblank interrupt detection
 REG_DISPSTAT |= INT_VBLANK_ENABLE; // Make display generate
                           // vblank interrupts
}

void enableHBlankInterrupt() {
 REG_IE |= INT_HB; // Enable vblank interrupt detection
 REG_DISPSTAT |= INT_HBLANK_ENABLE; // Make display generate
                           // hblank interrupts
}

void setupInterrupts(void) {
  REG_IME = 0; //disable interrupts
  // REG_IE |= INT_CART; // Enable CART interrupt!
  // DMANow(3, (void *)interruptHandler, (void *)0x02000000, 256);  // just guess how big the interrupt handler is!
  // REG_INTERRUPT = (void *)0x02000000; //set interrupt handler
  REG_INTERRUPT = interruptHandler;
  enableHBlankInterrupt();
  enableVBlankInterrupt();
  REG_IME = 1; //enable interrupts
}


/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
int main() {
  for(int i=0; i<128; i++){
    shadowOAM[i].attr0 = 1<<9;
  }

  REG_DISPCNT = BG2_ENABLE | SPRITE_ENABLE;

  PAL_MEM[0] = RGB(2, 22, 29);
  PAL_MEM[1] = PAL_MEM[0] ^ RGB(31, 31, 31);
  PAL_MEM[2] = RGB(31, 0, 0);

  SPRITE_PAL[1] = RGB(10,10,10);
  SPRITE_PAL[2] = RGB(12,12,12);
  SPRITE_PAL[3] = RGB(14,14,14);
  SPRITE_PAL[4] = RGB(16,16,16);
  SPRITE_PAL[5] = RGB(18,18,18);
  SPRITE_PAL[6] = RGB(20,20,20);
  SPRITE_PAL[7] = RGB(22,22,22);
  SPRITE_PAL[8] = RGB(24,24,24);

  setSpritePixel(0, 0, 0, 1);
  setSpritePixel(1, 1, 0, 2);
  setSpritePixel(2, 2, 0, 3);
  setSpritePixel(3, 3, 0, 4);
  setSpritePixel(4, 4, 0, 5);
  setSpritePixel(5, 5, 0, 6);
  setSpritePixel(6, 6, 0, 7);
  setSpritePixel(7, 7, 0, 8);

  setSpritePixel(7, 0, 1, 1);
  setSpritePixel(6, 1, 1, 2);
  setSpritePixel(5, 2, 1, 3);
  setSpritePixel(4, 3, 1, 4);
  setSpritePixel(3, 4, 1, 5);
  setSpritePixel(2, 5, 1, 6);
  setSpritePixel(1, 6, 1, 7);
  setSpritePixel(0, 7, 1, 8);

  setSpritePixel(0, 7, 32, 1);
  setSpritePixel(1, 6, 32, 2);
  setSpritePixel(2, 5, 32, 3);
  setSpritePixel(3, 4, 32, 4);
  setSpritePixel(4, 3, 32, 5);
  setSpritePixel(5, 2, 32, 6);
  setSpritePixel(6, 1, 32, 7);
  setSpritePixel(7, 0, 32, 8);

  setSpritePixel(7, 7, 33, 1);
  setSpritePixel(6, 6, 33, 2);
  setSpritePixel(5, 5, 33, 3);
  setSpritePixel(4, 4, 33, 4);
  setSpritePixel(3, 3, 33, 5);
  setSpritePixel(2, 2, 33, 6);
  setSpritePixel(1, 1, 33, 7);
  setSpritePixel(0, 0, 33, 8);

  int x = 0;
  int y = 0;

  setupInterrupts();

  /*
  * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
  * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
  * FIND USEFUL IN THIS FILE!
  */
  while (1) {
    if (KEY_DOWN_NOW(KEY_DOWN)) {
      y++;
    } else if (KEY_DOWN_NOW(KEY_UP)) {
      y--;
    }
    if (KEY_DOWN_NOW(KEY_RIGHT)) {
      x++;
    } else if (KEY_DOWN_NOW(KEY_LEFT)) {
      x--;
    }

    shadowOAM[0].attr0 = (y & ROWMASK);
    shadowOAM[0].attr1 = (x & COLMASK) | (1<<14);  // 1<<14 is "size 1"
    shadowOAM[0].attr2 = 0;
    shadowOAM[1].attr0 = (y & ROWMASK);
    shadowOAM[1].attr1 = ((200 - x) & COLMASK) | (1<<14);  // 1<<14 is "size 1"
    shadowOAM[1].attr2 = 0;
  /*
  * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
  * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
  * FIND USEFUL IN THIS FILE!
  */
    waitForVBlank();
  }
}
/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */