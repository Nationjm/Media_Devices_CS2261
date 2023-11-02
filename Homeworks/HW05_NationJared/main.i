# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
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
# 6 "main.c" 2
# 1 "BubbleBobbleSpritesheet.h" 1
# 21 "BubbleBobbleSpritesheet.h"
extern const unsigned short BubbleBobbleSpritesheetTiles[16384];


extern const unsigned short BubbleBobbleSpritesheetPal[256];
# 7 "main.c" 2
# 1 "Level1Map.h" 1







extern const unsigned short Level1MapMap[1024];
# 8 "main.c" 2
# 1 "Level2Map.h" 1







extern const unsigned short Level2MapMap[1024];
# 9 "main.c" 2
# 1 "levelTiles.h" 1
# 22 "levelTiles.h"
extern const unsigned short LevelTilesTiles[16384];


extern const unsigned short LevelTilesMap[1024];


extern const unsigned short LevelTilesPal[256];
# 10 "main.c" 2
# 1 "Level1CollisionBitmap.h" 1
# 20 "Level1CollisionBitmap.h"
extern const unsigned char Level1CollisionBitmapBitmap[65536];
# 11 "main.c" 2
# 1 "Level2CollisionBitmap.h" 1
# 20 "Level2CollisionBitmap.h"
extern const unsigned char Level2CollisionBitmapBitmap[65536];
# 12 "main.c" 2


unsigned short oldButtons;
unsigned short buttons;




int state;
int game1Bool = 1;
int game2Bool = 1;
int currentState = 0;
int tempX = 0;
int enemies;
int lives;

typedef enum {LEFT, RIGHT, FLOAT} DIRECTION;

void initialize();
int main();
inline unsigned char colorAt(int, int);
void draw();
void updatePlayer();
void updateEnemy1();
void updateEnemy2();
void updateEnemy3();
void updateEnemy4();
void updateEnemy5();
void updateEnemy6();
void updateBubble();
int bubbleCollision(SPRITE *enemy);
int playerCollision(SPRITE *enemy);

OBJ_ATTR shadowOAM[128];

SPRITE player;
SPRITE enemy1;
SPRITE enemy2;
SPRITE enemy3;
SPRITE enemy4;
SPRITE enemy5;
SPRITE enemy6;
SPRITE bubble;
enemies = 6;
lives = 3;

int vOff = 2;
int hOff = 2;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        waitForVBlank();
        draw();

        switch(state) {
            case START:
                start();
                if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) || (!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
                    goToGame1();
                }

                break;
            case GAME1:
                game1(game1Bool);
                game1Bool = 0;
                if (enemies == 0) {
                    game1Bool = 1;
                    enemies = 6;
                    game2Bool = 1;
                    goToGame2();
                }
                if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
                    currentState = 1;
                    goToPause();
                } else if (enemies == 0) {
                    goToWin();
                } else if (lives == 0) {
                    goToLose();
                }
                break;
            case GAME2:
                game2(game2Bool);
                game2Bool = 0;
                if ((!(~(oldButtons) & ((1<<1))) && (~buttons & ((1<<1))))) {
                    currentState = 2;
                    goToPause();
                } else if (enemies == 0) {
                    goToWin();
                } else if (lives == 0) {
                    goToLose();
                }
                break;
            case PAUSE:
                pause();
                if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) && currentState == 1) {
                    goToGame1();
                } else if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3)))) && currentState == 2) {
                    goToGame2();
                }
                break;
            case WIN:
                win();
                if ((!(~(oldButtons) & ((1<<9))) && (~buttons & ((1<<9))))) {
                    enemies = 6;
                    lives = 3;
                    initGame1();
                    goToStart();
                }
                break;
            case LOSE:
                if ((!(~(oldButtons) & ((1<<9))) && (~buttons & ((1<<9))))) {
                    initGame1();
                    lives = 3;
                    enemies = 6;
                    goToStart();
                }
                lose();
                break;
        }
    }

    return 0;
}

inline unsigned char colorAt(int x, int y) {
    if (state == GAME1) {
        return ((unsigned char *)Level1CollisionBitmapBitmap)[((y) * (256) + (x))];
    } else if (state == GAME2) {
        return ((unsigned char *)Level2CollisionBitmapBitmap) [((y) * (256) + (x))];
    }

}

void initialize() {
    mgba_open();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (0 << 14) | (0 << 7);




    DMANow(3, BubbleBobbleSpritesheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, BubbleBobbleSpritesheetPal, ((u16 *)0x5000200), 256);

    initGame1();

    goToStart();
}

void initGame1() {
    player.width = 16;
    player.height = 16;
    player.x = 16;
    player.y = 128;
    player.numFrames = 2;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    enemy1.width = 16;
    enemy1.height = 16;
    enemy1.x = 16;
    enemy1.y = 48;
    enemy1.numFrames = 2;
    enemy1.direction = LEFT;
    enemy1.timeUntilNextFrame = 10;
    enemy1.xVel = 1;
    enemy1.yVel = 1;
    enemy1.oamIndex = 1;
    enemy1.isAnimating = 1;

    enemy2.width = 16;
    enemy2.height = 16;
    enemy2.x = 116;
    enemy2.y = 60;
    enemy2.direction = LEFT;
    enemy2.timeUntilNextFrame = 10;
    enemy2.xVel = 1;
    enemy2.yVel = 1;
    enemy2.oamIndex = 2;
    enemy2.isAnimating = 1;

    enemy3.width = 16;
    enemy3.height = 16;
    enemy3.x = 80;
    enemy3.y = 70;
    enemy3.direction = LEFT;
    enemy3.timeUntilNextFrame = 10;
    enemy3.xVel = 1;
    enemy3.yVel = 1;
    enemy3.oamIndex = 3;
    enemy3.isAnimating = 1;

    enemy4.width = 16;
    enemy4.height = 16;
    enemy4.x = 16;
    enemy4.y = 16;
    enemy4.direction = LEFT;
    enemy4.timeUntilNextFrame = 10;
    enemy4.xVel = 1;
    enemy4.yVel = 0;
    enemy4.oamIndex = 5;
    enemy4.isAnimating = 1;

    enemy5.width = 16;
    enemy5.height = 16;
    enemy5.x = 208;
    enemy5.y = 16;
    enemy5.direction = LEFT;
    enemy5.timeUntilNextFrame = 10;
    enemy5.xVel = 1;
    enemy5.yVel = 0;
    enemy5.oamIndex = 6;
    enemy5.isAnimating = 1;

    enemy6.width = 16;
    enemy6.height = 16;
    enemy6.x = 208;
    enemy6.y = 48;
    enemy6.direction = LEFT;
    enemy6.timeUntilNextFrame = 10;
    enemy6.xVel = 1;
    enemy6.yVel = 0;
    enemy6.oamIndex = 7;
    enemy6.isAnimating = 1;
}
void initGame2() {
    player.width = 16;
    player.height = 16;
    player.x = 16;
    player.y = 112;
    player.numFrames = 2;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    enemy1.width = 16;
    enemy1.height = 16;
    enemy1.x = 30;
    enemy1.y = 90;
    enemy1.numFrames = 2;
    enemy1.direction = LEFT;
    enemy1.timeUntilNextFrame = 10;
    enemy1.xVel = 1;
    enemy1.yVel = 1;
    enemy1.oamIndex = 1;
    enemy1.isAnimating = 1;

    enemy2.width = 16;
    enemy2.height = 16;
    enemy2.x = 200;
    enemy2.y = 100;
    enemy2.direction = LEFT;
    enemy2.timeUntilNextFrame = 10;
    enemy2.xVel = 1;
    enemy2.yVel = 1;
    enemy2.oamIndex = 2;
    enemy2.isAnimating = 1;

    enemy3.width = 16;
    enemy3.height = 16;
    enemy3.x = 80;
    enemy3.y = 40;
    enemy3.direction = LEFT;
    enemy3.timeUntilNextFrame = 10;
    enemy3.xVel = 1;
    enemy3.yVel = 1;
    enemy3.oamIndex = 3;
    enemy3.isAnimating = 1;

    enemy4.width = 16;
    enemy4.height = 16;
    enemy4.x = 16;
    enemy4.y = 16;
    enemy4.direction = LEFT;
    enemy4.timeUntilNextFrame = 10;
    enemy4.xVel = 1;
    enemy4.yVel = 0;
    enemy4.oamIndex = 5;
    enemy4.isAnimating = 1;

    enemy5.width = 16;
    enemy5.height = 16;
    enemy5.x = 208;
    enemy5.y = 16;
    enemy5.direction = LEFT;
    enemy5.timeUntilNextFrame = 10;
    enemy5.xVel = 1;
    enemy5.yVel = 0;
    enemy5.oamIndex = 6;
    enemy5.isAnimating = 1;

    enemy6.width = 16;
    enemy6.height = 16;
    enemy6.x = 208;
    enemy6.y = 48;
    enemy6.direction = LEFT;
    enemy6.timeUntilNextFrame = 10;
    enemy6.xVel = 1;
    enemy6.yVel = 0;
    enemy6.oamIndex = 7;
    enemy6.isAnimating = 1;
}

void updatePlayer() {
    player.isAnimating = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    if ((~(buttons) & ((1<<5))) && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
        if (player.x > 0) {
           player.x -= player.xVel;
        }
        player.direction = LEFT;
        player.isAnimating = 1;
    }
    if ((~(buttons) & ((1<<4))) && colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, bottomY)) {
        if (player.x < 240 - player.width) {
            player.x += player.xVel;
        }
        player.direction = RIGHT;
        player.isAnimating = 1;
    }

    if ((!(~(oldButtons) & ((1<<6))) && (~buttons & ((1<<6))))) {
        if (colorAt(leftX, bottomY - 23) && colorAt(rightX, bottomY - 23)) {
            if (player.y - 23 > 0) {
                player.y -= 23;
            }
        } else {
            if (player.y - 35 > 0) {
                player.y -= 35;
            }
        }

    }

    if (colorAt(leftX, bottomY + player.yVel) && colorAt(rightX, bottomY + player.yVel)) {
        player.y += player.yVel;
    }
    if (player.y > 160) {
        player.y = -16;
    }

    shadowOAM[player.oamIndex].attr0 = (0<<14) | (((player.y)) & 0xFF);
    shadowOAM[player.oamIndex].attr1 = (1<<14) | ((player.x) & 0x1FF);
    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr1 = (1<<14) | (1<<12) | ((player.x) & 0x1FF);
        shadowOAM[player.oamIndex].attr2 = ((((18) * (32) + (0))) & 0x3FF);
    } else {
        shadowOAM[player.oamIndex].attr2 = ((((18) * (32) + (0))) & 0x3FF);
    }
}

void updateEnemy1() {
    int enemy1leftX = enemy1.x;
    int enemy1rightX = enemy1.x + enemy1.width - 1;
    int enemy1topY = enemy1.y;
    int enemy1bottomY = enemy1.y + enemy1.height - 1;

    if (enemy1.isAnimating) {
        if (colorAt(enemy1leftX, enemy1bottomY) && colorAt(enemy1leftX, enemy1topY)) {
        } else {
            enemy1.xVel = -enemy1.xVel;
        }

        if (colorAt(enemy1rightX, enemy1bottomY) && colorAt(enemy1rightX, enemy1topY)) {
        } else {
            enemy1.xVel = -enemy1.xVel;
        }

        if (colorAt(enemy1leftX, enemy1bottomY) && colorAt(enemy1rightX, enemy1bottomY)) {
        } else {
            enemy1.yVel = -enemy1.yVel;
        }

        if (colorAt(enemy1leftX, enemy1topY) && colorAt(enemy1rightX, enemy1topY)) {
        } else {
            enemy1.yVel = -enemy1.yVel;
        }

        enemy1.x += enemy1.xVel;
        enemy1.y += enemy1.yVel;

        shadowOAM[enemy1.oamIndex].attr0 = (0<<14) | ((enemy1.y) & 0xFF);
        shadowOAM[enemy1.oamIndex].attr1 = (1<<14) | ((enemy1.x) & 0x1FF);
        shadowOAM[enemy1.oamIndex].attr2 = ((((2) * (32) + (0))) & 0x3FF);
    }
    if (bubbleCollision(&enemy1)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy1.oamIndex].attr0 = (2<<8);
        enemy1.isAnimating = 0;
    }

    if (playerCollision(&enemy1)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy2() {
    int enemy2leftX = enemy2.x;
    int enemy2rightX = enemy2.x + enemy2.width - 1;
    int enemy2topY = enemy2.y;
    int enemy2bottomY = enemy2.y + enemy2.height - 1;

    if (enemy2.isAnimating) {
        if (colorAt(enemy2leftX, enemy2bottomY) && colorAt(enemy2leftX, enemy2topY)) {
        } else {
            enemy2.xVel = -enemy2.xVel;
        }

        if (colorAt(enemy2rightX, enemy2bottomY) && colorAt(enemy2rightX, enemy2topY)) {
        } else {
            enemy2.xVel = -enemy2.xVel;
        }

        if (colorAt(enemy2leftX, enemy2bottomY) && colorAt(enemy2rightX, enemy2bottomY)) {
        } else {
            enemy2.yVel = -enemy2.yVel;
        }

        if (colorAt(enemy2leftX, enemy2topY) && colorAt(enemy2rightX, enemy2topY)) {
        } else {
            enemy2.yVel = -enemy2.yVel;
        }

        enemy2.x += enemy2.xVel;
        enemy2.y += enemy2.yVel;

        shadowOAM[enemy2.oamIndex].attr0 = (0<<14) | ((enemy2.y) & 0xFF);
        shadowOAM[enemy2.oamIndex].attr1 = (1<<14) | ((enemy2.x) & 0x1FF);
        shadowOAM[enemy2.oamIndex].attr2 = ((((2) * (32) + (0))) & 0x3FF);
    }
    if (bubbleCollision(&enemy2)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy2.oamIndex].attr0 = (2<<8);
        enemy2.isAnimating = 0;
    }

    if (playerCollision(&enemy2)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy3() {
    int enemy3leftX = enemy3.x;
    int enemy3rightX = enemy3.x + enemy3.width - 1;
    int enemy3topY = enemy3.y;
    int enemy3bottomY = enemy3.y + enemy3.height - 1;
    if (enemy3.isAnimating) {
        if (colorAt(enemy3leftX, enemy3bottomY) && colorAt(enemy3leftX, enemy3topY)) {
        } else {
            enemy3.xVel = -enemy3.xVel;
        }

        if (colorAt(enemy3rightX, enemy3bottomY) && colorAt(enemy3rightX, enemy3topY)) {
        } else {
            enemy3.xVel = -enemy3.xVel;
        }

        if (colorAt(enemy3leftX, enemy3bottomY) && colorAt(enemy3rightX, enemy3bottomY)) {
        } else {
            enemy3.yVel = -enemy3.yVel;
        }

        if (colorAt(enemy3leftX, enemy3topY) && colorAt(enemy3rightX, enemy3topY)) {
        } else {
            enemy3.yVel = -enemy3.yVel;
        }

        enemy3.x += enemy3.xVel;
        enemy3.y += enemy3.yVel;

        shadowOAM[enemy3.oamIndex].attr0 = (0<<14) | ((enemy3.y) & 0xFF);
        shadowOAM[enemy3.oamIndex].attr1 = (1<<14) | ((enemy3.x) & 0x1FF);
        shadowOAM[enemy3.oamIndex].attr2 = ((((2) * (32) + (0))) & 0x3FF);
    }
    if (bubbleCollision(&enemy3)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy3.oamIndex].attr0 = (2<<8);
        enemy3.isAnimating = 0;
    }

    if (playerCollision(&enemy3)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy4() {
    int enemy4leftX = enemy4.x;
    int enemy4rightX = enemy4.x + enemy4.width - 1;
    int enemy4topY = enemy4.y;
    int enemy4bottomY = enemy4.y + enemy4.height - 1;
    if (enemy4.isAnimating) {
        if (colorAt(enemy4leftX, enemy4bottomY) && colorAt(enemy4leftX, enemy4topY)) {
        } else {
            enemy4.xVel = -enemy4.xVel;
        }

        if (colorAt(enemy4rightX, enemy4bottomY) && colorAt(enemy4rightX, enemy4topY)) {
        } else {
            enemy4.xVel = -enemy4.xVel;
        }
        enemy4.x += enemy4.xVel;

        shadowOAM[enemy4.oamIndex].attr0 = (0<<14) | ((enemy4.y) & 0xFF);
        shadowOAM[enemy4.oamIndex].attr1 = (1<<14) | ((enemy4.x) & 0x1FF);
        shadowOAM[enemy4.oamIndex].attr2 = ((((8) * (32) + (0))) & 0x3FF);
    }

    if (bubbleCollision(&enemy4)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy4.oamIndex].attr0 = (2<<8);
        enemy4.isAnimating = 0;
    }

    if (playerCollision(&enemy4)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy5() {
    int enemy5leftX = enemy5.x;
    int enemy5rightX = enemy5.x + enemy5.width - 1;
    int enemy5topY = enemy5.y;
    int enemy5bottomY = enemy5.y + enemy5.height - 1;

    if (enemy5.isAnimating) {
        if (colorAt(enemy5leftX, enemy5bottomY) && colorAt(enemy5leftX, enemy5topY)) {
        } else {
            enemy5.xVel = -enemy5.xVel;
        }

        if (colorAt(enemy5rightX, enemy5bottomY) && colorAt(enemy5rightX, enemy5topY)) {
        } else {
            enemy5.xVel = -enemy5.xVel;
        }
        enemy5.x += enemy5.xVel;

        shadowOAM[enemy5.oamIndex].attr0 = (0<<14) | ((enemy5.y) & 0xFF);
        shadowOAM[enemy5.oamIndex].attr1 = (1<<14) | ((enemy5.x) & 0x1FF);
        shadowOAM[enemy5.oamIndex].attr2 = ((((8) * (32) + (0))) & 0x3FF);
    }
    if (bubbleCollision(&enemy5)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy5.oamIndex].attr0 = (2<<8);
        enemy5.isAnimating = 0;
    }

    if (playerCollision(&enemy5)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy6() {
    int enemy6leftX = enemy6.x;
    int enemy6rightX = enemy6.x + enemy6.width - 1;
    int enemy6topY = enemy6.y;
    int enemy6bottomY = enemy6.y + enemy6.height - 1;
    if (enemy6.isAnimating) {
        if (colorAt(enemy6leftX, enemy6bottomY) && colorAt(enemy6leftX, enemy6topY)) {
        } else {
            enemy6.xVel = -enemy6.xVel;
        }

        if (colorAt(enemy6rightX, enemy6bottomY) && colorAt(enemy6rightX, enemy6topY)) {
        } else {
            enemy6.xVel = -enemy6.xVel;
        }
        enemy6.x += enemy6.xVel;

        shadowOAM[enemy6.oamIndex].attr0 = (0<<14) | ((enemy6.y) & 0xFF);
        shadowOAM[enemy6.oamIndex].attr1 = (1<<14) | ((enemy6.x) & 0x1FF);
        shadowOAM[enemy6.oamIndex].attr2 = ((((8) * (32) + (0))) & 0x3FF);
    }

    if (bubbleCollision(&enemy6)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy6.oamIndex].attr0 = (2<<8);
        enemy6.isAnimating = 0;
    }

    if (playerCollision(&enemy6)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateBubble() {
    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
        bubble.x = player.x;
        tempX = bubble.x;
        bubble.y = player.y;
        bubble.width = 16;
        bubble.height = 16;
        bubble.xVel = 1;
        bubble.yVel = 1;
        bubble.direction = player.direction;
        bubble.oamIndex = 4;
        bubble.isAnimating = 1;
    }

    if (bubble.isAnimating) {
        if (bubble.direction == LEFT) {
            bubble.x -= bubble.xVel;
            if (bubble.x < tempX - 30 | bubble.x < -16) {
                bubble.isAnimating = 0;
            }
        } else {
            bubble.x += bubble.xVel;
            if (bubble.x > tempX + 46 | bubble.x > 240) {
                bubble.isAnimating = 0;
            }
        }
        shadowOAM[bubble.oamIndex].attr0 = (0<<14) | ((bubble.y) & 0xFF);
        shadowOAM[bubble.oamIndex].attr1 = (1<<14) | ((bubble.x) & 0x1FF);
        shadowOAM[bubble.oamIndex].attr2 = ((((24) * (32) + (12))) & 0x3FF);
    } else {
        shadowOAM[bubble.oamIndex].attr0 = (2<<8);
    }
}

void draw() {
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

int bubbleCollision(SPRITE *enemy) {
    if (bubble.isAnimating & enemy->isAnimating) {
        return collision(enemy->x, enemy->y, enemy->width, enemy->height, bubble.x, bubble.y, bubble.width, bubble.height);
    } else {
        return 0;
    }
}

int playerCollision(SPRITE *enemy) {
    if (enemy->isAnimating) {
        return collision(enemy->x, enemy->y, enemy->width, enemy->height, player.x, player.y, player.width, player.height);
    } else {
        return 0;
    }
}
