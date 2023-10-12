#include "gba.h"
#include "mode4.h"
#include "print.h"
#include "game.h"

// Add makefile

unsigned short oldButtons;
unsigned short buttons;

// States
enum {
    START,
    PAUSE,
    GAME,
    WIN,
    LOSE
} STATE;
int state;

void initialize();

// State Prototypes
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();


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
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
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
}

void goToWin() {
    state = WIN;
}