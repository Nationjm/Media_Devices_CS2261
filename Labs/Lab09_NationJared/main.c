#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "spritesheet.h"
#include "littleroot_town.h"
#include "collisionmap.h"

#define MAPWIDTH 512
#define MAPHEIGHT 512

void initialize();
void update();
void draw();

OBJ_ATTR shadowOAM[128];

typedef enum {DOWN, UP, RIGHT, LEFT} DIRECTION;

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

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
    // TODO 3.1 - return the color at the location (x, y) of the collisionmapBitmap
  return 0;
}

void initialize() {
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
    player.height = 16;
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
    // TODO 1.0 - set player direction based on what button was pressed
    // TODO 2.0- finish moving the player with the direction code you wrote in TODO 1.0
    // TODO
    
    // END TODO

    // TODO 1.1 + 1.2 - handle animation IF player is moving or ELSE player is not moving (hint)

    // END TODO

    // TODO 2.1 - Center screen on player
    
    // END TODO

    // TODO 1.3 - update player's shadowOAM index attributes
    
    // END TODO
}

void draw() {
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    DMANow(3, shadowOAM, OAM, 128*4);
}

