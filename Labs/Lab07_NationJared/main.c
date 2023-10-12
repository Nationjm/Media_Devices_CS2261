#include "gba.h"
#include "sprites.h"
#include "mode4.h"
#include "game.h"
#include "background.h"
#include "print.h"
// TODO 1.2: include .h file from usenti


// Prototypes
void initialize();
void goToGame();
void game();

// States
enum {GAME};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;
                
        // State Machine
        switch(state) {
            case GAME:
                game();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {
    // Set up the display
    
    //TODO 1.7: delete the 0 and enable sprites
    REG_DISPCTL = MODE(4) | BG2_ENABLE | 0;
    REG_BG2CNT = 2;

    // Set up the first state
    goToGame();
    initGame();
}

// Sets up the game state
void goToGame() {
    // Make sure changes do not appear onscreen
    waitForVBlank();

    // Set up the background
    // Load palette into bg palette location in memory
    DMANow(3, backgroundPal, PALETTE, 256);
    // Load bitmap data into the video buffer (background)
    DMANow(3, backgroundBitmap, videoBuffer, 240*160/2);

    // Set up the sprites
    // TODO 1.3: load tiles

    // TODO 1.4: load palette

    // Hide all sprites in shadowOAM
    hideSprites();

    // TODO 1.6: Copy shadowOAM into OAM during vBlank


    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
}