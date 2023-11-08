/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

#include "lib.h"
#include "dummyBg.h"

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}


unsigned int vBlankCount;
unsigned int start;
unsigned int songLength;


void playsong() {
  songLength = 0; //VBLANK_FREQ * song_length / song_sampleRate;

  // REG_TM0D = (1 << 16) - PROCESSOR_CYCLES_PER_SECOND / song_sampleRate;
  // REG_TM0CNT = TIMER_ON;

  // DMANow(1, song_data, REG_FIFO_A,
  //   START_ON_FIFO_EMPTY |
  //   DMA_DESTINATION_FIXED |
  //   DMA_32 |
  //   DMA_REPEAT
  // );
  start = vBlankCount;
}

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

void interruptHandler(void) {
   REG_IME = 0;  // Disable interrupts
   if(REG_IF & INT_VBLANK)  {
      vBlankCount++;
      if (vBlankCount % 8 == 0) PALETTE[1]++; // vBlankCountingIsWorking -- change background color occasionally
      if((vBlankCount - start) > songLength)  {
        playsong(); // loop the song forever
      }
   }
   REG_IF = REG_IF;
   REG_IME = 1;
}

void setupInterrupts(void) {
  REG_IME = 0;  //disable interrupts
  REG_INTERRUPT = interruptHandler;  //set int handler
  // enable vBlank Interrupts
  REG_IE |= INT_VBLANK;  // Enable vblank interrupt detection
  REG_DISPSTAT |= INT_VBLANK_ENABLE;  // Make display generate vblank interrupts

  REG_IME = 1;  //enable interrupts
}

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */

int main(){
  REG_DISPCTL = BG0_ENABLE;

  // we don’t want to mess with sound channels 1-4
  REG_SOUNDCNT_L = 0;

  // Enable sound (Master control)
  REG_SOUNDCNT_X = SND_ENABLED;

  // enable and reset Direct Sound channel A, at full volume,
  // using Timer 0 to determine frequency
  REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                   DSA_OUTPUT_RATIO_100 |
                   DSA_OUTPUT_TO_BOTH |
                   DSA_TIMER0 |
                   DSA_FIFO_RESET;

  // start counting vBlanks
  setupInterrupts();

  playsong();
  
  // dummy background
  DMANow(3, dummyBgPal, PALETTE, 256);
  DMANow(3, dummyBgTiles, &CHARBLOCK[0], dummyBgTilesLen / 2);
  DMANow(3, dummyBgMap, &SCREENBLOCK[8], dummyBgMapLen / 2);
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
  PALETTE[1] = 0; // black, initially 

  while(1){
    __asm__("swi 0x02 << 16");  // low power CPU until VBlank
  }
}

/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */