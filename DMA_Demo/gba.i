# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




void DMANow(int channel, volatile void* src, volatile void* dst, unsigned int cnt);
# 41 "gba.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 68 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 87 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 104 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2


volatile unsigned short* videoBuffer = (unsigned short*) 0x6000000;





void DMANow(int channel, volatile void* src, volatile void* dst, unsigned int cnt) {
# 26 "gba.c"
}


void fillScreen(volatile u16 color) {

    for (int i = 0; i < 240 * 160; i++)
        videoBuffer[i] = color;

}


void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {

    for (int dy = 0; dy < height; dy++)
        for (int dx = 0; dx < width; dx++)
            (videoBuffer[((y + dy) * (240) + (x + dx))] = color);

}

void waitForVBlank() {
    while ((*(volatile unsigned short*) 0x4000006) >= 160);
    while ((*(volatile unsigned short*) 0x4000006) < 160);
}
