# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 40 "gba.h"
void waitForVBlank();
# 71 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void setPixel3(int x, int y, unsigned short color);
void initialize();
# 2 "gba.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;


void drawRect(int x, int y, int width, int height, unsigned short color) {
    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}

void setPixel3(int x, int y, unsigned short color) {
    int offset = ((y) * (240) + (x));

    *(volatile unsigned short*)(0x06000000 + (2 * offset)) = color;
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < (160 * 240); i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}
