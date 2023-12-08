#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "mode4.h"
#include "luffyStartScreen.h"
#include "LuffyWinScreen.h"
#include "wanoInstructions.h"
#include "sprites.h"
#include "RooftopGroundBackground.h"
#include "Rooftop_Ground_TilesetBitmap.h"
#include "LuffyandKaidoSprites.h"
#include "digitalSound.h"
#include "BinksBrew.h"
#include <stdio.h>
#include "loseScreen.h"
#include "DrumsOfLiberation.h"
#include "PauseScreen.h"
#include "LuffyPunchSound.h"
#include "Clouds.h"
#include "MovingMountains.h"
#include "betweenFightScreen.h"

// State Variable from main and enum
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
    LOSE,
    BETWEENFIGHT
} STATE;

// Direction enum
enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;

// Kaido Direction enum
enum {
    UP,
    DOWN
} KAIDODIRECTION;


OBJ_ATTR shadowOAM[128]; // Set up the shadowOAM

int luffyLives;
int kaidoHealth;
int luffyPunched;
int kaidoWordOAMIndex = 19;
int rSeed;
int punchDamage = 1;
int gearFifth = 0;
int groundChanging = 0;
int groundFrames = 0;
int tileTemp = 0;
int luffyLightning = 0;
int timeUntilNextFireball = 20;

// Background offset variables
int offVariable = 0;
int vOff;
int hOff;

typedef struct {
    unsigned short fill0[3];
    short a;
    unsigned short fill1[3];
    short b;
    unsigned short fill2[3];
    short c;
    unsigned short fill3[3];
    short d;
} ALIGN(4) OBJ_AFFINE;

OBJ_AFFINE *SHADOW_OAM_AFF = (OBJ_AFFINE*)shadowOAM;



// State Prototypes
void start() {
    DMANow(3, luffyStartScreenPal, BG_PALETTE, luffyStartScreenPalLen / 2);
    drawFullscreenImage4(luffyStartScreenBitmap);
    flipPage();
}

void instructions() {
    DMANow(3, wanoInstructionsPal, BG_PALETTE, wanoInstructionsPalLen / 2);
    drawFullscreenImage4(wanoInstructionsBitmap);
    flipPage();
    rSeed++;
}

void kaido1() {
    hideSprites();
    luffyUpdate();
    kaidoUpdate();
    fireballUpdate();
    DMANow(3, shadowOAM, OAM, 512);
    if (offVariable % 2 == 0) {
        hOff++;
    }
    offVariable++;
    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff * 2;
}

void betweenFight() {
    DMANow(3, betweenFightScreenPal, BG_PALETTE, betweenFightScreenPalLen / 2);
    drawFullscreenImage4(betweenFightScreenBitmap);
    flipPage();
}

void kaido2() {
    hideSprites();
    luffyUpdate2();
    kaidoUpdate2();
    lightningUpdate();
    fireballUpdate2();
    DMANow(3, shadowOAM, OAM, 512);
    if (offVariable % 2 == 0) {
        hOff++;
    }
    offVariable++;
    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff * 2;
    mgba_printf("%d", lightning[0].direction );
}

void bigMom1() {
    hideSprites();
}

void bigMom2() {
    hideSprites();
}

void pause() {
    DMANow(3, PauseScreenPal, BG_PALETTE, PauseScreenPalLen / 2);
    drawFullscreenImage4(PauseScreenBitmap);
    flipPage();
}

void win() {
    DMANow(3, LuffyWinScreenPal, BG_PALETTE, LuffyWinScreenPalLen / 2);
    drawFullscreenImage4(LuffyWinScreenBitmap);
    flipPage();
}

void lose() {
    DMANow(3, loseScreenPal, BG_PALETTE, loseScreenPalLen / 2);
    drawFullscreenImage4(loseScreenBitmap);
    flipPage();
}


// State Transition Prototypes; Also handles mode changes
void goToStart() {
    punchDamage = 1;
    gearFifth = 0;
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToKaido1() {
    state = KAIDO1;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE | BG_ENABLE(1) | BG_ENABLE(2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_WIDE;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_WIDE;
    DMANow(3, shadowOAM, OAM, 512);
    srand(rSeed);
    DMANow(3, LuffyandKaidoSpritesPal, SPRITE_PALETTE, 256);

    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
    DMANow(3, MovingMountainsMap, &SCREENBLOCK[16], MovingMountainsMapLen / 2);
    DMANow(3, CloudsMap, &SCREENBLOCK[8], CloudsMapLen / 2);
}

void goToBetweenFight() {
    state = BETWEENFIGHT;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}

void goToKaido2() {
    state = KAIDO2;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE | BG_ENABLE(1) | BG_ENABLE(2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_WIDE;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_WIDE;
    DMANow(3, shadowOAM, OAM, 512);
    srand(rSeed);   

    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
    DMANow(3, MovingMountainsMap, &SCREENBLOCK[16], MovingMountainsMapLen / 2);
    DMANow(3, CloudsMap, &SCREENBLOCK[8], CloudsMapLen / 2);
}

void goToBigMom1() {
    state = BIGMOM1;
}

void goToBigMom2() {
    state = BIGMOM2;
}

void goToPause() {
    state = PAUSE;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}

void goToWin() {
    state = WIN;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    playSong(BinksBrew_data, BinksBrew_length, WIN);
}

void goToLose() {
    state = LOSE;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}


// Luffy Functions

void initLuffy() {
    luffy.x = 200;
    luffy.y = 110;
    luffy.xVel = 2;
    luffy.direction = LEFT;
    luffy.frame = 0;
    luffy.height = 40;
    luffy.width = 32;
    luffy.isMoving = 0;
    luffy.yVel = 1;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
    luffy.punching = 0;
    luffy.punchingTime = 22;
    luffy.jumping = 0;
    luffy.jumpingTime = 85;
    luffy.lightning = 0;

    luffyLives = 3;
    luffyPunched = 0;

    luffyFist.x = luffy.x;
    luffyFist.y = luffy.y + 16;
    luffyFist.height = 8;
    luffyFist.width = 8;
}

void luffyUpdate() {
    luffy.isMoving = 0;
    luffyFist.x = luffy.x;
    if (BUTTON_HELD(BUTTON_LEFT) && luffy.punching == 0) { // Handle Luffy running left
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && luffy.punching == 0) { // Handle Luffy running right
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }
    
    if (luffy.punching == 0 && luffy.jumping == 0) { // Handle all animation if punching animation is not happening
        // Set up luffy sprite
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);

        if (luffy.direction == RIGHT) { // Handle flipping the sprite if going right
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) { // animate still frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) { // animate motion frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID((luffy.frame * 4) + 16, 0);
        } else if (luffy.timeUntilNextFrame < 0) { // turn timeUntilNextFrame back to 10 if it goes below 0
            luffy.timeUntilNextFrame = 10;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) && luffy.jumping != 1) { // Set Luffy's punching variable to 1 when A is pressed
        luffyPunched = 1;
        luffy.punching = 1;
    }

    if (luffy.punching) { // Call Luffy's punching function
        luffyPunching();
    }

    if (BUTTON_PRESSED(BUTTON_UP)) { // Set Luffy's jumping variable to 1 when A is pressed
        luffy.jumping = 1;
        luffy.punching = 0;
    }

    if (luffy.jumping) { // Call Luffy's jumping function
        luffyJumping();
    }

    if (BUTTON_PRESSED(BUTTON_DOWN) && luffy.jumping != 1 && gearFifth == 1 && groundChanging == 0) {
        groundChanging = 1;
        groundFrames = 45;
        tileTemp = (luffy.x / 8) - 2;
    }

    if (groundChanging == 1 && groundFrames > 0) {
        groundFrames--;
        groundChange();
    }

    // Display Luffy Life Hats 
    for (int i = 0; i < luffyLives; i++) {
        shadowOAM[35 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y - 10);
        shadowOAM[35 + i].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 2 + (10 * i));
        shadowOAM[35 + i].attr2 = ATTR2_TILEID(14, 31);
    }

    luffy.timeUntilNextFrame--;
}

void luffyPunching() { // Handle animating Luffy while his punching variable is set to 1
    shadowOAM[luffy.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y);
    shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
    shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(3, 7);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        if (luffy.punchingTime < 20) {
            shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 32 + luffy.width);
            luffyFist.x = luffy.x + 32 + luffy.width;
            shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 36 + luffy.width);
            luffyFist.x = luffy.x + 36 + luffy.width;
            shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 40 + luffy.width);
            luffyFist.x = luffy.x + 40 + luffy.width;
            shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 44 + luffy.width);
            luffyFist.x = luffy.x + 44 + luffy.width;
            shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 5].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 48 + luffy.width);
            luffyFist.x = luffy.x + 48 + luffy.width;
            shadowOAM[luffy.oamIndex + 5].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 6].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x + 52 + luffy.width) | ATTR1_HFLIP;
            luffyFist.x = luffy.x + 56 + luffy.width;
            shadowOAM[luffy.oamIndex + 6].attr2 = ATTR2_TILEID(0, 9);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    } else {
        if (luffy.punchingTime < 20) {
        shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
        shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 8);
        shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 12);
            luffyFist.x = luffy.x - 12;
            shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 16);
            luffyFist.x = luffy.x - 16;
            shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 20);
            luffyFist.x = luffy.x - 20;
            shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 5].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 24);
            luffyFist.x = luffy.x - 24;
            shadowOAM[luffy.oamIndex + 5].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 6].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x - 36);
            luffyFist.x = luffy.x - 28;
            shadowOAM[luffy.oamIndex + 6].attr2 = ATTR2_TILEID(0, 9);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }  
    }

    if (punchCollision() & (luffyPunched == 1)) {
        luffyPunched = 0;
        playSoundEffect(LuffyPunchSound_data, LuffyPunchSound_length);
        kaidoHealth -= punchDamage;
    }

    if (kaidoHealth <= 0) {
        goToBetweenFight();
    }
  
    luffy.punchingTime--;
}

void luffyJumping() {
    shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
    shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
    }

    if (luffy.jumpingTime < 85 && luffy.jumpingTime > 70) {
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(12, 8);
        luffy.y -= luffy.yVel * 2;
    }
    if (luffy.jumpingTime < 70 && luffy.jumpingTime > 35) {
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(16, 8);
        luffy.y -= luffy.yVel;
    }
    if (luffy.jumpingTime < 35 && luffy.jumpingTime > 0) {
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(24, 8);
        if (luffy.y < 110) {
            luffy.y += luffy.yVel * 2;
        }

    }

    if (luffy.jumpingTime < 0) {
        luffy.jumpingTime = 85;
        luffy.jumping = 0;
        luffy.timeUntilNextFrame = 1;
    }

    luffy.jumpingTime--;
}

void gearFive() {
    SPRITE_PALETTE[8] = RGB(31, 31, 31);
    SPRITE_PALETTE[12] = RGB(31, 31, 31);
    punchDamage = 2;
    gearFifth = 1;
}

void groundChange() {
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 14, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 15, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 16, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 17, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 18, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 19, 32)] = TILEMAP_ENTRY_TILEID(5);
    SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 20, 32)] = TILEMAP_ENTRY_TILEID(5);
    if (groundFrames == 0) {
        groundChanging = 0;
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 14, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 15, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 16, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 17, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 18, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 19, 32)] = TILEMAP_ENTRY_TILEID(0);
        SCREENBLOCK[28].tilemap[OFFSET(tileTemp, 20, 32)] = TILEMAP_ENTRY_TILEID(0);
    }
}

// Kaido Functions
void initKaido() {
    kaido.x = -25;
    kaido.y = 100;
    kaido.frame = 0;
    kaido.height = 24;
    kaido.width = 58;
    kaido.isMoving = 0;
    kaido.oamIndex = 7;
    kaido.numFrames = 2;
    kaido.xVel = 1;
    kaido.attacking = 0;
    kaido.attackingTime = 20;
    kaido.timeUntilNextFrame = 30;
    kaido.direction = UP;

    kaidoHealth = 10;

    // Initialize fireballs
    fireball.x = kaido.x + (kaido.width * 2) - 25;
    fireball.y = kaido.y + 25;
    fireball.width = 32;
    fireball.height = 16;
    fireball.oamIndex = 8;
    fireball.xVel = 1;
    fireball.timeUntilNextFrame = 10;
    fireball.frame = 0;
    fireball.numFrames = 2;
    fireball.timeUntilNextShot = 20;
}

void kaidoUpdate() {
    // Double Affine Sprite to make him larger
    SHADOW_OAM_AFF[0].d = 1 << 7;
    SHADOW_OAM_AFF[0].a = 1 << 7;
    shadowOAM[kaido.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(kaido.y) | ATTR0_DOUBLEAFFINE;
    shadowOAM[kaido.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(kaido.x);
    shadowOAM[kaido.oamIndex].attr2 = ATTR2_TILEID(kaido.frame * 8, 16) | ATTR2_PALROW(1);
    if (kaido.timeUntilNextFrame == 0) {
        kaido.timeUntilNextFrame = 30;
        kaido.frame = (kaido.frame + 1) % kaido.numFrames;
    } else if (kaido.timeUntilNextFrame < 0) {
        kaido.timeUntilNextFrame = 30;
    }
    kaido.timeUntilNextFrame--;

    // Kaido Name
    shadowOAM[kaidoWordOAMIndex].attr0 = ATTR0_WIDE | ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex].attr1 = ATTR1_TINY | ATTR1_X(100);
    shadowOAM[kaidoWordOAMIndex].attr2 = ATTR2_TILEID(5, 31) | ATTR2_PALROW(1);
    shadowOAM[kaidoWordOAMIndex + 1].attr0 = ATTR0_WIDE | ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(116);
    shadowOAM[kaidoWordOAMIndex + 1].attr2 = ATTR2_TILEID(7, 31) | ATTR2_PALROW(1);
    shadowOAM[kaidoWordOAMIndex + 2].attr0 = ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(132);
    shadowOAM[kaidoWordOAMIndex + 2].attr2 = ATTR2_TILEID(9, 31) | ATTR2_PALROW(1);

    // Kaido Health
    for (int i = 0; i < kaidoHealth; i++) {
        shadowOAM[kaido.oamIndex + 2 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[kaido.oamIndex + 2 + i].attr1 = ATTR1_TINY | ATTR1_X(80 + (i * 8));
        shadowOAM[kaido.oamIndex + 2 + i].attr2 = ATTR2_TILEID(11, 31) | ATTR2_PALROW(1);
    }
    shadowOAM[22].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
    shadowOAM[22].attr1 = ATTR1_TINY | ATTR1_X(72);
    shadowOAM[22].attr2 = ATTR2_TILEID(10, 31) | ATTR2_PALROW(1);
    for (int i = 0; i < 10; i++) {
        shadowOAM[23 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[23 + i].attr1 = ATTR1_TINY | ATTR1_X(80 + (i * 8));
        shadowOAM[23 + i].attr2 = ATTR2_TILEID(12, 31) | ATTR2_PALROW(1);
    }
    shadowOAM[34].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
    shadowOAM[34].attr1 = ATTR1_TINY | ATTR1_X(160);
    shadowOAM[34].attr2 = ATTR2_TILEID(13, 31) | ATTR2_PALROW(1);
}

void fireballUpdate() {
    if (fireball.shooting) {
        shootFireball();
    }

    if ((fireball.timeUntilNextFrame == 0)) { 
        fireball.timeUntilNextFrame = 10;
        fireball.frame = (fireball.frame + 1) % fireball.numFrames;
    } else if (fireball.timeUntilNextFrame < 0) { // turn timeUntilNextFrame back to 10 if it goes below 0
        fireball.timeUntilNextFrame = 10;
    }
    fireball.timeUntilNextFrame--;

    if (fireballCollision() && fireball.shooting) {
        fireball.shooting = 0;
        fireball.x = kaido.x + (kaido.width * 2) - 25;
        luffyLives--;
        REG_MOSAIC = (1 << 8) + (1 << 12);
        shadowOAM[luffy.oamIndex].attr0 |= ATTR0_MOSAIC;
        if (luffyLives == 0) {
            goToLose();
        }
    }
    if (fireball.timeUntilNextShot == 0) {
        fireball.shooting = 1;
        fireball.timeUntilNextShot = rand() % 80;
    } else if (fireball.timeUntilNextShot < 0) {
        fireball.timeUntilNextShot = rand() % 80;
    }
    if (!fireball.shooting) {
        fireball.timeUntilNextShot--;
    }    

    if (fireball.x + fireball.width > ((tileTemp) * 8) && groundChanging == 1) {
        fireball.shooting = 0;
        fireball.x = kaido.x + kaido.width * 2 - 25;
    }
}

void shootFireball() {
    shadowOAM[fireball.oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(fireball.y);
    shadowOAM[fireball.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(fireball.x);
    shadowOAM[fireball.oamIndex].attr2 = ATTR2_TILEID(28, fireball.frame * 2) | ATTR2_PALROW(1);
    if (fireball.x > 240 + fireball.width) {
        fireball.shooting = 0;
        fireball.x = kaido.x + (kaido.width * 2) - 25;
    } else {
        fireball.x += fireball.xVel;
    }
}

int fireballCollision() {
    return collision(fireball.x, fireball.y, fireball.width, fireball.height, luffy.x, luffy.y + 6, luffy.width, luffy.height);
}

int punchCollision() {
    return collision(kaido.x, kaido.y, kaido.width * 2, kaido.height * 2, luffyFist.x, luffyFist.y, luffyFist.width, luffyFist.height);
} 





// Kaido2 game functions

void luffyUpdate2() {
    luffy.isMoving = 0;
    if (BUTTON_HELD(BUTTON_LEFT)) { // Handle Luffy running left
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT)) { // Handle Luffy running right
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }
    
    if (luffy.jumping == 0) { // Handle all animation if punching animation is not happening
        // Set up luffy sprite
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);

        if (luffy.direction == RIGHT) { // Handle flipping the sprite if going right
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) { // animate still frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) { // animate motion frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID((luffy.frame * 4) + 16, 0);
        } else if (luffy.timeUntilNextFrame < 0) { // turn timeUntilNextFrame back to 10 if it goes below 0
            luffy.timeUntilNextFrame = 10;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A)) { // Set Luffy's lightning variable to 1 when A is pressed
        luffyLightning = 1;
        luffy.lightning = 1;
    }

    if (luffy.lightning) { // Call Luffy's lightning throw function
        for (int i = 0; i < LIGHTNINGCOUNT; i++) {
            if (lightning[i].active == 0) {
                lightning[i].x = luffy.x;
                lightning[i].y = luffy.y;
                lightning[i].active = 1;
                lightning[i].direction = luffy.direction;
                luffyLightningThrow(&lightning[i]);
                break;
            }
        }
        
    }

    if (BUTTON_PRESSED(BUTTON_UP)) { // Set Luffy's jumping variable to 1 when A is pressed
        luffy.jumping = 1;
        luffy.punching = 0;
    }

    if (luffy.jumping) { // Call Luffy's jumping function
        luffyJumping();
    }

    if (BUTTON_PRESSED(BUTTON_DOWN) && luffy.jumping != 1 && gearFifth == 1 && groundChanging == 0) {
        groundChanging = 1;
        groundFrames = 45;
        tileTemp = (luffy.x / 8) - 2;
    }

    if (groundChanging == 1 && groundFrames > 0) {
        groundFrames--;
        groundChange();
    }

    // Display Luffy Life Hats 
    for (int i = 0; i < luffyLives; i++) {
        shadowOAM[35 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y - 10);
        shadowOAM[35 + i].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 2 + (10 * i));
        shadowOAM[35 + i].attr2 = ATTR2_TILEID(14, 31);
    }

    luffy.timeUntilNextFrame--;
}


void initLightning() {
    for (int i = 0; i < LIGHTNINGCOUNT; i++) {
        lightning[i].x = 0;
        lightning[i].y = 0;
        lightning[i].active = 0;
        lightning[i].height = 15;
        lightning[i].width = 8 * 5;
        lightning[i].oamIndex = 38 + i;
        lightning[i].direction = RIGHT;
    }
}


void luffyLightningThrow() {
    luffy.lightning = 0;
}

void lightningUpdate() {
    for (int i = 0; i < LIGHTNINGCOUNT; i++) {
        if (lightning[i].active) {
            if (lightning[i].direction == LEFT) {
                lightning[i].x -= LIGHTNINGSPEED;
            } else if (lightning[i].direction == RIGHT) {
                lightning[i].x += LIGHTNINGSPEED;
            }
            
            if (lightning[i].x + lightning[i].width < 0) {
                lightning[i].active = 0;
            } else if (lightning[i].x > 240) {
                lightning[i].active = 0;
            }
            if (lightningCollision(&lightning[i])) {
                lightning[i].active = 0;
                kaidoHealth-= punchDamage;
            }
            shadowOAM[lightning[i].oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(lightning[i].y);
            shadowOAM[lightning[i].oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(lightning[i].x);
            shadowOAM[lightning[i].oamIndex].attr2 = ATTR2_TILEID(21, 21) | ATTR2_PALROW(1);
        }
        if (lightning[i].active == 0) {
            shadowOAM[lightning[i].oamIndex].attr0 = ATTR0_HIDE;
        }
    }

    if (kaidoHealth <= 0) {
        goToWin();
    }
}

void kaidoUpdate2() {
    // Double Affine Sprite to make him larger
    SHADOW_OAM_AFF[0].d = 1 << 7;
    SHADOW_OAM_AFF[0].a = 1 << 7;
    shadowOAM[kaido.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(kaido.y) | ATTR0_DOUBLEAFFINE;
    shadowOAM[kaido.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(kaido.x);
    shadowOAM[kaido.oamIndex].attr2 = ATTR2_TILEID(kaido.frame * 8, 16) | ATTR2_PALROW(1);
    if (kaido.timeUntilNextFrame == 0) {
        kaido.timeUntilNextFrame = 30;
        kaido.frame = (kaido.frame + 1) % kaido.numFrames;
    } else if (kaido.timeUntilNextFrame < 0) {
        kaido.timeUntilNextFrame = 30;
    }
    kaido.timeUntilNextFrame--;

    // Kaido Name
    shadowOAM[kaidoWordOAMIndex].attr0 = ATTR0_WIDE | ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex].attr1 = ATTR1_TINY | ATTR1_X(100);
    shadowOAM[kaidoWordOAMIndex].attr2 = ATTR2_TILEID(5, 31) | ATTR2_PALROW(1);
    shadowOAM[kaidoWordOAMIndex + 1].attr0 = ATTR0_WIDE | ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(116);
    shadowOAM[kaidoWordOAMIndex + 1].attr2 = ATTR2_TILEID(7, 31) | ATTR2_PALROW(1);
    shadowOAM[kaidoWordOAMIndex + 2].attr0 = ATTR0_Y(2);
    shadowOAM[kaidoWordOAMIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(132);
    shadowOAM[kaidoWordOAMIndex + 2].attr2 = ATTR2_TILEID(9, 31) | ATTR2_PALROW(1);

    // Kaido Health
    for (int i = 0; i < kaidoHealth; i++) {
        shadowOAM[kaido.oamIndex + 2 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[kaido.oamIndex + 2 + i].attr1 = ATTR1_TINY | ATTR1_X(80 + (i * 8));
        shadowOAM[kaido.oamIndex + 2 + i].attr2 = ATTR2_TILEID(11, 31) | ATTR2_PALROW(1);
    }
    shadowOAM[22].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
    shadowOAM[22].attr1 = ATTR1_TINY | ATTR1_X(72);
    shadowOAM[22].attr2 = ATTR2_TILEID(10, 31) | ATTR2_PALROW(1);
    for (int i = 0; i < 10; i++) {
        shadowOAM[23 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
        shadowOAM[23 + i].attr1 = ATTR1_TINY | ATTR1_X(80 + (i * 8));
        shadowOAM[23 + i].attr2 = ATTR2_TILEID(12, 31) | ATTR2_PALROW(1);
    }
    shadowOAM[34].attr0 = ATTR0_SQUARE | ATTR0_Y(10);
    shadowOAM[34].attr1 = ATTR1_TINY | ATTR1_X(160);
    shadowOAM[34].attr2 = ATTR2_TILEID(13, 31) | ATTR2_PALROW(1);

    if (kaido.y <= 160 - (kaido.height * 2) && kaido.direction == DOWN) {
        kaido.y++;
    } else if (kaido.y >= 0 && kaido.direction == UP) {
        kaido.y--;
    } 
    if (kaido.y == 160 - (kaido.height * 2)) {
        kaido.direction = UP;
    } else if (kaido.y == 0) {
        kaido.direction = DOWN;
    }

    if (timeUntilNextFireball == 0) {
        for (int i = 0; i < FIREBALLCOUNT; i++) {
            if (fireballs[i].shooting == 0) {
                fireballs[i].x = kaido.x + (kaido.width * 2) - 25;
                fireballs[i].y = kaido.y;
                fireballs[i].shooting = 1;
                timeUntilNextFireball = rand() % 80 + 30;
                break;
            }
        }
    } else if (timeUntilNextFireball < 0) {
        timeUntilNextFireball = rand() % 80 + 30;
    }

    timeUntilNextFireball--;
}

void initFireball2() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        fireballs[i].shooting = 0;
        fireballs[i].frame = 0;
        fireballs[i].height = 16;
        fireballs[i].width = 32;
        fireballs[i].numFrames = 2;
        fireballs[i].oamIndex = 42 + i;
        fireballs[i].x = 0;
        fireballs[i].xVel = 1;
        fireballs[i].y = 0;
        fireballs[i].timeUntilNextFrame = 10;
        fireballs[i].timeUntilNextShot = 0;
    }
}

void fireballUpdate2() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        if (fireballs[i].shooting) {
            shootFireball2(&fireballs[i]);

            if (fireballs[i].timeUntilNextFrame == 0) {
                fireballs[i].timeUntilNextFrame = 10;
                fireballs[i].frame = (fireballs[i].frame + 1) & fireballs[i].numFrames;
            } else if (fireballs[i].timeUntilNextFrame < 0) {
                fireballs[i].timeUntilNextFrame = 10;
            }
            fireballs[i].timeUntilNextFrame--;

            if (fireballCollision2(&fireballs[i])) {
                fireballs[i].shooting = 0;
                fireballs[i].x = kaido.x;
                luffyLives--;
                if (luffyLives == 0) {
                    goToLose();
                }
            }
        } else {
            shadowOAM[fireballs[i].oamIndex].attr0 = ATTR0_HIDE;
        }
        if (fireballs[i].x + fireballs[i].width > ((tileTemp) * 8) && groundChanging == 1) {
            fireballs[i].shooting = 0;
            fireballs[i].x = kaido.x + kaido.width * 2 - 25;
        }
    }
}

void shootFireball2(FIREBALL *fireball) {
    shadowOAM[fireball->oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(fireball->y);
    shadowOAM[fireball->oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(fireball->x);
    shadowOAM[fireball->oamIndex].attr2 = ATTR2_TILEID(28, fireball->frame * 2) | ATTR2_PALROW(1);
    if (fireball->x > 240 + fireball->width) {
        fireball->shooting = 0;
    } else {
        fireball->x += fireball->xVel;
    }
}

int lightningCollision(LIGHTNING *lightning) {
    return collision(kaido.x, kaido.y, kaido.width * 2, kaido.height * 2, lightning->x, lightning->y + 9, lightning->width, lightning->height);
}

int fireballCollision2(FIREBALL *fireball) {
    return collision(fireball->x, fireball->y, fireball->width, fireball->height, luffy.x, luffy.y, luffy.width, luffy.height);
}