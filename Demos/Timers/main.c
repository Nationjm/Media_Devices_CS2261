#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"

#include "numbers.h"

void initialize();
void setupTimers();
void interruptHandler();
void update();

OBJ_ATTR shadowOAM[128];

int seconds;
int minutes;

int main() {

    initialize();

    while (1) {

        update();
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);

    }

}

void initialize() {

    mgba_open();
    hideSprites(); 
    DMANow(3, shadowOAM, OAM, 512);

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP;

    DMANow(3, numbersTiles, &CHARBLOCK[4], numbersTilesLen / 2);
    
    PALETTE[0] = BLACK; // BG color
    SPRITEPALETTE[1] = RED; // Clock color

    minutes = 0;
    seconds = 0;

    // Activity 1.3: Call setupTimers()
    setupTimers();

}

void setupTimers() {

    REG_IME = 0;

    // Activity 1.0: Enable timer interrupts
    REG_IE = IRQ_TIMER(0) | IRQ_TIMER(1);
    REG_TM0CNT = TIMER_ON | TM_IRQ | TM_FREQ_256;

    REG_INTERRUPT = &interruptHandler;
    REG_IME = 1;

    // Activity 1.1: Setup second timer
    REG_TM1D = 65536 - 60;

    // Activity 1.2: Setup minute timer
    REG_TM1CNT = TIMER_ON | TM_CASCADE | TM_IRQ;

}

#define INTERRUPT_FLAGGED(flag) (REG_IF & (flag))

void interruptHandler() {

    REG_IME = 0;

    // Activity 2.0: Handle second timer interrupt

    if (REG_IF & IRQ_TIMER(0)) {
        seconds += 1;
        seconds %= 60;
        // REG_TM0D = 0;
    }

    // Activity 2.1: Handle minute timer interrupt
    if (REG_IF & IRQ_TIMER(1)) {
        minutes += 1;
        REG_TM1D = 65536 - 60;
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}

#define x 34
#define y 48

void update() {

    shadowOAM[0].attr0 = ATTR0_Y(y) | ATTR0_TALL;
    shadowOAM[0].attr1 = ATTR1_X(x) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(((minutes / 10) % 8) * 4, ((minutes / 10) / 8) * 8);

    shadowOAM[1].attr0 = ATTR0_Y(y) | ATTR0_TALL;
    shadowOAM[1].attr1 = ATTR1_X(x + 40) | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_TILEID(((minutes % 10) % 8) * 4, ((minutes % 10) / 8) * 8);

    shadowOAM[2].attr0 = ATTR0_Y(y) | ATTR0_TALL;
    shadowOAM[2].attr1 = ATTR1_X(x + 100) | ATTR1_LARGE;
    shadowOAM[2].attr2 = ATTR2_TILEID(((seconds / 10) % 8) * 4, ((seconds / 10) / 8) * 8);
    
    shadowOAM[3].attr0 = ATTR0_Y(y) | ATTR0_TALL;
    shadowOAM[3].attr1 = ATTR1_X(x + 140) | ATTR1_LARGE;
    shadowOAM[3].attr2 = ATTR2_TILEID(((seconds % 10) % 8) * 4, ((seconds % 10) / 8) * 8);

    shadowOAM[4].attr0 = ATTR0_Y(y) | ATTR0_TALL;
    shadowOAM[4].attr1 = ATTR1_X(x + 74) | ATTR1_LARGE;
    shadowOAM[4].attr2 = ATTR2_TILEID(8, 8);

}