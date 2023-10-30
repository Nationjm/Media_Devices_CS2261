#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "Level1Map.h"
#include "Level2Map.h"
#include "levelTiles.h"

// Include state variable from main
extern state;

// State Functions
void start() {
    
}

void game1() {
    DMANow(3, LevelTilesTiles, &CHARBLOCK[0], LevelTilesTilesLen / 2);
    DMANow(3, Level1MapMap, &SCREENBLOCK[28], Level1MapMapLen / 2);
    DMANow(3, LevelTilesPal, PALETTE, 256);

    
}

void game2() {
    DMANow(3, Level2MapMap, &SCREENBLOCK[28], Level2MapMapLen);
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