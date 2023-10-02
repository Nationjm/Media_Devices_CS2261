#include "gba.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    // TODO 2.0: Complete this function
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48*ch + i + 6*j]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
    if (*str == '\0') return;
    drawChar(x, y, *str, color);
    drawString(x + 6, y, str + 1, color);
}