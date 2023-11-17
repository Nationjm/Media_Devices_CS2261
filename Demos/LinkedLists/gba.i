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






extern volatile unsigned short *videoBuffer;
# 39 "gba.h"
void waitForVBlank();
# 56 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 72 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 104 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

void drawChar3(int x, int y, char ch, unsigned short color);
void drawString3(int x, int y, char *str, unsigned short color);
# 2 "gba.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "gba.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;




int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}


void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


DMA *dma = (DMA *)0x40000B0;


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | (1 << 31);
}


void drawChar3(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) (videoBuffer[((y + r) * (240) + (x + c))] = color);
        }
    }
}


void drawString3(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar3(x, y, *str, color);
        str++;
        x += 6;
    }
}
