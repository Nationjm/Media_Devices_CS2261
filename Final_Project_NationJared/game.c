#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "mode4.h"
#include "luffyStartScreen.h"
#include "LuffyWinScreen.h"
#include "wanoInstructions.h"

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

void game() {

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


// State Change Prototypes
void goToStart() {
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToGame() {
    state = GAME;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
}

void goToPause() {
    state = PAUSE;

}

void goToWin() {
    state = WIN;
}

void goToLose() {
    state = LOSE;
}