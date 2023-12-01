# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"





# 1 "lib.h" 1

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 50 "lib.h"
extern unsigned short *videoBuffer;
# 61 "lib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void waitForVBlank();
void flipPage();
# 94 "lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 105 "lib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 145 "lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 7 "main.c" 2
# 1 "collab.h" 1
# 21 "collab.h"
extern const unsigned short collabTiles[576];


extern const unsigned short collabPal[256];
# 8 "main.c" 2
# 1 "world1.h" 1
# 22 "world1.h"
extern const unsigned short world1Tiles[912];


extern const unsigned short world1Map[14336];


extern const unsigned short world1Pal[256];
# 9 "main.c" 2

void initialize();
void game();

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;

int sbb = 32-15;

int screenTile;


 unsigned short bgMap[1024] =
 { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 6, 6 | (1<<10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 6 | (1<<11), 6 | (3<<10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,};

int main() {

 initialize();

 while(1) {

  game();

  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
 }
}






void initialize() {


 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9);






 (*(volatile unsigned short*)0x4000008) = (0<<14) | (((0) & 3)<<2) | (((1) & 31)<<8);
 (*(volatile unsigned short*)0x400000A) = (1<<14) | (((1) & 3)<<2) | (((sbb) & 31)<<8);



 DMANow(3, world1Pal, ((unsigned short *)0x5000000), 256);



 DMANow(3, collabTiles, &((charblock *)0x6000000)[0], 1152/2);



 DMANow(3, bgMap, &((screenblock *)0x6000000)[1], sizeof(bgMap) /2);

 DMANow(3, world1Tiles, &((charblock *)0x6000000)[1], 1824/2);
 DMANow(3, world1Map, &((screenblock *)0x6000000)[32-15], 28672/2);


 hOff = 0;
 vOff = 0;

 buttons = (*(volatile unsigned short *)0x04000130);
}





void game() {



  if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))){
   hOff++;
  }
  if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))){
   hOff--;
  }

  if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))){
   vOff++;
  }
  if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))){
   vOff--;
  }

  if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))){
   screenTile--;
  }
  if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))){
   screenTile++;
  }

  if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))){
   bgMap[screenTile]--;
  }
  if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))){
   bgMap[screenTile]++;
  }

  oldButtons = (*(volatile unsigned short *)0x04000130);


  if (hOff > 256){
   sbb++;
   hOff -= 256;
  }
  if (hOff < 0 && sbb > (32-15)) {
   sbb--;
   hOff+=256;
  }

  (*(volatile unsigned short*)0x400000A) = (1<<14) | (((1) & 3)<<2) | (((sbb) & 31)<<8);


  (*(volatile unsigned short *)0x04000010) = hOff * 2;
  (*(volatile unsigned short *)0x04000012) = vOff;
  (*(volatile unsigned short *)0x04000016) = vOff;
  (*(volatile unsigned short *)0x04000014) = hOff;
  DMANow(3, bgMap, &((screenblock *)0x6000000)[31], sizeof(bgMap)/2);
}
