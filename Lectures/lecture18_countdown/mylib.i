# 1 "mylib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mylib.c"
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
# 2 "mylib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


OBJ_ATTR shadowOAM[128];



void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    ((DMArec *)0x40000B0)[channel].cnt = 0;
    ((DMArec *)0x40000B0)[channel].src = src;
    ((DMArec *)0x40000B0)[channel].dst = dst;
    ((DMArec *)0x40000B0)[channel].cnt = cnt | (1 << 31);
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}
