#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"

// Buttons
unsigned short oldButtons;
unsigned short buttons;

// States enum
enum {
    START,
    PAUSE,
    GAME1,
    GAME2,
    WIN,
    LOSE
} STATE;

int state;

int main() {

    initialize();

    while (1) {
        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
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

    return 0;
}

void initialize() {

    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);

    state = START;
}