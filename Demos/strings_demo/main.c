#include <stdio.h>
#include "gba.h"
#include "print.h"
#include "font.h"

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);

void initialize();

int main() {
    initialize();

    // TODO 1.0: check if 'j' == 106 using mgba_printf
        if ('j' == 106) {
            mgba_printf("j is 106");
        }
    // TODO 2.0: check the size of "Orange" using mgba_printf
        mgba_printf("String 'Orange' is size: %d", sizeof("Orange"));

    // TODO 3.0: check if we can initialize the strings in two lines
    char* bestColor;
    bestColor = "Orange";

    // TODO 4.0: check if we can modify strings
    

    // TODO 6.0: call drawChar

    // TODO 7.0: call drawString

    // TODO 8.0: use sprintf to put x in buffer, then draw it to the screen

    // TODO uncomment after making drawChar to show all the chars that you can draw
    int x = 0;
    int y = 0;
    for (int i=0; i < 256; i++) {
        drawChar(x, y, i, RED);
        x += 6;
        if (x > 230) {
        x=0;
        y+=8;
        }
    }

    while(1) {

    }
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    mgba_open();
}

void drawChar(int x, int y, char ch, unsigned short color) {
    // TODO 6.0
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            int localIndex = i + (6*j);
            if (fontdata[(48 * ch) + localIndex]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

void drawString(int x, int y, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
    if (*str == '\0') return;
    if (x > 230) {
        drawChar(x - 230, y + 8, *str, color);
        drawString(x - 230, y + 8, *str, color);
    } else {
        drawChar(x, y, *str,  color);
        drawString(x + 6, y, str + 1, color);
    }
}