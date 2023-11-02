# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"






# 1 "lib.h" 1

typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
# 35 "lib.h"
typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;






extern volatile u16 *videoBuffer;


void waitForVBlank();
void DMANow(int channel, const volatile void* src, volatile void* dst, volatile unsigned int cnt);

typedef void (*ihp_t)(void);
# 87 "lib.h"
extern int enableInput;
# 8 "main.c" 2



typedef struct
{
  u16 attr0;
  u16 attr1;
  u16 attr2;
  short fill;
} __attribute__((aligned(4))) OBJ_ATTR;

OBJ_ATTR shadowOAM[128];






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
  *(volatile u16*)0x04000208 = 0;

  if (*(volatile u16*)0x04000202 & 1 << 13){
    ((volatile unsigned short*)0x05000000)[0] = ((31) | (0) << 5 | (0) << 10);
    ((volatile unsigned short*)0x05000000)[1] = ((31) | (0) << 5 | (0) << 10);
    return;
  }

  if (*(volatile u16*)0x04000202 & 1 << 1){
    if ((*(volatile u16*)0x04000006) == 159){
      ((volatile unsigned short*)0x05000000)[0] ^= ((31) | (31) << 5 | (31) << 10);
      ((volatile unsigned short*)0x05000000)[1] ^= ((31) | (31) << 5 | (31) << 10);
    } else if((*(volatile u16*)0x04000006) == 79){
      ((volatile unsigned short*)0x05000000)[0] ^= ((31) | (31) << 5 | (31) << 10);
      ((volatile unsigned short*)0x05000000)[1] ^= ((31) | (31) << 5 | (31) << 10);
    }
    *(volatile u16*)0x04000202 = 1 << 1;
    *(volatile u16*)0x04000208 = 1;
    return;
  }

  if (*(volatile u16*)0x04000202 & 1 << 0){
    enableInput = 1;
    DMANow(3, shadowOAM, (void*) 0x07000000, sizeof(shadowOAM)/2);
  }

  *(volatile u16*)0x04000202 = *(volatile u16*)0x04000202;
  *(volatile u16*)0x04000208 = 1;
  __asm__("swi 0x02 << 16");
}

void enableVBlankInterrupt() {
 *(volatile u16*)0x04000200 |= 1 << 0;
 *(volatile u16*)0x04000004 |= 1 << 3;

}

void enableHBlankInterrupt() {
 *(volatile u16*)0x04000200 |= 1 << 1;
 *(volatile u16*)0x04000004 |= 1 << 4;

}

void setupInterrupts(void) {
  *(volatile u16*)0x04000208 = 0;



  *((ihp_t *)0x03007FFC) = interruptHandler;
  enableHBlankInterrupt();
  enableVBlankInterrupt();
  *(volatile u16*)0x04000208 = 1;
}







int main() {
  for(int i=0; i<128; i++){
    shadowOAM[i].attr0 = 1<<9;
  }

  (*(volatile unsigned short *)0x04000000) = (1<<10) | (1 << 12);

  ((volatile unsigned short*)0x05000000)[0] = ((2) | (22) << 5 | (29) << 10);
  ((volatile unsigned short*)0x05000000)[1] = ((volatile unsigned short*)0x05000000)[0] ^ ((31) | (31) << 5 | (31) << 10);
  ((volatile unsigned short*)0x05000000)[2] = ((31) | (0) << 5 | (0) << 10);

  (((volatile unsigned short*)0x05000000) + 256)[1] = ((10) | (10) << 5 | (10) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[2] = ((12) | (12) << 5 | (12) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[3] = ((14) | (14) << 5 | (14) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[4] = ((16) | (16) << 5 | (16) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[5] = ((18) | (18) << 5 | (18) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[6] = ((20) | (20) << 5 | (20) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[7] = ((22) | (22) << 5 | (22) << 10);
  (((volatile unsigned short*)0x05000000) + 256)[8] = ((24) | (24) << 5 | (24) << 10);

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






  while (1) {
    if (((~((*(volatile u16*)0x04000130)) & 0x0080) && enableInput)) {
      y++;
    } else if (((~((*(volatile u16*)0x04000130)) & 0x0040) && enableInput)) {
      y--;
    }
    if (((~((*(volatile u16*)0x04000130)) & 0x0010) && enableInput)) {
      x++;
    } else if (((~((*(volatile u16*)0x04000130)) & 0x0020) && enableInput)) {
      x--;
    }

    shadowOAM[0].attr0 = (y & (0xFF));
    shadowOAM[0].attr1 = (x & (0x1FF)) | (1<<14);
    shadowOAM[0].attr2 = 0;
    shadowOAM[1].attr0 = (y & (0xFF));
    shadowOAM[1].attr1 = ((200 - x) & (0x1FF)) | (1<<14);
    shadowOAM[1].attr2 = 0;





    waitForVBlank();
  }
}
