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

// Direction enum
enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;


OBJ_ATTR shadowOAM[128]; // Set up the shadowOAM

typedef struct {
    unsigned short fill0[3];
    short a;
    unsigned short fill1[3];
    short b;
    unsigned short fill2[3];
    short c;
    unsigned short fill3[3];
    short d;
} ALIGN(4) OBJ_AFFINE;

OBJ_AFFINE *SHADOW_OAM_AFF = (OBJ_AFFINE*)shadowOAM;



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
    kaidoUpdate();
    fireballUpdate();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesPal, SPRITE_PALETTE, 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
    
}

void kaido2() {
    hideSprites();
    luffyUpdate();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &CHARBLOCK[0], Rooftop_Ground_TilesetBitmapTilesLen / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, BG_PALETTE, 256);
    DMANow(3, RooftopGroundBackgroundMap, &SCREENBLOCK[28], RooftopGroundBackgroundMapLen / 2);
    DMANow(3, LuffyandKaidoSpritesPal, SPRITE_PALETTE, 256);
    DMANow(3, LuffyandKaidoSpritesTiles, &CHARBLOCK[4], LuffyandKaidoSpritesTilesLen / 2);
}

void bigMom1() {
    hideSprites();
}

void bigMom2() {
    hideSprites();
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
    state = KAIDO1;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, shadowOAM, OAM, 512);
    initLuffy();
    initKaido();
}

void goToKaido2() {
    state = KAIDO2;
}

void goToBigMom1() {
    state = BIGMOM1;
}

void goToBigMom2() {
    state = BIGMOM2;
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
    luffy.yVel = 1;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
    luffy.punching = 0;
    luffy.punchingTime = 22;
    luffy.jumping = 0;
    luffy.jumpingTime = 85;
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
    
    if (luffy.punching == 0 && luffy.jumping == 0) { // Handle all animation if punching animation is not happening
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

    if (BUTTON_PRESSED(BUTTON_A)) { // Set Luffy's punching variable to 1 when A is pressed
        luffy.punching = 1;
    }

    if (luffy.punching) { // Call Luffy's punching function
        luffyPunching();
    }

    if (BUTTON_PRESSED(BUTTON_UP)) { // Set Luffy's jumping variable to 1 when A is pressed
        luffy.jumping = 1;
    }

    if (luffy.jumping) { // Call Luffy's jumping function
        luffyJumping();
    }

    luffy.timeUntilNextFrame--;
}

void luffyPunching() { // Handle animating Luffy while his punching variable is set to 1
    shadowOAM[luffy.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y);
    shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
    shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(3, 7);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        if (luffy.punchingTime < 20) {
            shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 32 + luffy.width);
            shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 36 + luffy.width);
            shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 40 + luffy.width);
            shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 44 + luffy.width);
            shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 5].attr1 = ATTR1_TINY | ATTR1_X(luffy.x + 48 + luffy.width);
            shadowOAM[luffy.oamIndex + 5].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 6].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x + 52 + luffy.width) | ATTR1_HFLIP;
            shadowOAM[luffy.oamIndex + 6].attr2 = ATTR2_TILEID(0, 9);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    } else {
        if (luffy.punchingTime < 20) {
        shadowOAM[luffy.oamIndex + 1].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
        shadowOAM[luffy.oamIndex + 1].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 8);
        shadowOAM[luffy.oamIndex + 1].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 2].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 12);
            shadowOAM[luffy.oamIndex + 2].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 3].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 16);
            shadowOAM[luffy.oamIndex + 3].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 4].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 20);
            shadowOAM[luffy.oamIndex + 4].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 5].attr1 = ATTR1_TINY | ATTR1_X(luffy.x - 24);
            shadowOAM[luffy.oamIndex + 5].attr2 = ATTR2_TILEID(2, 9);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = ATTR0_SQUARE | ATTR0_Y(luffy.y + 16);
            shadowOAM[luffy.oamIndex + 6].attr1 = ATTR1_SMALL | ATTR1_X(luffy.x - 36);
            shadowOAM[luffy.oamIndex + 6].attr2 = ATTR2_TILEID(0, 9);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }  
    }
  
    luffy.punchingTime--;
}

void luffyJumping() {
    shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
    shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
    }

    if (luffy.jumpingTime < 85 && luffy.jumpingTime > 70) {
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(12, 8);
        luffy.y -= luffy.yVel * 2;
    }
    if (luffy.jumpingTime < 70 && luffy.jumpingTime > 35) {
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(16, 8);
        luffy.y -= luffy.yVel;
    }
    if (luffy.jumpingTime < 35 && luffy.jumpingTime > 0) {
        shadowOAM[luffy.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y(luffy.y);
        shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(luffy.x) | ATTR1_HFLIP;
        }
        shadowOAM[luffy.oamIndex].attr2 = ATTR2_TILEID(24, 8);
        if (luffy.y < 110) {
            luffy.y += luffy.yVel * 2;
        }

    }

    if (luffy.jumpingTime < 0) {
        luffy.jumpingTime = 85;
        luffy.jumping = 0;
        luffy.timeUntilNextFrame = 1;
    }

    luffy.jumpingTime--;
}

// Kaido Functions
void initKaido() {
    kaido.x = -25;
    kaido.y = 100;
    kaido.direction = RIGHT;
    kaido.frame = 0;
    kaido.height = 25;
    kaido.width = 58;
    kaido.isMoving = 0;
    kaido.oamIndex = 7;
    kaido.numFrames = 0;
    kaido.xVel = 1;
    kaido.attacking = 0;
    kaido.attackingTime = 20;
    kaido.timeUntilNextFrame = 10;

    // Initialize fireballs
    fireball.x = kaido.x + (kaido.width * 2) - 25;
    fireball.y = kaido.y + 25;
    fireball.width = 32;
    fireball.height = 16;
    fireball.oamIndex = 8;
    fireball.xVel = 1;
    fireball.timeUntilNextFrame = 10;
    fireball.frame = 0;
    fireball.numFrames = 2;
}

void kaidoUpdate() {
    SHADOW_OAM_AFF[0].d = 1 << 7;
    SHADOW_OAM_AFF[0].a = 1 << 7;
    shadowOAM[kaido.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(kaido.y) | ATTR0_DOUBLEAFFINE;
    shadowOAM[kaido.oamIndex].attr1 = ATTR1_LARGE | ATTR1_X(kaido.x);
    shadowOAM[kaido.oamIndex].attr2 = ATTR2_TILEID(0, 15) | ATTR2_PALROW(1);
    if (punchCollision()) {
        goToWin();
    }
}

void fireballUpdate() {
    shadowOAM[fireball.oamIndex].attr0 = ATTR0_WIDE | ATTR0_Y(fireball.y);
    shadowOAM[fireball.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(fireball.x);
    shadowOAM[fireball.oamIndex].attr2 = ATTR2_TILEID(28, fireball.frame * 2) | ATTR2_PALROW(1);
    if (fireball.x > 240 + fireball.width) {
        fireball.x = kaido.x + kaido.width * 2 - 25;
    } else {
        fireball.x += fireball.xVel;
    }

    if ((fireball.timeUntilNextFrame == 0)) { 
        fireball.timeUntilNextFrame = 10;
        fireball.frame = (fireball.frame + 1) % fireball.numFrames;
    } else if (fireball.timeUntilNextFrame < 0) { // turn timeUntilNextFrame back to 10 if it goes below 0
        fireball.timeUntilNextFrame = 10;
    }
    fireball.timeUntilNextFrame--;

    if (fireballCollision()) {
        goToLose();
    }
}

int fireballCollision() {
    return collision(fireball.x, fireball.y, fireball.width, fireball.height, luffy.x, luffy.y, luffy.width, luffy.height);
}

int punchCollision() {
    return collision(kaido.x, kaido.y, kaido.width * 2, kaido.height * 2, luffyFist.x, luffyFist.y, luffyFist.width, luffyFist.height);
} 