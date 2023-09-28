#include "gba.h"
#include "print.h"
#include "game.h"

// Variables
unsigned short buttons;
unsigned short oldButtons;
int drawStart = 1;
int drawPause = 1;
int drawWin = 1;
int drawLose = 1;

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

void initialize() {
    
    mgba_open();
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    state = START;
}