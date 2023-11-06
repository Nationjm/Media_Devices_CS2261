#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"

// button variables
unsigned short oldButtons;
unsigned short buttons;

// States
enum {
    START,
    INSTRUCTIONS,
    KAIDO1,
    KAIDO2,
    BIGMOM1,
    BIGMOM2,
    PAUSE,
    WIN,
    LOSE
} STATE;

int state;

// function prototypes
void initialize();

int main() {

    initialize();

    while (1) {
        // Update Buttons
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        waitForVBlank();

        // State Machine
        switch(state) {
            case START:
                start();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToWin();
                }
                break;
            case INSTRUCTIONS:
                instructions();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToKaido1();
                }
                break;
            case PAUSE:
                pause();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToKaido1();
                }
                break;
            case KAIDO1:
                kaido1();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToPause();
                }
                break;
            case WIN:
                win();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToStart();
                }
                break;
            case LOSE:
                lose();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToStart();
                }
                break;
        }

    }

    return 1;
}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    state = START;
    goToStart();
}