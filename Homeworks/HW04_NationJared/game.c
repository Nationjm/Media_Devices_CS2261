#include "game.h"
#include "mode4.h"
#include "print.h"
#include "gba.h"

void initGame() {
    // initializing colors
    unsigned short colors[NUMCOLORS] = {BLACK, WHITE, GRAY, RED, GREEN, BLUE, CYAN, MAGENTA, YELLOW, ORANGE};
    
    // load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        BG_PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

void start() {
    fillScreen4(ORANGEID);
    drawString4(60, 70, "Press Start To Begin", BLACK);
}

void game() {

}

void pause() {

}

void win() {

}

void lose() {
    
}



