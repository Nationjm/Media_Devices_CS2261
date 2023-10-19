#include "gba.h"
#include "mode4.h"
#include "sprites.h"
#include "game.h"

// Variables
OBJ_ATTR shadowOAM[128];
SPRITE kitty;
int collided;
int kittyPalette;
SPRITE statue;
SPRITE paw;
typedef enum {RIGHT, LEFT} DIRECTION;

// Initialize the game
void initGame() {
    initKitty();
    initStatue();
    initPaw();
}

// Updates the game each frame
void updateGame() {
	updateKitty();
}

// Draws the game each frame
void drawGame() {
    drawKitty();
    drawStatue();
    drawPaw();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Initialize the kitty
void initKitty() {
    kitty.width = 32;
    kitty.height = 16;
    kitty.xVel = 1;
    kitty.yVel = 1;
    kitty.direction = RIGHT;

    // TODO 2.0: set kitty.oamIndex appropriately

    // Initialize sprite in middle of screen
    kitty.x = SCREENWIDTH / 2 - kitty.width / 2;
    kitty.y = 95;

    collided = 0;
    kittyPalette = 0;
}

// Initialize the statue
void initStatue() {
    statue.width = 32;
    statue.height = 32;
    statue.x = 104;
    statue.y = 36;
    statue.oamIndex = 2;
}

// Initialize the paw
void initPaw() {
    paw.width = 32;
    paw.height = 32;
    paw.x = 200;
    paw.y = 140;
    paw.oamIndex = 3; 
}

// Handle every-frame actions of the kitty
void updateKitty() {
    if(BUTTON_HELD(BUTTON_UP)) {
        if (kitty.y > 0) {
            kitty.y -= kitty.yVel;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (kitty.y + kitty.height < SCREENHEIGHT) {
            kitty.y += kitty.yVel;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (kitty.x > 0) {
            kitty.x -= kitty.xVel;
        }
        // TODO 2.1: set kitty.direction appropriately

    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (kitty.x + kitty.width < SCREENWIDTH) {
            kitty.x += kitty.xVel;
        }
        // TODO 2.1: set kitty.direction appropriately

    }

    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, paw.x, paw.y, paw.width, paw.height)) collided = 1;
    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, statue.x, statue.y, statue.width, statue.height)) collided = 0;
    if (collided) kitty.framesPassed++;
}

// Draw the kitty
void drawKitty() {
    // TODO 2.2: set up the kitty's sprite in the shadowOAM
    
    //Changes the kitty'scolor if collided
    if (collided) {
        if (kitty.framesPassed % 30 == 0) {
            kittyPalette = (kittyPalette+1) % 3;
        } 
    }

    // TODO 2.3: set up the sprite for the kitty's shadow in the shadowOAM
    
}

// Draw the statue
void drawStatue() {
    // TODO 3.0: set up the statue's sprite in the shadowOAM

}

void drawPaw() {
    // TODO 4.0: set up the paw's sprite in the shadowOAM

}