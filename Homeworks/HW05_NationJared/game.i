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


void goToStart();
void goToGame1();
void goToGame2();
void goToPause();
void goToWin();
void goToLose();
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
# 1 "Level1Map.h" 1







extern const unsigned short Level1MapMap[1024];
# 5 "game.c" 2
# 1 "Level2Map.h" 1







extern const unsigned short Level2MapMap[1024];
# 6 "game.c" 2
# 1 "levelTiles.h" 1
# 22 "levelTiles.h"
extern const unsigned short LevelTilesTiles[16384];


extern const unsigned short LevelTilesMap[1024];


extern const unsigned short LevelTilesPal[256];
# 7 "game.c" 2


extern state;


void start() {

}

void game1() {
    DMANow(3, LevelTilesTiles, &((CB*) 0x6000000)[0], 32768 / 2);
    DMANow(3, Level1MapMap, &((SB*) 0x6000000)[28], (2048) / 2);
    DMANow(3, LevelTilesPal, ((unsigned short *)0x5000000), 256);


}

void game2() {
    DMANow(3, Level2MapMap, &((SB*) 0x6000000)[28], (2048));
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
