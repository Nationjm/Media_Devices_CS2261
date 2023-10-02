#include "gba.h"
#include "print.h"
#include "game.h"

// Variables
unsigned short buttons;
unsigned short oldButtons;
int drawStart = 1;
int drawGame = 1;
int drawPause = 1;
int drawWin = 1;
int drawLose = 1;
int gamePause = 0;

// Enums
enum STATE{START, PAUSE, GAME, WIN, LOSE} state;

void initialize();

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        

        switch(state) {
            case START:
                start(drawStart);
                drawStart = 0;
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToGame();
                }
                break;
            case GAME:
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
            case LOSE:
                lose();
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
}

void goToGame() {
    state = GAME;
}

void goToPause() {
    state = PAUSE;
}

void goToWin() {
    state = WIN;
}