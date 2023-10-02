#include "gba.h"
#include "print.h"
#include "game.h"
#include "analogSound.h"
#include <stdlib.h>
#include <stdio.h>

// Variables
unsigned short buttons;
unsigned short oldButtons;
int drawStart = 1;
int drawGame = 1;
int drawPause = 1;
int drawWin = 1;
int gamePause = 0;
int rSeed = 0;

// Enums
enum STATE{START, PAUSE, GAME, WIN} state;

void initialize();

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch(state) {
            case START:
                start(drawStart);
                rSeed += 1;
                drawStart = 0;
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToGame();
                }
                break;
            case GAME:
                if (drawGame) {
                    initDangerZone();
                }
                game(drawGame);
                drawGame = 0;
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    drawPause = 1;
                    goToPause();
                }
                break;
            case PAUSE:
                pause(drawPause);
                drawPause = 0;
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    drawGame = 1;
                    goToGame();
                }
                break;
            case WIN:
                win(drawWin);
                drawWin = 0;
                break;
        }
        waitForVBlank();
    }

}

void initialize() {
    
    mgba_open();
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    state = START;
    initPlayer();
    initBullet();
    initEnemies();
    initSound();
    initPowerUP();
}

void goToGame() {
    state = GAME;
    srand(rSeed);
}

void goToPause() {
    state = PAUSE;
}

void goToWin() {
    state = WIN;
}