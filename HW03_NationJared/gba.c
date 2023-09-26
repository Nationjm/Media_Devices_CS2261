#include "gba.h"
#include "font.h"

#define DMA ((volatile DMAREC*)0x040000b0)

typedef struct {
    const volatile void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMAREC;

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    //use DMA version

}

void fillScreen(unsigned short color) {
    //use DMA version
    volatile unsigned int temp = color | color << 16;
    DMA[3].cnt = 0;
    DMA[3].src = &temp;
    DMA[3].dst = videoBuffer;
    DMA[3].cnt = 1 << 31 | // turn it on!
                 1 << 26 | // set chunk size to 32 bits
                 1 << 24 | // set src as fixed
                 19200;
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}