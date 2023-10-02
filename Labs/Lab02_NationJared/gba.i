# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 31 "gba.h"
typedef unsigned short u16;


extern volatile unsigned short* videoBuffer;


void drawRectangle(int, int, int, int, u16);
void drawRightTriangle(int, int, int, u16);
void drawParallelogram(int, int, int, int, u16);
void drawCircle(int x, int y, int, u16);

void waitForVBlank();
# 2 "gba.c" 2

volatile u16* scanlineCounter = (u16*) 0x04000006;

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;


void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            (videoBuffer[((j) * (240) + (i))] = color);
        }
    }
}


void drawRightTriangle(int x, int y, int sideLength, u16 color) {
    for (int i = 0; i <= sideLength - 1; i++) {
        for (int j = 0; j <= i; j++) {
            (videoBuffer[((i + y) * (240) + (j + x))] = color);
        }
    }
}


void drawParallelogram(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < height; i++) {
        for (int j = i; j < width + i; j++) {
            (videoBuffer[((i + y) * (240) + (j + x))] = color);
        }
    }

}


void drawCircle(int x, int y, int radius, u16 color) {
    for (int i = x - radius; i < x + radius + radius; i++) {
        for (int j = y - radius; j < y + radius + radius; j++) {
            if (((i - x) * (i - x)) + ((j - y) * (j - y)) <= (radius * radius)) {
                (videoBuffer[((j) * (240) + (i))] = color);
            }
        }
    }

}


void waitForVBlank() {
    while (*scanlineCounter >= 160);
    while (*scanlineCounter < 160);

}
