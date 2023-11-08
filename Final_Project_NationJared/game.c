#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "mode4.h"
#include "luffyStartScreen.h"
#include "LuffyWinScreen.h"
#include "wanoInstructions.h"
#include "sprites.h"
#include "RooftopGroundBackground.h"
#include "Rooftop_Ground_TilesetBitmap.h"
#include "LuffyandKaidoSprites.h"

// State Variable from main and enum
extern unsigned short state;
enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
} STATE;

// Direction enum
enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;


OBJ_ATTR shadowOAM[128]; // Set up the shadowOAM

// State Prototypes
void start() {
    DMANow(3, luffyStartScreenPal, BG_PALETTE, luffyStartScreenPalLen / 2);
    drawFullscreenImage4(luffyStartScreenBitmap);
    flipPage();
}

void instructions() {
    DMANow(3, wanoInstructionsPal, BG_PALETTE, wanoInstructionsPalLen / 2);
    drawFullscreenImage4(wanoInstructionsBitmap);
    flipPage();
}

void kaido1() {
    hideSprites();
    luffyUpdate();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesPal, SPRITE_PALETTE, 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
    
}

void pause() {
    flipPage();
}

void win() {
    DMANow(3, LuffyWinScreenPal, BG_PALETTE, LuffyWinScreenPalLen / 2);
    drawFullscreenImage4(LuffyWinScreenBitmap);
    flipPage();
}

void lose() {
    flipPage();
}


// State Transition Prototypes; Also handles mode changes
void goToStart() {
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToKaido1() {
    state = GAME;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, shadowOAM, OAM, 512);
    initLuffy();
}

void goToPause() {
    state = PAUSE;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}

void goToWin() {
    state = WIN;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}

void goToLose() {
    state = LOSE;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
}


// Luffy Functions

void initLuffy() {
    luffy.x = 200;
    luffy.y = 110;
    luffy.xVel = 2;
    luffy.direction = LEFT;
    luffy.frame = 0;
    luffy.height = 44;
    luffy.width = 32;
    luffy.isMoving = 0;
    luffy.yVel = 2;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
    luffy.punching = 0;
    luffy.punchingTime = 40;
}

void luffyUpdate() {
    luffy.isMoving = 0;
    if (BUTTON_HELD(BUTTON_LEFT) && luffy.punching == 0) { // Handle Luffy running left
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && luffy.punching == 0) { // Handle Luffy running right
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }

    if (BUTTON_PRESSED(BUTTON_UP)) { // Handle Luffy jumping

    }
    
    if (luffy.punching == 0) { // Handle all animation if punching animation is not happening
        // Set up luffy sprite
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);

        if (luffy.direction == RIGHT) { // Handle flipping the sprite if going right
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) { // animate still frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) { // animate motion frames
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID((luffy.frame * 4) + 16, 0);
        } else if (luffy.timeUntilNextFrame < 0) { // turn timeUntilNextFrame back to 10 if it goes below 0
            luffy.timeUntilNextFrame = 10;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A)) { // Handle Luffy Punching
        luffy.punching = 1;
    }

    if (luffy.punching) {
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(3, 7);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
            if (luffy.punchingTime < 40) {
            shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 32 + luffy.width);
            shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 37) {
                shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 36 + luffy.width);
                shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 34) {
                shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 40 + luffy.width);
                shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 31) {
                shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 44 + luffy.width);
                shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 28) {
                shadowOAM[luffy.oamIndex + 5].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 5].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 48 + luffy.width);
                shadowOAM[luffy.oamIndex + 5].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 25) {
                shadowOAM[luffy.oamIndex + 6].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 6].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x + 52 + luffy.width) | ATTR1_HFLIP;
                shadowOAM[luffy.oamIndex + 6].attr2 = ATTR2_TILEID(0, 9);
            }
            if (luffy.punchingTime < 0) {
                luffy.punchingTime = 40;
                luffy.punching = 0;
            }
        } else {
            if (luffy.punchingTime < 40) {
            shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 8);
            shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 37) {
                shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 12);
                shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 34) {
                shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 16);
                shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
            }
            if (luffy.punchingTime < 31) {
                shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
                shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x - 28);
                shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(0, 9);
            }
            if (luffy.punchingTime < 0) {
                luffy.punchingTime = 40;
                luffy.punching = 0;
            }  
        }
        
        luffy.punchingTime--;
    }
    

    luffy.timeUntilNextFrame--;
}