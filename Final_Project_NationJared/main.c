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
    GAME,
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
                    goToInstructions();
                }
                break;
            case INSTRUCTIONS:
                instructions();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToGame();
                }
                break;
            case PAUSE:
                pause();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToGame();
                }
                break;
            case GAME:
                game();
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
        mgba_printf("%d", state);
    }

    return 1;
}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}