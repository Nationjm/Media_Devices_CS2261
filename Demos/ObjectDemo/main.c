#include "gba.h"
#include "print.h"

// Prototypes
void init();
void draw();
void update();

// Extern Vars
unsigned short buttons;
unsigned short oldButtons;

// Constants
unsigned short backgroundColor;

int main() {
    init();
    while (1) {
        oldButtons = buttons;
		buttons = REG_BUTTONS;
        update();
        waitForVBlank();
        draw();
    }
}

void init() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    backgroundColor = WHITE;
    fillScreen(backgroundColor);

    oldButtons = 0;
	buttons = REG_BUTTONS;

    initPlayer();
    mgba_open();
}

void update() {
    updatePlayer();
    updateBullets();
}

void draw() {
    drawGame();
}