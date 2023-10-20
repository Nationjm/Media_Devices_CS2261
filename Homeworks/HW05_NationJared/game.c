#include "game.h"
#include "gba.h"
#include "mode0.h"

// Include state variable from main
extern state;

// State Functions
void start() {

}

void game1() {

}

void game2() {

}

void pause() {

}

void win() {

}

void lose() {

}

// State Machine Traversal Functions
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