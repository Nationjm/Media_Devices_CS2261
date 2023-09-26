#include "gba.h"
#include "print.h"

// Variables
unsigned short buttons;
unsigned short oldButtons;

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
                break;
            case GAME:
                break;
            case PAUSE:
                break;
            case WIN:
                break;
            case LOSE:
                break;
        }

    }

}

void initialize() {
    
    mgba_open();
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    state = START;
    fillScreen(WHITE);
}