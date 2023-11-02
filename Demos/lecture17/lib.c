#include "lib.h"

volatile u16* videoBuffer = VIDEO_BUFFER;

int enableInput = 1;

void waitForVBlank() {
  enableInput = 0;
  __asm__("swi 0x02 << 16");  // low power CPU until interrupt

  // while (SCANLINE_COUNTER > 160);
  // while (SCANLINE_COUNTER < 160);
}

void DMANow(int channel, const volatile void* src, volatile void* dst, volatile unsigned int cnt){
  DMA[channel].src = src;
  DMA[channel].dst = dst;
  DMA[channel].cnt = (1<<31) | cnt;
}