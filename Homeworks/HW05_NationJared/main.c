#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "BubbleBobbleSpritesheet.h"
#include "Level1Map.h"
#include "Level2Map.h"
#include "levelTiles.h"
#include "Level1CollisionBitmap.h"
#include "Level2CollisionBitmap.h"

// Buttons
unsigned short oldButtons;
unsigned short buttons;

#define MAPWIDTH 256
#define MAPHEIGHT 256

int state;

typedef enum {LEFT, RIGHT} DIRECTION;

void initialize();
int main();
inline unsigned char colorAt(int, int, const unsigned short);

OBJ_ATTR shadowOAM[128];

SPRITE player;

int vOff = 2;
int hOff = 2;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;
        waitForVBlank();
        update();
        draw();
        mgba_printf("%d", state);
        // State Machine
        switch(state) {
            case START:
                start();
                if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) {
                    goToGame1();
                }
                break;
            case GAME1:
                game1();
                if (BUTTON_PRESSED(BUTTON_SELECT)) {
                    goToGame2();
                }
                break;
            case GAME2:
                game2();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE: 
                lose();
                break;
        }
    }

    return 0;
}

inline unsigned char colorAt(int x, int y, const unsigned short collisionMap) {
    return ((unsigned char *)collisionMap)[OFFSET(x, y, MAPWIDTH)];
}

void initialize() {
    mgba_open();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL | BG_4BPP;



    // Loading sprites into appropriate place in memory
    DMANow(3, BubbleBobbleSpritesheetTiles, &CHARBLOCK[4], BubbleBobbleSpritesheetTilesLen / 2);
    DMANow(3, BubbleBobbleSpritesheetPal, ((u16 *)0x5000200), 256);


    player.width = 16;
    player.height = 16;
    player.x = 100;
    player.y = 0;
    player.numFrames = 2;
    player.direction = LEFT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    goToStart();
}

void update() {
    player.isAnimating = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    if (BUTTON_HELD(BUTTON_LEFT) && colorAt(leftX, topY, Level1CollisionBitmapBitmap) && colorAt(leftX, bottomY, Level1CollisionBitmapBitmap)) {
        if (player.x > 0) {
            player.x -= player.xVel;
        }
        player.direction = LEFT;
        player.isAnimating = 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && colorAt(rightX, topY, Level1CollisionBitmapBitmap) && colorAt(rightX, bottomY, Level1CollisionBitmapBitmap)) {
        if (player.x < 240 - player.width) {
            player.x += player.xVel;
        }
        player.direction = RIGHT;
        player.isAnimating = 1;
    }

    // if (colorAt(leftX, bottomY, Level1CollisionBitmapBitmap) && colorAt(rightX, bottomY, Level1CollisionBitmapBitmap)) {
    //     if (player.y < 160 - player.height) {
    //         player.y += player.yVel;
    //     }
    // }
    player.y += player.yVel;

    shadowOAM[player.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y((player.y));
    shadowOAM[player.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(player.x);
    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(2, 18);
    } else {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 18);
    }

}

void draw() {
    DMANow(3, shadowOAM, OAM, 512);
}