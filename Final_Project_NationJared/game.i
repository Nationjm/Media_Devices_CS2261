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






extern volatile unsigned short* videoBuffer;
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
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
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
# 64 "sprites.h"
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
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "game.h" 1



void start();
void instructions();
void kaido1();
void pause();
void win();
void lose();


void goToStart();
void goToInstructions();
void goToKaido1();
void goToPause();
void goToWin();
void goToLose();


void luffyUpdate();
void initLuffy();
void luffyPunching();
void luffyJumping();

void initKaido();
void kaidoUpdate();


typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int yVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int punching;
    int punchingTime;
    int jumping;
    int jumpingTime;
    unsigned char oamIndex;
} LUFFY;
LUFFY luffy;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int attacking;
    int attackingTime;
    unsigned char oamIndex;
} KAIDO;
KAIDO kaido;
# 6 "game.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 7 "game.c" 2
# 1 "luffyStartScreen.h" 1
# 21 "luffyStartScreen.h"
extern const unsigned short luffyStartScreenBitmap[19200];


extern const unsigned short luffyStartScreenPal[256];
# 8 "game.c" 2
# 1 "LuffyWinScreen.h" 1
# 21 "LuffyWinScreen.h"
extern const unsigned short LuffyWinScreenBitmap[19200];


extern const unsigned short LuffyWinScreenPal[256];
# 9 "game.c" 2
# 1 "wanoInstructions.h" 1
# 21 "wanoInstructions.h"
extern const unsigned short wanoInstructionsBitmap[19200];


extern const unsigned short wanoInstructionsPal[256];
# 10 "game.c" 2

# 1 "RooftopGroundBackground.h" 1







extern const unsigned short RooftopGroundBackgroundMap[1024];
# 12 "game.c" 2
# 1 "Rooftop_Ground_TilesetBitmap.h" 1
# 21 "Rooftop_Ground_TilesetBitmap.h"
extern const unsigned short Rooftop_Ground_TilesetBitmapTiles[9600];


extern const unsigned short Rooftop_Ground_TilesetBitmapPal[256];
# 13 "game.c" 2
# 1 "LuffyandKaidoSprites.h" 1
# 21 "LuffyandKaidoSprites.h"
extern const unsigned short LuffyandKaidoSpritesTiles[16384];


extern const unsigned short LuffyandKaidoSpritesPal[256];
# 14 "game.c" 2


extern unsigned short state;
enum {
    START,
    INSTRUCTIONS,
    KAIDO1,
    KAIDO2,
    BIGMOM1,
    BIGMOM2,
    PAUSE,
    WIN,
    LOSE
} STATE;


enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;


OBJ_ATTR shadowOAM[128];
# 55 "game.c"
void start() {
    DMANow(3, luffyStartScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(luffyStartScreenBitmap);
    flipPage();
}

void instructions() {
    DMANow(3, wanoInstructionsPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(wanoInstructionsBitmap);
    flipPage();
}

void kaido1() {
    hideSprites();
    luffyUpdate();
    kaidoUpdate();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &((CB*) 0x06000000)[0], 19200 / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, RooftopGroundBackgroundMap, &((SB*) 0x06000000)[28], (2048) / 2);
    DMANow(3, LuffyandKaidoSpritesPal, ((u16*) 0x5000200), 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &((CB*) 0x06000000)[4], 32768 / 2);

}

void kaido2() {
    hideSprites();
    luffyUpdate();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &((CB*) 0x06000000)[0], 19200 / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, RooftopGroundBackgroundMap, &((SB*) 0x06000000)[28], (2048) / 2);
    DMANow(3, LuffyandKaidoSpritesPal, ((u16*) 0x5000200), 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &((CB*) 0x06000000)[4], 32768 / 2);
}

void bigMom1() {
    hideSprites();
}

void bigMom2() {
    hideSprites();
}

void pause() {
    flipPage();
}

void win() {
    DMANow(3, LuffyWinScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(LuffyWinScreenBitmap);
    flipPage();
}

void lose() {
    flipPage();
}



void goToStart() {
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToKaido1() {
    state = KAIDO1;
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8);
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    initLuffy();
    initKaido();
}

void goToKaido2() {
    state = KAIDO2;
}

void goToBigMom1() {
    state = BIGMOM1;
}

void goToBigMom2() {
    state = BIGMOM2;
}

void goToPause() {
    state = PAUSE;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}

void goToWin() {
    state = WIN;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}

void goToLose() {
    state = LOSE;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}




void initLuffy() {
    luffy.x = 200;
    luffy.y = 110;
    luffy.xVel = 2;
    luffy.direction = LEFT;
    luffy.frame = 0;
    luffy.height = 44;
    luffy.width = 32;
    luffy.isMoving = 0;
    luffy.yVel = 2;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
    luffy.punching = 0;
    luffy.punchingTime = 22;
    luffy.jumping = 0;
    luffy.jumpingTime = 30;
}

void luffyUpdate() {
    luffy.isMoving = 0;
    if ((~(buttons) & ((1 << 5))) && luffy.punching == 0) {
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if ((~(buttons) & ((1 << 4))) && luffy.punching == 0) {
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }

    if (luffy.punching == 0 && luffy.jumping == 0) {

        shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);

        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = (((0) * (32) + ((luffy.frame * 4) + 16)) & 0x3FF);
        } else if (luffy.timeUntilNextFrame < 0) {
            luffy.timeUntilNextFrame = 10;
        }
    }

    if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0))))) {
        luffy.punching = 1;
    }

    if (luffy.punching) {
        luffyPunching();
    }

    if ((!(~(oldButtons) & ((1 << 6))) && (~(buttons) & ((1 << 6))))) {
        luffy.jumping = 1;
    }

    if (luffy.jumping) {
        luffyJumping();
    }

    luffy.timeUntilNextFrame--;
}

void luffyPunching() {
    shadowOAM[luffy.oamIndex].attr0 = (0 << 14) | ((luffy.y) & 0xFF);
    shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
    shadowOAM[luffy.oamIndex].attr2 = (((7) * (32) + (3)) & 0x3FF);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        if (luffy.punchingTime < 20) {
            shadowOAM[luffy.oamIndex + 1].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 1].attr1 = (0 << 14) | ((luffy.x + 32 + luffy.width) & 0x1FF);
            shadowOAM[luffy.oamIndex + 1].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 2].attr1 = (0 << 14) | ((luffy.x + 36 + luffy.width) & 0x1FF);
            shadowOAM[luffy.oamIndex + 2].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 3].attr1 = (0 << 14) | ((luffy.x + 40 + luffy.width) & 0x1FF);
            shadowOAM[luffy.oamIndex + 3].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 4].attr1 = (0 << 14) | ((luffy.x + 44 + luffy.width) & 0x1FF);
            shadowOAM[luffy.oamIndex + 4].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 5].attr1 = (0 << 14) | ((luffy.x + 48 + luffy.width) & 0x1FF);
            shadowOAM[luffy.oamIndex + 5].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 6].attr1 = (1 << 14) | ((luffy.x + 52 + luffy.width) & 0x1FF) | (1 << 12);
            shadowOAM[luffy.oamIndex + 6].attr2 = (((9) * (32) + (0)) & 0x3FF);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    } else {
        if (luffy.punchingTime < 20) {
        shadowOAM[luffy.oamIndex + 1].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
        shadowOAM[luffy.oamIndex + 1].attr1 = (0 << 14) | ((luffy.x - 8) & 0x1FF);
        shadowOAM[luffy.oamIndex + 1].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 2].attr1 = (0 << 14) | ((luffy.x - 12) & 0x1FF);
            shadowOAM[luffy.oamIndex + 2].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 3].attr1 = (0 << 14) | ((luffy.x - 16) & 0x1FF);
            shadowOAM[luffy.oamIndex + 3].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 4].attr1 = (0 << 14) | ((luffy.x - 20) & 0x1FF);
            shadowOAM[luffy.oamIndex + 4].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 5].attr1 = (0 << 14) | ((luffy.x - 24) & 0x1FF);
            shadowOAM[luffy.oamIndex + 5].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 6].attr1 = (1 << 14) | ((luffy.x - 36) & 0x1FF);
            shadowOAM[luffy.oamIndex + 6].attr2 = (((9) * (32) + (0)) & 0x3FF);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    }

    luffy.punchingTime--;
}

void luffyJumping() {
    shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
    shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
    shadowOAM[luffy.oamIndex].attr2 = (((8) * (32) + (12)) & 0x3FF);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
    }

    if (luffy.jumpingTime < 0) {
        luffy.jumpingTime = 30;
        luffy.jumping = 0;
    }

    luffy.jumpingTime--;
}


void initKaido() {
    kaido.x = 0;
    kaido.y = 110;
    kaido.direction = RIGHT;
    kaido.frame = 0;
    kaido.height = 0;
    kaido.width = 0;
    kaido.isMoving = 0;
    kaido.oamIndex = 7;
    kaido.numFrames = 0;
    kaido.xVel = 1;
    kaido.attacking = 0;
    kaido.attackingTime = 20;
    kaido.timeUntilNextFrame = 10;

}

void kaidoUpdate() {
    shadowOAM[kaido.oamIndex].attr0 = (0 << 14) | ((kaido.y) & 0xFF);
    shadowOAM[kaido.oamIndex].attr1 = (3 << 14) | ((kaido.x) & 0x1FF) | (0 << 9);
    shadowOAM[kaido.oamIndex].attr2 = (((15) * (32) + (0)) & 0x3FF) | (((1) & 0xF) << 12);
}
