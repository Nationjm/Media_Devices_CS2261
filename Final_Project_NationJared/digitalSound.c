#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"
#include "gba.h"
#include "digitalSound.h"

#include "BinksBrew.h"
#include "DrumsOfLiberation.h"

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

void playSong(const signed char* songData, int length, int offState) {
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
    song.state = offState;
}

void stopSong() {
    song.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    dma[1].cnt = 0;
}

void playSoundEffect(const signed char* soundData, int length) {
    DMANow(2, soundData, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_ON | DMA_32);
    REG_TM1CNT = 0;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;\
    REG_TM1D = 65536 - cyclesPerSample; 
    REG_TM1CNT = TIMER_ON;

    soundEffect.data = soundData;
    soundEffect.dataLength = length;
    soundEffect.looping = 0;
    soundEffect.isPlaying = 1;
    soundEffect.durationInVBlanks = (VBLANK_FREQ * length) / SOUND_FREQ;
    soundEffect.vBlankCount = 0;
}

void stopSoundEffect() {
    soundEffect.isPlaying = 0;
    REG_TM1CNT = TIMER_OFF;
    dma[2].cnt = 0;
}