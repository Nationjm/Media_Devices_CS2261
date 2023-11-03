#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"

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
    flipPages();
}

void instructions() {

}

void game() {

}

void pause() {

}

void win() {

}

void lose() {

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