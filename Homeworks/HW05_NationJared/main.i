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




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
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
# 21 "Level1CollisionBitmap.h"
extern const unsigned short Level1CollisionBitmapBitmap[16384];


extern const unsigned short Level1CollisionBitmapPal[256];
# 11 "main.c" 2
# 1 "Level2CollisionBitmap.h" 1
# 21 "Level2CollisionBitmap.h"
extern const unsigned short Level2CollisionBitmapTiles[32768];


extern const unsigned short Level2CollisionBitmapPal[256];
# 12 "main.c" 2


unsigned short oldButtons;
unsigned short buttons;




int state;

typedef enum {LEFT, RIGHT} DIRECTION;

void initialize();
int main();
inline unsigned char colorAt(int, int, const unsigned short);

OBJ_ATTR shadowOAM[128];

SPRITE player;

int vOff = 2;
int hOff = 2;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        waitForVBlank();
        update();
        draw();
        mgba_printf("%d", state);

        switch(state) {
            case START:
                start();
                if ((!(~(oldButtons) & ((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3)))) || (!(~(oldButtons) & ((1<<0))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<0))))) {
                    goToGame1();
                }
                break;
            case GAME1:
                game1();
                if ((!(~(oldButtons) & ((1<<2))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<2))))) {
                    goToGame2();
                }
                break;
            case GAME2:
                game2();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }

    return 0;
}

inline unsigned char colorAt(int x, int y, const unsigned short collisionMap) {
    return ((unsigned char *)collisionMap)[((y) * (256) + (x))];
}

void initialize() {
    mgba_open();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (0 << 14) | (0 << 7);




    DMANow(3, BubbleBobbleSpritesheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, BubbleBobbleSpritesheetPal, ((u16 *)0x5000200), 256);


    player.width = 16;
    player.height = 16;
    player.x = 100;
    player.y = 0;
    player.numFrames = 2;
    player.direction = LEFT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    goToStart();
}

void update() {
    player.isAnimating = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && colorAt(leftX, topY, Level1CollisionBitmapBitmap) && colorAt(leftX, bottomY, Level1CollisionBitmapBitmap)) {
        if (player.x > 0) {
            player.x -= player.xVel;
        }
        player.direction = LEFT;
        player.isAnimating = 1;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && colorAt(rightX, topY, Level1CollisionBitmapBitmap) && colorAt(rightX, bottomY, Level1CollisionBitmapBitmap)) {
        if (player.x < 240 - player.width) {
            player.x += player.xVel;
        }
        player.direction = RIGHT;
        player.isAnimating = 1;
    }






    player.y += player.yVel;

    shadowOAM[player.oamIndex].attr0 = (0<<14) | (((player.y)) & 0xFF);
    shadowOAM[player.oamIndex].attr1 = (1<<14) | ((player.x) & 0x1FF);
    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr2 = ((((18) * (32) + (2))) & 0x3FF);
    } else {
        shadowOAM[player.oamIndex].attr2 = ((((18) * (32) + (0))) & 0x3FF);
    }

}

void draw() {
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
