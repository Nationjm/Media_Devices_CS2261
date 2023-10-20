# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1

enum {
    START,
    PAUSE,
    GAME1,
    GAME2,
    WIN,
    LOSE
} STATE;


void start();
void game1();
void game2();
void pause();
void win();
void lose();
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "game.c" 2


extern state;


void start() {

}

void game1() {

}

void game2() {

}

void pause() {

}

void win() {

}

void lose() {

}


void goToStart() {
    state = START;
}

void goToPause() {
    state = PAUSE;
}

void goToGame1() {
    state = GAME1;
}

void goToGame2() {
    state = GAME2;
}

void goToWin() {
    state = WIN;
}

void goToLose() {
    state = LOSE;
}
