#include "gba.h"
#include "mode4.h"
#include "print.h"

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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}