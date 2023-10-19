# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "game.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 3 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int framesPassed;
    int direction;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
    u8 oamIndex;
} SPRITE;


typedef struct {
 u16 tileimg[8192];
} charblock;
# 4 "game.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE link;


void initGame();
void updateGame();
void drawGame();
void initKitty();
void updateKitty();
void drawKitty();
void initStatue();
void drawStatue();
void initPaw();
void drawPaw();
# 5 "game.c" 2


OBJ_ATTR shadowOAM[128];
SPRITE kitty;
int collided;
int kittyPalette;
SPRITE statue;
SPRITE paw;
typedef enum {RIGHT, LEFT} DIRECTION;


void initGame() {
    initKitty();
    initStatue();
    initPaw();
}


void updateGame() {
 updateKitty();
}


void drawGame() {
    drawKitty();
    drawStatue();
    drawPaw();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}


void initKitty() {
    kitty.width = 32;
    kitty.height = 16;
    kitty.xVel = 1;
    kitty.yVel = 1;
    kitty.direction = RIGHT;




    kitty.x = 240 / 2 - kitty.width / 2;
    kitty.y = 95;

    collided = 0;
    kittyPalette = 0;
}


void initStatue() {
    statue.width = 32;
    statue.height = 32;
    statue.x = 104;
    statue.y = 36;
    statue.oamIndex = 2;
}


void initPaw() {
    paw.width = 32;
    paw.height = 32;
    paw.x = 200;
    paw.y = 140;
    paw.oamIndex = 3;
}


void updateKitty() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (kitty.y > 0) {
            kitty.y -= kitty.yVel;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (kitty.y + kitty.height < 160) {
            kitty.y += kitty.yVel;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (kitty.x > 0) {
            kitty.x -= kitty.xVel;
        }


    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (kitty.x + kitty.width < 240) {
            kitty.x += kitty.xVel;
        }


    }

    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, paw.x, paw.y, paw.width, paw.height)) collided = 1;
    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, statue.x, statue.y, statue.width, statue.height)) collided = 0;
    if (collided) kitty.framesPassed++;
}


void drawKitty() {



    if (collided) {
        if (kitty.framesPassed % 30 == 0) {
            kittyPalette = (kittyPalette+1) % 3;
        }
    }



}


void drawStatue() {


}

void drawPaw() {


}
