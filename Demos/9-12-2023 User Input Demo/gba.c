#include "gba.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;


void drawRect(int x, int y, int width, int height, unsigned short color) {
    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            setPixel(x + i, y + j, color);
        }
    }    
}

void setPixel3(int x, int y, unsigned short color) {
    int offset = OFFSET(x,y,SCREENWIDTH);

    *(volatile unsigned short*)(0x06000000  + (2 * offset)) = color;
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < (160 * 240); i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}