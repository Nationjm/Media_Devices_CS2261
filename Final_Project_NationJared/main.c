/*
    My second game state, Kaido2 has all of its' functions included in game.c.
    I attempted to put them into a new .c file, but had limited time and was prioritizing
    functionality rather than organization. I'll fix it later if I have time.
*/



#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "digitalSound.h"
#include "BinksBrew.h"
#include "DrumsOfLiberation.h"

// button variables
unsigned short oldButtons;
unsigned short buttons;

// States
enum {
    START,
    INSTRUCTIONS,
    KAIDO1,
    KAIDO2,
    BIGMOM1,
    BIGMOM2,
    PAUSE,
    WIN,
    LOSE,
    BETWEENFIGHT
} STATE;

int state;
int lastState = START;

// function prototypes
void initialize();
void interruptHandler();
void setupInterrupts();

int main() {

    initialize();

    while (1) {
        // Update Buttons
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        waitForVBlank();
        
        // State Machine
        switch(state) {
            case START:
                start();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToInstructions();
                }
                break;
            case INSTRUCTIONS:
                instructions();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    playSong(DrumsOfLiberation_data, DrumsOfLiberation_length, KAIDO1);
                    goToKaido1();
                    initLuffy();
                    initKaido();
                }
                break;
            case PAUSE:
                pause();
                if (BUTTON_PRESSED(BUTTON_SELECT) && lastState == KAIDO1) {
                    unpauseSong();
                    goToKaido1();
                } else if (BUTTON_PRESSED(BUTTON_SELECT) && lastState == KAIDO2) {
                    unpauseSong();
                    goToKaido2();
                }
                break;
            case KAIDO1:
                kaido1();

                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    lastState = KAIDO1;
                    goToPause();
                }

                if (BUTTON_HELD(BUTTON_LSHOULDER) && BUTTON_PRESSED(BUTTON_RSHOULDER)) {
                    gearFive();
                }

                break;
            case KAIDO2:   
                kaido2();
                gearFive();

                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    lastState = KAIDO2;
                    goToPause();
                }
                break;
            case WIN:
                win();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                break;
            case LOSE:
                lose();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();
                }
                break;
            case BETWEENFIGHT:
                betweenFight();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    playSong(DrumsOfLiberation_data, DrumsOfLiberation_length, KAIDO2);
                    initLuffy();
                    initKaido();
                    initLightning();
                    initFireball2();
                    goToKaido2();
                }
                break;
        }

    }

    return 1;
}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    state = START;
    goToStart();
}

void setupInterrupts() {
    REG_IME = 0;
    
    REG_IE = IRQ_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = interruptHandler;

    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if (REG_IF & IRQ_VBLANK) {
        if (song.isPlaying) {
            song.vBlankCount++;
            if (song.vBlankCount >= song.durationInVBlanks) {
                if (song.looping) {
                    playSong(song.data, song.dataLength, WIN);
                } else {
                    song.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }
            if (!(state == song.state || state == PAUSE)) {
                stopSong();
            }
            if (state == PAUSE) {
                pauseSong();
            }
        } 
        if (soundEffect.isPlaying) {
            soundEffect.vBlankCount++;
            if (soundEffect.vBlankCount >= soundEffect.durationInVBlanks) {
                soundEffect.isPlaying = 0;
                dma[2].cnt = 0;
                REG_TM1CNT = TIMER_OFF;
            }
            if (!(state == KAIDO1 || state == KAIDO2)) {
                stopSoundEffect();
            }
            
        }
    } 

    REG_IF = REG_IF;
    REG_IME = 1;
}