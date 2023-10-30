#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "spritesheet.h"
#include "littleroot_town.h"
#include "collisionmap.h"

// TODO 3.0: Include collisionmap.h


#define MAPWIDTH 512
#define MAPHEIGHT 512

void initialize();
void update();
void draw();

OBJ_ATTR shadowOAM[128];

typedef enum {DOWN, UP, RIGHT, LEFT} DIRECTION;

unsigned short oldButtons;
unsigned short buttons;

int hOff = 2;
int vOff = 2;

SPRITE player;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        update();
        waitForVBlank();
        draw();
    }
}

inline unsigned char colorAt(int x, int y){
    // TODO 3.1: return the color at the location (x, y) of the collisionmapBitmap
    return ((unsigned char *)collisionmapBitmap)[OFFSET(x, y, MAPWIDTH)];
}

void initialize() {
    mgba_open();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE | BG_4BPP;

    // Loading background into appropriate place in memory
    DMANow(3, littleroot_townTiles, &CHARBLOCK[0], littleroot_townTilesLen/2); // loading tileset into charblock 0
    DMANow(3, littleroot_townMap, &SCREENBLOCK[28], littleroot_townMapLen/2); // loading tilemap into screenblock 31
    DMANow(3, littleroot_townPal, PALETTE, 256); // loading palette

    // Loading sprites into appropriate place in memory
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    // Initializing player sprite
    player.width = 16;
    player.height = 21;
    player.x = 200;
    player.y = 150;
    player.numOfFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
}

void update() {
    player.isMoving = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    // TODO 1.0: Set player direction based on what button was pressed
    // TODO 2.0: Finish moving the player with the direction code you wrote in TODO 1.0
    if (BUTTON_HELD(BUTTON_UP) && colorAt(leftX, topY) && colorAt(rightX, topY)) {
        if (player.y > 0) {
            player.y -= player.yVel;
        }
        player.direction = UP;
        player.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_DOWN) && colorAt(leftX, bottomY) && colorAt(rightX, bottomY)) {
        if (player.y < MAPHEIGHT - player.height) {
            player.y += player.yVel;
        }
        player.direction = DOWN;
        player.isMoving = 1;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && colorAt(leftX, topY) && colorAt(leftX, bottomY)) {
        if (player.x > 0) {
            player.x -= player.xVel;
        }
        player.direction = LEFT;
        player.isMoving = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && colorAt(rightX, topY) && colorAt(rightX, bottomY)) {
        if (player.x < MAPWIDTH - player.width) {
            player.x += player.xVel;
        }
        player.direction = RIGHT;
        player.isMoving = 1;
    }
    // TODO 1.0 + 2.0 CODE
    
    

    // END TODO 1.0 + 2.0 CODE

    // TODO 1.1 + 1.2: Handle animation IF player is moving or ELSE player is not moving
    if (player.isMoving) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numOfFrames;
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }

    // TODO 2.1: Center screen on player
    if (hOff >= 0 && hOff <= MAPWIDTH - SCREENWIDTH) {
        hOff = player.x - (SCREENWIDTH - player.width) / 2;
    } 
    if (hOff < 0) {
        hOff = 0;
    } else if (hOff > MAPWIDTH - SCREENWIDTH) {
        hOff = MAPWIDTH - SCREENWIDTH;
    }

    if (vOff >= 0 && vOff < MAPHEIGHT - SCREENHEIGHT) {
        vOff = player.y - (SCREENHEIGHT - player.height) / 2;
    }
    if (vOff < 0) {
        vOff = 0;
    } else if (vOff > MAPHEIGHT - SCREENHEIGHT) {
        vOff = MAPHEIGHT - SCREENHEIGHT;
    } 
    

    // TODO 1.3: update player's shadowOAM index attributes
    shadowOAM[player.oamIndex].attr0 = ATTR0_TALL | ATTR0_Y((player.y - vOff));
    shadowOAM[player.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID((player.direction * 2), (player.currentFrame * 4));
}

void draw() {
    REG_BG0HOFF = hOff;
    mgba_printf("%d", vOff);
    mgba_printf("%d", hOff);
    REG_BG0VOFF = vOff;

    DMANow(3, shadowOAM, OAM, 128*4);
}

