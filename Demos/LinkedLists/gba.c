#include "gba.h"
#include "font.h"

// Pointer to the start of video memory
unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;

#define setPixel3(x, y, color) (videoBuffer[OFFSET(x, y, SCREENWIDTH)] = color)

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}

// Waits until drawing pixel 0 of line 160
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

// Pointer to the start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Immediately begins a DMA transfer using parameters
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}

// Draws the specified character at the specified location in Mode 3
void drawChar3(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel3(x + c, y + r, color);
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString3(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar3(x, y, *str, color);
        str++;
        x += 6;
    }
}