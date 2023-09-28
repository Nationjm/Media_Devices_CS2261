#include "game.h"
#include "gba.h"
#include "print.h"

void initPlayer() {
    player.x = 20;
    player.y = 20;
    player.oldX = 20;
    player.oldY = 20;
    player.xVel = 1;
    player.yVel = 1;
    player.color = GRAY;
    player.width = 10;
    player.height = 20;
    player.hasMoved = 1;
}

void initBullets() {
    // TODO 2.0 Init each bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].x = 0;
        bullets[i].y = 0;
        bullets[i].active = 0;
        bullets[i].xVel = 0;
        bullets[i].yVel = 0;
        bullets[i].color = BULLETCOLOR;
        bullets[i].width = 4;
        bullets[i].height = 2;
        bullets[i].hasMoved = 0;
        bullets[i].oldX = 0;
        bullets[i].oldY = 0;
    }
}

void updatePlayer() {
    // Update the oldX and oldY referenced by your player pointer
    player.oldX = player.x;
    player.oldY = player.y;
    
    // TODO 3.1 Fire a bullet when the player pressed BUTTON_A
    if (BUTTON_PRESSED(BUTTON_A)) {
        newBullet(player.x, player.y, 1, 0);
    }

    // Update the player's location and moved status based on button inputs
    if (BUTTON_HELD(BUTTON_UP)) {
        player.y -= player.yVel; 
        player.hasMoved = 1;
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
        player.y += player.yVel;
        player.hasMoved = 1;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.x += player.xVel;
        player.hasMoved = 1;
	} else if (BUTTON_HELD(BUTTON_LEFT)) {
        player.x -= player.xVel;
        player.hasMoved = 1;
	}
}

void updateBullets() {
    // TODO 2.1 Update each bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active) {
                bullets[i].oldX = bullets[i].x;
                bullets[i].oldY = bullets[i].y;
                if (bullets[i].x + bullets[i].xVel > SCREENWIDTH) {
                    bullets[i].active = 0;
                } else {
                    bullets[i].x += bullets[i].xVel;
                }
                if (bullets[i].y + bullets[i].yVel > SCREENHEIGHT) {
                    bullets[i].active = 0;
                } else {
                    bullets[i].y += bullets[i].yVel;
                }
            }
        }
}

void drawPlayer(RECTANGLE* current) {
    // Draw a rectangle based on the player pointer you've been given
    if (current->hasMoved) {
        drawRect(current->oldX, current->oldY, current->width, current->height, BACKGROUNDCOLOR);
        current->hasMoved = 0;
    }
    drawRect(current->x, current->y, current->width, current->height, current->color);
}

void drawBullets() {
    // TODO 2.2 Draw each bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active) {
            drawRect(bullets[i].oldX, bullets[i].oldY, bullets[i].width, bullets[i].height, BACKGROUNDCOLOR);
            drawRect(bullets[i].x, bullets[i].y, bullets[i].width, bullets[i].height, RED);
            
        }
    }
}

void newBullet(int x, int y, int xVel, int yVel) {
    // TODO 3.0 Create a new bullet
    int notFound = 1;
    for (int i = 0; (i < BULLETCOUNT && notFound); i++) {
        if (!bullets[i].active) {
            mgba_printf("boom");
            notFound = 0;
            bullets[i].x = x;
            bullets[i].y = y;
            bullets[i].xVel = xVel;
            bullets[i].yVel = yVel;
            bullets[i].active = 1;

        }
    }
}

void drawGame() {
    drawPlayer(&player);
    drawBullets();
}