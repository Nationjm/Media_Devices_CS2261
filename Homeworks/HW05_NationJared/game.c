#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "Level1Map.h"
#include "Level2Map.h"
#include "levelTiles.h"
#include "BubbleBobbleTitle.h"
#include "WinState.h"
#include "LoseState.h"

// Include state variable from main
extern state;

// State Functions
void start() {
    DMANow(3, BubbleBobbleTitlePal, PALETTE, 256);
    DMANow(3, BubbleBobbleTitleTiles, &CHARBLOCK[0], BubbleBobbleTitleTilesLen / 2);
    DMANow(3, BubbleBobbleTitleMap, &SCREENBLOCK[28], BubbleBobbleTitleMapLen / 2);
}

void game1(int bool) {
    DMANow(3, LevelTilesTiles, &CHARBLOCK[0], LevelTilesTilesLen / 2);
    DMANow(3, Level1MapMap, &SCREENBLOCK[28], Level1MapMapLen / 2);
    DMANow(3, LevelTilesPal, PALETTE, 256);
    updatePlayer();
    updateEnemy1();
    updateEnemy2();
    updateEnemy3();
    updateEnemy4();
    updateEnemy5();
    updateEnemy6();
    updateBubble();
}

void game2(int game2Bool) {
    if (game2Bool == 1) {
        initGame2();
    }
    DMANow(3, Level2MapMap, &SCREENBLOCK[28], Level2MapMapLen);
    updatePlayer();
    updateEnemy1();
    updateEnemy2();
    updateEnemy3();
    updateEnemy4();
    updateEnemy5();
    updateEnemy6();
    updateBubble();
}

void pause() {

}

void win() {
    hideSprites();
    DMANow(3, WinStatePal, PALETTE, 256);
    DMANow(3, WinStateTiles, &CHARBLOCK[0], WinStateTilesLen / 2);
    DMANow(3, WinStateMap, &SCREENBLOCK[28], WinStateMapLen / 2);
}

void lose() {
    hideSprites();
    DMANow(3, LoseStatePal, PALETTE, 256);
    DMANow(3, LoseStateTiles, &CHARBLOCK[0], LoseStateTilesLen / 2);
    DMANow(3, LoseStateMap, &SCREENBLOCK[28], LoseStateMapLen / 2);
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