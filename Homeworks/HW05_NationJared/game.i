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
void game1(int);
void game2(int);
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
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 99 "gba.h"
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
# 1 "BubbleBobbleTitle.h" 1
# 22 "BubbleBobbleTitle.h"
extern const unsigned short BubbleBobbleTitleTiles[4176];


extern const unsigned short BubbleBobbleTitleMap[1024];


extern const unsigned short BubbleBobbleTitlePal[256];
# 8 "game.c" 2
# 1 "WinState.h" 1
# 22 "WinState.h"
extern const unsigned short WinStateTiles[192];


extern const unsigned short WinStateMap[1024];


extern const unsigned short WinStatePal[256];
# 9 "game.c" 2
# 1 "LoseState.h" 1
# 22 "LoseState.h"
extern const unsigned short LoseStateTiles[128];


extern const unsigned short LoseStateMap[1024];


extern const unsigned short LoseStatePal[256];
# 10 "game.c" 2


extern state;


void start() {
    DMANow(3, BubbleBobbleTitlePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, BubbleBobbleTitleTiles, &((CB*) 0x6000000)[0], 8352 / 2);
    DMANow(3, BubbleBobbleTitleMap, &((SB*) 0x6000000)[28], 2048 / 2);
}

void game1(int bool) {
    DMANow(3, LevelTilesTiles, &((CB*) 0x6000000)[0], 32768 / 2);
    DMANow(3, Level1MapMap, &((SB*) 0x6000000)[28], (2048) / 2);
    DMANow(3, LevelTilesPal, ((unsigned short *)0x5000000), 256);
    updatePlayer();
    updateEnemy1();
    updateEnemy2();
    updateEnemy3();
    updateEnemy4();
    updateEnemy5();
    updateEnemy6();
    updateBubble();
}

void game2(int game2Bool) {
    if (game2Bool == 1) {
        initGame2();
    }
    DMANow(3, Level2MapMap, &((SB*) 0x6000000)[28], (2048));
    updatePlayer();
    updateEnemy1();
    updateEnemy2();
    updateEnemy3();
    updateEnemy4();
    updateEnemy5();
    updateEnemy6();
    updateBubble();
}

void pause() {

}

void win() {
    hideSprites();
    DMANow(3, WinStatePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, WinStateTiles, &((CB*) 0x6000000)[0], 384 / 2);
    DMANow(3, WinStateMap, &((SB*) 0x6000000)[28], 2048 / 2);
}

void lose() {
    hideSprites();
    DMANow(3, LoseStatePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, LoseStateTiles, &((CB*) 0x6000000)[0], 256 / 2);
    DMANow(3, LoseStateMap, &((SB*) 0x6000000)[28], 2048 / 2);
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
