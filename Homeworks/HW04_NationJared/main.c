#include "gba.h"
#include "mode4.h"
#include "print.h"
#include "game.h"
#include <stdio.h>

// Add makefile

unsigned short oldButtons;
unsigned short buttons;

// States
enum {
    START,
    PAUSE,
    GAME,
    HIGHSCORE,
    LOSE,
    SCOREBOARD
} STATE;
int state;

// random variable seeding
int rSeed = 0;

// frameCount variable to initialize cones
int frameCount = 0;

int gameOver = 0; // variable to check if the game is over

void initialize();

// State Motion Prototypes
void goToStart();
void goToGame();
void goToPause();
void goToHighScore();
void goToLose();
void goToScoreBoard();


int main() {

    initialize();

    while (1) {

        // Update Buttons
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        waitForVBlank();
        flipPage();

        // State Machine
        switch(state) {
            case START:
                start();
                rSeed += 1;
                if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) {
                    goToGame();
                }
                if (BUTTON_PRESSED(BUTTON_SELECT) || BUTTON_PRESSED(BUTTON_B)) {
                    goToScoreBoard();
                }
                break;
            case GAME:
                frameCount += 1;
                gameOver = game(frameCount);
                if (gameOver == 3) {
                    goToHighScore();
                } else if (gameOver) {
                    goToLose();
                }
                if (BUTTON_PRESSED(BUTTON_SELECT) || BUTTON_PRESSED(BUTTON_B)) {
                    goToPause();
                }
                break;
            case PAUSE:
                pause();
                if (BUTTON_PRESSED(BUTTON_SELECT) || BUTTON_PRESSED(BUTTON_B)) {
                    goToGame();
                }
                break;
            case HIGHSCORE:
                frameCount += 1;
                highScore(frameCount);
                if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) {
                    goToScoreBoard();
                }
                if (frameCount > 140) {
                    frameCount = 0;
                }
                break;
            case LOSE:
                lose();
                if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) {
                    goToStart();
                }
                break;
            case SCOREBOARD:
                scoreboard();
                if (BUTTON_PRESSED(BUTTON_SELECT) || BUTTON_PRESSED(BUTTON_B)) {
                    goToStart();
                }
                break;
        }

    }

}


// Sets up the GBA and enters the Start state
void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;
    
    initGame();

    goToStart();
}

void goToStart() {
    state = START;
}

void goToGame() {
    state = GAME;
    srand(rSeed);
    frameCount = 0;
}

void goToHighScore() {
    state = HIGHSCORE;
    frameCount = 0;
}

void goToLose() {
    state = LOSE;
}

void goToPause() {
    state = PAUSE;
}

void goToScoreBoard() {
    state = SCOREBOARD;
}