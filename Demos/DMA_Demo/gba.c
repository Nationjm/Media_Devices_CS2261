#include "gba.h"

// Pointer to the start of video memory
volatile unsigned short* videoBuffer = (unsigned short*) 0x6000000;

// Pointer to the start of DMA registers
DMA* dma = (DMA*) 0x40000B0;

// ACTIVITY 3
void DMANow(int channel, volatile void *src, volatile void *dst, unsigned int cnt) {
    // Remember to write this function to work with any passed in channel (0, 1, 2, 3).

    // Clear cnt in the specified DMA channel
    dma[channel].cnt = 0;

    // Set the src of the specified dma channel to the passed in src
    dma[channel].src = src;

    // Set the dst of the specified dma channel to the passed in dst
    dma[channel].dst = dst;

    // Set the cnt of the specified dma channel to the passed in cnt and turn the dma channel on
    dma[channel].cnt = DMA_ON | cnt;

}

// ACTIVITY 4
void fillScreen(volatile u16 color) {  
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | DMA_16 | 38400);
}

// ACTIVITY 4
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    
    // for (int dy = 0; dy < height; dy++)
    //     for (int dx = 0; dx < width; dx++)
    //         setPixel(x + dx, y + dy, color);
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH)], DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | width);
    }

}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}