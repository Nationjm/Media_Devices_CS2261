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
    // hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
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
    luffy.y = 130;
    luffy.xVel = 2;
    luffy.direction = LEFT;
    luffy.frame = 0;
    luffy.height = 0;
    luffy.width = 0;
    luffy.isMoving = 0;
    luffy.yVel = 2;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 0;
}

void luffyUpdate() {
    if (BUTTON_HELD(BUTTON_LEFT)) {
        luffy.x -= luffy.xVel;
    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        luffy.x += luffy.xVel;
    }

    if (BUTTON_PRESSED(BUTTON_UP)) {

    }

}