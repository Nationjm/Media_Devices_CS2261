#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"
#include "gba.h"
#include "digitalSound.h"

#include "BinksBrew.h"

// State Variable from main and enum
extern unsigned short state;
enum {
    START,
    INSTRUCTIONS,
    KAIDO1,
    KAIDO2,
    BIGMOM1,
    BIGMOM2,
    PAUSE,
    WIN,
    LOSE
} STATE;

void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSA_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSong(const signed char* songData, int length) {
    DMANow(1, songData, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    REG_TM0CNT = 0;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM0D = 65536 - cyclesPerSample;
    REG_TM0CNT = TIMER_ON;

    song.data = songData;
    song.dataLength = length;
    song.looping = 1;
    song.isPlaying = 1;
    song.durationInVBlanks = (VBLANK_FREQ * length) / SOUND_FREQ;
    song.vBlankCount = 0;

    if (!(state == WIN)) {
        stopSounds();
    }
}

void stopSounds() {
    song.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    dma[1].cnt = 0;
}