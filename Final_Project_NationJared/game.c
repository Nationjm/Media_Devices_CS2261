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

// State Variable from main and enum
extern unsigned short state;
enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
} STATE;

// Direction enum
enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;


OBJ_ATTR shadowOAM[128]; // Set up the shadowOAM

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
}

void kaido1() {
    hideSprites();
    luffyUpdate();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesPal, SPRITE_PALETTE, 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
    
}

void pause() {
    flipPage();
}

void win() {
    DMANow(3, LuffyWinScreenPal, BG_PALETTE, LuffyWinScreenPalLen / 2);
    drawFullscreenImage4(LuffyWinScreenBitmap);
    flipPage();
}

void lose() {
    flipPage();
}


// State Transition Prototypes; Also handles mode changes
void goToStart() {
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToKaido1() {
    state = GAME;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, shadowOAM, OAM, 512);
    initLuffy();
}

void goToPause() {
    state = PAUSE;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}

void goToWin() {
    state = WIN;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
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
    luffy.height = 0;
    luffy.width = 0;
    luffy.isMoving = 0;
    luffy.yVel = 2;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
}

void luffyUpdate() {
    luffy.isMoving = 0;
    if (BUTTON_HELD(BUTTON_LEFT) && luffy.x > 0) {
        luffy.direction = LEFT;
        luffy.x -= luffy.xVel;
        luffy.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && luffy.x < 240) {
        luffy.direction = RIGHT;
        luffy.x += luffy.xVel;
        luffy.isMoving = 1;
    }

    if (BUTTON_PRESSED(BUTTON_UP)) {

    }

    shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
    shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
    }
    if (luffy.timeUntilNextFrame == 0 & luffy.isMoving == 0) {
        luffy.timeUntilNextFrame = 10;
        luffy.frame = (luffy.frame + 1) % luffy.numFrames;
        shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
    } else if (luffy.timeUntilNextFrame == 0 && luffy.isMoving == 1) { 
        luffy.timeUntilNextFrame = 10;
        luffy.frame = (luffy.frame + 1) % 3;
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID((luffy.frame * 4) + 16, 0);
    } else if (luffy.timeUntilNextFrame < 0) {
        luffy.timeUntilNextFrame = 10;
    }

    luffy.timeUntilNextFrame--;
}