#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"

// Buttons
unsigned short oldButtons;
unsigned short buttons;

int state;

void initialize();

int main() {

    initialize();

    while (1) {

        waitForVBlank();
        
        // State Machine
        switch(state) {
            case START:
                start();
                if (BUTTON_PRESSED(BUTTON_START) | BUTTON_PRESSED(BUTTON_A)) {
                    goToGame1();
                }
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

    goToStart();
}