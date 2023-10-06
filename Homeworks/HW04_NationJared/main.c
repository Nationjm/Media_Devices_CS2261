#include "gba.h"
#include "mode4.h"
#include "print.h"

// Add makefile

unsigned short oldButtons;
unsigned short buttons;

int main() {

    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

    }

}