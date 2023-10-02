# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




void DMANow(int channel, volatile void* src, volatile void* dst, unsigned int cnt);


typedef volatile struct {
    volatile void *src;
    volatile void *dst;
    unsigned int cnt;

} DMA;

extern DMA* dma;
# 43 "gba.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 70 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 89 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 106 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2


volatile unsigned short* videoBuffer = (unsigned short*) 0x6000000;


DMA* dma = (DMA*) 0x40000B0;


void DMANow(int channel, volatile void *src, volatile void *dst, unsigned int cnt) {



    dma[channel].cnt = 0;


    dma[channel].src = src;


    dma[channel].dst = dst;


    dma[channel].cnt = (1 << 31) | cnt;

}


void fillScreen(volatile u16 color) {
    DMANow(3, &color, videoBuffer, (2 << 23) | (0 << 21) | (0 << 26) | 38400);
}


void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {




    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x))], (2 << 23) | (0 << 21) | width);
    }

}

void waitForVBlank() {
    while ((*(volatile unsigned short*) 0x4000006) >= 160);
    while ((*(volatile unsigned short*) 0x4000006) < 160);
}
