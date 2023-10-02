#include "gba.h"

volatile u16* scanlineCounter = (u16*) 0x04000006;

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

// TODO 2.0: Complete this function
void drawRectangle(int x, int y, int width, int height, u16 color) { 
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            setPixel(i, j, color);
        }
    }
}

// TODO 2.1: Complete this function
void drawRightTriangle(int x, int y, int sideLength, u16 color) { 
    for (int i = 0; i <= sideLength - 1; i++) {
        for (int j = 0; j <= i; j++) {
            setPixel(j + x, i + y, color);
        }
    }
}

// TODO 2.2: Complete this function
void drawParallelogram(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < height; i++) {
        for (int j = i; j < width + i; j++) {
            setPixel(j + x, i + y, color);
        }
    }

}

// TODO 2.3: Complete this function
void drawCircle(int x, int y, int radius, u16 color) {
    for (int i = x - radius; i < x + radius + radius; i++) {
        for (int j = y - radius; j < y + radius + radius; j++) {
            if (((i - x) * (i - x)) + ((j - y) * (j - y)) <= (radius * radius)) {
                setPixel(i, j, color);
            }
        }
    }

}

// TODO 3.1: Complete this function
void waitForVBlank() {
    while (*scanlineCounter >= 160);
    while (*scanlineCounter < 160); 

}