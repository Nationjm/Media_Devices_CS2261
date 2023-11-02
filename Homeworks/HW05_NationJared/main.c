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
int game1Bool = 1;
int game2Bool = 1;
int currentState = 0;
int tempX = 0;
int enemies;
int lives;

typedef enum {LEFT, RIGHT, FLOAT} DIRECTION;

void initialize();
int main();
inline unsigned char colorAt(int, int);
void draw();
void updatePlayer();
void updateEnemy1();
void updateEnemy2();
void updateEnemy3();
void updateEnemy4();
void updateEnemy5();
void updateEnemy6();
void updateBubble();
int bubbleCollision(SPRITE *enemy);
int playerCollision(SPRITE *enemy);

OBJ_ATTR shadowOAM[128];

SPRITE player;
SPRITE enemy1;
SPRITE enemy2;
SPRITE enemy3;
SPRITE enemy4;
SPRITE enemy5;
SPRITE enemy6;
SPRITE bubble;
enemies = 6;
lives = 3;

int vOff = 2;
int hOff = 2;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;
        waitForVBlank();
        draw();
        // State Machine
        switch(state) {
            case START:
                start();
                if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) {
                    goToGame1();
                }
                
                break;
            case GAME1:
                game1(game1Bool);
                game1Bool = 0;
                if (enemies == 0) {
                    game1Bool = 1;
                    enemies = 6;
                    game2Bool = 1;
                    goToGame2();
                }
                if (BUTTON_PRESSED(BUTTON_B)) {
                    currentState = 1;
                    goToPause();
                } else if (enemies == 0) {
                    goToWin();
                } else if (lives == 0) {
                    goToLose();
                }
                break;
            case GAME2:
                game2(game2Bool);
                game2Bool = 0;
                if (BUTTON_PRESSED(BUTTON_B)) {
                    currentState = 2;
                    goToPause();
                } else if (enemies == 0) {
                    goToWin();
                } else if (lives == 0) {
                    goToLose();
                }
                break;
            case PAUSE:
                pause();
                if (BUTTON_PRESSED(BUTTON_START) && currentState == 1) {
                    goToGame1();
                } else if (BUTTON_PRESSED(BUTTON_START) && currentState == 2) {
                    goToGame2();
                }
                break;
            case WIN:
                win();
                if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
                    enemies = 6;
                    lives = 3;
                    initGame1();
                    goToStart();
                }
                break;
            case LOSE: 
                if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
                    initGame1();
                    lives = 3;
                    enemies = 6;
                    goToStart();
                }
                lose();
                break;
        }
    }

    return 0;
}

inline unsigned char colorAt(int x, int y) {
    if (state == GAME1) {
        return ((unsigned char *)Level1CollisionBitmapBitmap)[OFFSET(x, y, MAPWIDTH)];
    } else if (state == GAME2) {
        return ((unsigned char *)Level2CollisionBitmapBitmap) [OFFSET(x, y, MAPWIDTH)];
    }
    
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

    initGame1();

    goToStart();
}

void initGame1() {
    player.width = 16;
    player.height = 16;
    player.x = 16;
    player.y = 128;
    player.numFrames = 2;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    enemy1.width = 16;
    enemy1.height = 16;
    enemy1.x = 16;
    enemy1.y = 48;
    enemy1.numFrames = 2;
    enemy1.direction = LEFT;
    enemy1.timeUntilNextFrame = 10;
    enemy1.xVel = 1;
    enemy1.yVel = 1;
    enemy1.oamIndex = 1;
    enemy1.isAnimating = 1;

    enemy2.width = 16;
    enemy2.height = 16;
    enemy2.x = 116;
    enemy2.y = 60;
    enemy2.direction = LEFT;
    enemy2.timeUntilNextFrame = 10;
    enemy2.xVel = 1;
    enemy2.yVel = 1;
    enemy2.oamIndex = 2;
    enemy2.isAnimating = 1;

    enemy3.width = 16;
    enemy3.height = 16;
    enemy3.x = 80;
    enemy3.y = 70;
    enemy3.direction = LEFT;
    enemy3.timeUntilNextFrame = 10;
    enemy3.xVel = 1;
    enemy3.yVel = 1;
    enemy3.oamIndex = 3;
    enemy3.isAnimating = 1;

    enemy4.width = 16;
    enemy4.height = 16;
    enemy4.x = 16;
    enemy4.y = 16;
    enemy4.direction = LEFT;
    enemy4.timeUntilNextFrame = 10;
    enemy4.xVel = 1;
    enemy4.yVel = 0;
    enemy4.oamIndex = 5;
    enemy4.isAnimating = 1;

    enemy5.width = 16;
    enemy5.height = 16;
    enemy5.x = 208;
    enemy5.y = 16;
    enemy5.direction = LEFT;
    enemy5.timeUntilNextFrame = 10;
    enemy5.xVel = 1;
    enemy5.yVel = 0;
    enemy5.oamIndex = 6;
    enemy5.isAnimating = 1;

    enemy6.width = 16;
    enemy6.height = 16;
    enemy6.x = 208;
    enemy6.y = 48;
    enemy6.direction = LEFT;
    enemy6.timeUntilNextFrame = 10;
    enemy6.xVel = 1;
    enemy6.yVel = 0;
    enemy6.oamIndex = 7;
    enemy6.isAnimating = 1;
}
void initGame2() {
    player.width = 16;
    player.height = 16;
    player.x = 16;
    player.y = 112;
    player.numFrames = 2;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;

    enemy1.width = 16;
    enemy1.height = 16;
    enemy1.x = 30;
    enemy1.y = 90;
    enemy1.numFrames = 2;
    enemy1.direction = LEFT;
    enemy1.timeUntilNextFrame = 10;
    enemy1.xVel = 1;
    enemy1.yVel = 1;
    enemy1.oamIndex = 1;
    enemy1.isAnimating = 1;

    enemy2.width = 16;
    enemy2.height = 16;
    enemy2.x = 200;
    enemy2.y = 100;
    enemy2.direction = LEFT;
    enemy2.timeUntilNextFrame = 10;
    enemy2.xVel = 1;
    enemy2.yVel = 1;
    enemy2.oamIndex = 2;
    enemy2.isAnimating = 1;

    enemy3.width = 16;
    enemy3.height = 16;
    enemy3.x = 80;
    enemy3.y = 40;
    enemy3.direction = LEFT;
    enemy3.timeUntilNextFrame = 10;
    enemy3.xVel = 1;
    enemy3.yVel = 1;
    enemy3.oamIndex = 3;
    enemy3.isAnimating = 1;

    enemy4.width = 16;
    enemy4.height = 16;
    enemy4.x = 16;
    enemy4.y = 16;
    enemy4.direction = LEFT;
    enemy4.timeUntilNextFrame = 10;
    enemy4.xVel = 1;
    enemy4.yVel = 0;
    enemy4.oamIndex = 5;
    enemy4.isAnimating = 1;

    enemy5.width = 16;
    enemy5.height = 16;
    enemy5.x = 208;
    enemy5.y = 16;
    enemy5.direction = LEFT;
    enemy5.timeUntilNextFrame = 10;
    enemy5.xVel = 1;
    enemy5.yVel = 0;
    enemy5.oamIndex = 6;
    enemy5.isAnimating = 1;

    enemy6.width = 16;
    enemy6.height = 16;
    enemy6.x = 208;
    enemy6.y = 48;
    enemy6.direction = LEFT;
    enemy6.timeUntilNextFrame = 10;
    enemy6.xVel = 1;
    enemy6.yVel = 0;
    enemy6.oamIndex = 7;
    enemy6.isAnimating = 1;
}

void updatePlayer() {
    player.isAnimating = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    if (BUTTON_HELD(BUTTON_LEFT) && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
        if (player.x > 0) {
           player.x -= player.xVel;
        }
        player.direction = LEFT;
        player.isAnimating = 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, bottomY)) {
        if (player.x < 240 - player.width) {
            player.x += player.xVel;
        }
        player.direction = RIGHT;
        player.isAnimating = 1;
    }

    if (BUTTON_PRESSED(BUTTON_UP)) {
        if (colorAt(leftX, bottomY - 23) && colorAt(rightX, bottomY - 23)) {
            if (player.y - 23 > 0) {
                player.y -= 23;
            }
        } else {
            if (player.y - 35 > 0) {
                player.y -= 35;
            }
        }
        
    }

    if (colorAt(leftX, bottomY + player.yVel) && colorAt(rightX, bottomY + player.yVel)) {
        player.y += player.yVel;
    }
    if (player.y > 160) {
        player.y = -16;
    }

    shadowOAM[player.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y((player.y));
    shadowOAM[player.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(player.x);
    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr1 = ATTR1_SMALL | ATTR1_HFLIP | ATTR1_X(player.x);
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 18);
    } else {
        shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(0, 18);
    }
}

void updateEnemy1() {
    int enemy1leftX = enemy1.x;
    int enemy1rightX = enemy1.x + enemy1.width - 1;
    int enemy1topY = enemy1.y;
    int enemy1bottomY = enemy1.y + enemy1.height - 1;

    if (enemy1.isAnimating) {
        if (colorAt(enemy1leftX, enemy1bottomY) && colorAt(enemy1leftX, enemy1topY)) {
        } else {
            enemy1.xVel = -enemy1.xVel;
        }

        if (colorAt(enemy1rightX, enemy1bottomY) && colorAt(enemy1rightX, enemy1topY)) {
        } else {
            enemy1.xVel = -enemy1.xVel;
        }

        if (colorAt(enemy1leftX, enemy1bottomY) && colorAt(enemy1rightX, enemy1bottomY)) {
        } else {
            enemy1.yVel = -enemy1.yVel;
        }

        if (colorAt(enemy1leftX, enemy1topY) && colorAt(enemy1rightX, enemy1topY)) {
        } else {
            enemy1.yVel = -enemy1.yVel;
        }

        enemy1.x += enemy1.xVel;
        enemy1.y += enemy1.yVel;

        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy1.y);
        shadowOAM[enemy1.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy1.x);
        shadowOAM[enemy1.oamIndex].attr2 = ATTR2_TILEID(0, 2);
    }
    if (bubbleCollision(&enemy1)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
        enemy1.isAnimating = 0;
    }
    
    if (playerCollision(&enemy1)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy2() {
    int enemy2leftX = enemy2.x;
    int enemy2rightX = enemy2.x + enemy2.width - 1;
    int enemy2topY = enemy2.y;
    int enemy2bottomY = enemy2.y + enemy2.height - 1;

    if (enemy2.isAnimating) {
        if (colorAt(enemy2leftX, enemy2bottomY) && colorAt(enemy2leftX, enemy2topY)) {
        } else {
            enemy2.xVel = -enemy2.xVel;
        }

        if (colorAt(enemy2rightX, enemy2bottomY) && colorAt(enemy2rightX, enemy2topY)) {
        } else {
            enemy2.xVel = -enemy2.xVel;
        }

        if (colorAt(enemy2leftX, enemy2bottomY) && colorAt(enemy2rightX, enemy2bottomY)) {
        } else {
            enemy2.yVel = -enemy2.yVel;
        }

        if (colorAt(enemy2leftX, enemy2topY) && colorAt(enemy2rightX, enemy2topY)) {
        } else {
            enemy2.yVel = -enemy2.yVel;
        }

        enemy2.x += enemy2.xVel;
        enemy2.y += enemy2.yVel;

        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy2.y);
        shadowOAM[enemy2.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy2.x);
        shadowOAM[enemy2.oamIndex].attr2 = ATTR2_TILEID(0, 2);
    }
    if (bubbleCollision(&enemy2)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
        enemy2.isAnimating = 0;
    }

    if (playerCollision(&enemy2)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy3() {
    int enemy3leftX = enemy3.x;
    int enemy3rightX = enemy3.x + enemy3.width - 1;
    int enemy3topY = enemy3.y;
    int enemy3bottomY = enemy3.y + enemy3.height - 1;
    if (enemy3.isAnimating) {
        if (colorAt(enemy3leftX, enemy3bottomY) && colorAt(enemy3leftX, enemy3topY)) {
        } else {
            enemy3.xVel = -enemy3.xVel;
        }

        if (colorAt(enemy3rightX, enemy3bottomY) && colorAt(enemy3rightX, enemy3topY)) {
        } else {
            enemy3.xVel = -enemy3.xVel;
        }

        if (colorAt(enemy3leftX, enemy3bottomY) && colorAt(enemy3rightX, enemy3bottomY)) {
        } else {
            enemy3.yVel = -enemy3.yVel;
        }

        if (colorAt(enemy3leftX, enemy3topY) && colorAt(enemy3rightX, enemy3topY)) {
        } else {
            enemy3.yVel = -enemy3.yVel;
        }

        enemy3.x += enemy3.xVel;
        enemy3.y += enemy3.yVel;

        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy3.y);
        shadowOAM[enemy3.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy3.x);
        shadowOAM[enemy3.oamIndex].attr2 = ATTR2_TILEID(0, 2);
    }
    if (bubbleCollision(&enemy3)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
        enemy3.isAnimating = 0;
    }

    if (playerCollision(&enemy3)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy4() {
    int enemy4leftX = enemy4.x;
    int enemy4rightX = enemy4.x + enemy4.width - 1;
    int enemy4topY = enemy4.y;
    int enemy4bottomY = enemy4.y + enemy4.height - 1;
    if (enemy4.isAnimating) {
        if (colorAt(enemy4leftX, enemy4bottomY) && colorAt(enemy4leftX, enemy4topY)) {
        } else {
            enemy4.xVel = -enemy4.xVel;
        }

        if (colorAt(enemy4rightX, enemy4bottomY) && colorAt(enemy4rightX, enemy4topY)) {
        } else {
            enemy4.xVel = -enemy4.xVel;
        }
        enemy4.x += enemy4.xVel;

        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy4.y);
        shadowOAM[enemy4.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy4.x);
        shadowOAM[enemy4.oamIndex].attr2 = ATTR2_TILEID(0, 8);
    }

    if (bubbleCollision(&enemy4)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
        enemy4.isAnimating = 0;
    }
    
    if (playerCollision(&enemy4)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy5() {
    int enemy5leftX = enemy5.x;
    int enemy5rightX = enemy5.x + enemy5.width - 1;
    int enemy5topY = enemy5.y;
    int enemy5bottomY = enemy5.y + enemy5.height - 1;

    if (enemy5.isAnimating) {
        if (colorAt(enemy5leftX, enemy5bottomY) && colorAt(enemy5leftX, enemy5topY)) {
        } else {
            enemy5.xVel = -enemy5.xVel;
        }

        if (colorAt(enemy5rightX, enemy5bottomY) && colorAt(enemy5rightX, enemy5topY)) {
        } else {
            enemy5.xVel = -enemy5.xVel;
        }
        enemy5.x += enemy5.xVel;

        shadowOAM[enemy5.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy5.y);
        shadowOAM[enemy5.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy5.x);
        shadowOAM[enemy5.oamIndex].attr2 = ATTR2_TILEID(0, 8);
    }
    if (bubbleCollision(&enemy5)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy5.oamIndex].attr0 = ATTR0_HIDE;
        enemy5.isAnimating = 0;
    }

    if (playerCollision(&enemy5)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateEnemy6() {
    int enemy6leftX = enemy6.x;
    int enemy6rightX = enemy6.x + enemy6.width - 1;
    int enemy6topY = enemy6.y;
    int enemy6bottomY = enemy6.y + enemy6.height - 1;
    if (enemy6.isAnimating) {
        if (colorAt(enemy6leftX, enemy6bottomY) && colorAt(enemy6leftX, enemy6topY)) {
        } else {
            enemy6.xVel = -enemy6.xVel;
        }

        if (colorAt(enemy6rightX, enemy6bottomY) && colorAt(enemy6rightX, enemy6topY)) {
        } else {
            enemy6.xVel = -enemy6.xVel;
        }
        enemy6.x += enemy6.xVel;

        shadowOAM[enemy6.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy6.y);
        shadowOAM[enemy6.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemy6.x);
        shadowOAM[enemy6.oamIndex].attr2 = ATTR2_TILEID(0, 8);
    }
    
    if (bubbleCollision(&enemy6)) {
        enemies -= 1;
        bubble.isAnimating = 0;
        shadowOAM[enemy6.oamIndex].attr0 = ATTR0_HIDE;
        enemy6.isAnimating = 0;
    }

    if (playerCollision(&enemy6)) {
        lives -= 1;
        player.x = 16;
        player.y = 112;
    }
}

void updateBubble() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        bubble.x = player.x;
        tempX = bubble.x;
        bubble.y = player.y;
        bubble.width = 16;
        bubble.height = 16;
        bubble.xVel = 1;
        bubble.yVel = 1;
        bubble.direction = player.direction;
        bubble.oamIndex = 4;
        bubble.isAnimating = 1;        
    }

    if (bubble.isAnimating) {
        if (bubble.direction == LEFT) {
            bubble.x -= bubble.xVel;
            if (bubble.x < tempX - 30 | bubble.x < -16) {
                bubble.isAnimating = 0;
            }
        } else {
            bubble.x += bubble.xVel;
            if (bubble.x > tempX + 46 | bubble.x > 240) {
                bubble.isAnimating = 0;
            }
        }
        shadowOAM[bubble.oamIndex].attr0 = ATTR0_SQUARE | ATTR0_Y(bubble.y);
        shadowOAM[bubble.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(bubble.x);
        shadowOAM[bubble.oamIndex].attr2 = ATTR2_TILEID(12, 24);
    } else {
        shadowOAM[bubble.oamIndex].attr0 = ATTR0_HIDE;
    }
}

void draw() {
    DMANow(3, shadowOAM, OAM, 512);
}

int bubbleCollision(SPRITE *enemy) {
    if (bubble.isAnimating & enemy->isAnimating) {
        return collision(enemy->x, enemy->y, enemy->width, enemy->height, bubble.x, bubble.y, bubble.width, bubble.height);
    } else {
        return 0;
    }
}

int playerCollision(SPRITE *enemy) {
    if (enemy->isAnimating) {
        return collision(enemy->x, enemy->y, enemy->width, enemy->height, player.x, player.y, player.width, player.height);
    } else {
        return 0;
    }
}