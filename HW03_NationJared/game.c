#include "gba.h"
#include "game.h"

ENEMY *enemyToErase;
int enemyErase = 0;
int activeEnemies = 25;

void start(int drawStart) {
    if (drawStart == 1) {
        fillScreen(ORANGE);
        drawString(85, 67, "Press Start", BLACK);
    }
}

void game(int drawGame) {
    player.oldX = player.x;
    if (drawGame == 1) {
        fillScreen(BACKGROUNDCOLOR);
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].active) {
                drawEnemy(&enemies[i]);
            }
        }
    }
    drawPlayer(&player);
    updateBullet();
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (enemies[i].active) {
            enemyCollision(&enemies[i]);
            if (enemyErase == 1) {
                activeEnemies--;
                mgba_printf("%d", activeEnemies);
                updateEnemy();
                enemyErase = 0;
            }
        }
    }
    updatePlayer();
    if (activeEnemies == 0) {
        goToWin();
    }
}

void pause(int drawPause) {
    if (drawPause) {
        fillScreen(BLACK);
    }
    drawString(100, 70, "Pause", WHITE);
}

void win(int drawWin) {
    if (drawWin) {
        fillScreen(BLUE);
    }
    drawString(100, 70, "You Win!", BLACK);
}

void lose() {

}

void initPlayer() {
    player.x = 130;
    player.y = 150;
    player.oldX = 130;
    player.width = 7;
    player.height = 7;
    player.hasMoved = 0;
    player.color = CYAN;
}

void drawPlayer(PLAYER *player) {
    if (player->hasMoved) {
        drawRectangle(player->oldX, player->y, player->width, player->height, BACKGROUNDCOLOR);
        setPixel(player->oldX + 2, player->y - 1, BACKGROUNDCOLOR);
        setPixel(player->oldX + 3, player->y - 1, BACKGROUNDCOLOR);
        setPixel(player->oldX + 4, player->y - 1, BACKGROUNDCOLOR);
        setPixel(player->oldX + 3, player->y - 2, BACKGROUNDCOLOR);
    }
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
    setPixel(player->x + 2, player->y - 1, player->color);
    setPixel(player->x + 3, player->y - 1, player->color);
    setPixel(player->x + 4, player->y - 1, player->color);
    setPixel(player->x + 3, player->y - 2, player->color);
    setPixel(player->x, player->y, BACKGROUNDCOLOR);
    setPixel(player->x + 6, player->y, BACKGROUNDCOLOR);
    drawRectangle(player->x + 2, player->y + 5, 3, 2, BACKGROUNDCOLOR);
    setPixel(player->x + 1, player->y + 6, BACKGROUNDCOLOR);
    setPixel(player->x + 5, player->y + 6, BACKGROUNDCOLOR);
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT) && player.x > 0) {
        player.x -= 1;
        player.hasMoved = 1;
    } else if (BUTTON_HELD(BUTTON_RIGHT && player.x < 233)) {
        player.x += 1;
        player.hasMoved = 1;
    } 
    drawPlayer(&player);
    player.hasMoved = 0;
}

void initEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].x = 0;
        enemies[i].y = 0;
        enemies[i].color = RED;
        enemies[i].width = 5;
        enemies[i].height = 5;
        enemies[i].active = 0;
    }

    for (int i = 0; i < ENEMYCOUNT - 5; i++) {
            if (!enemies[i].active && (i * 15) < 220) {
                enemies[i].x = (i + 1) * 15;
                enemies[i].y = 10;
                enemies[i].active = 1;
            } else if (!enemies[i].active) {
                enemies[i].x = (i - 15 + 1) * 20;
                enemies[i].y = 25;
                enemies[i].active = 1;
            }
    }
}

void drawEnemy(ENEMY *enemy) {
    drawRectangle(enemy->x, enemy->y, enemy->width, enemy->height, enemy->color);
}

void eraseEnemy(ENEMY *enemy) {
    drawRectangle(enemy->x, enemy->y, enemy->width, enemy->height, BACKGROUNDCOLOR);
    enemy->active = 0;
}

void enemyCollision(ENEMY *enemy) {
    if (collision(bullet.x - 1, bullet.y, 3, 4, enemy->x, enemy->y, enemy->width, enemy->height)) {
        enemyErase = 1;
        enemyToErase = enemy;
        bullet.active = 0;
        drawRectangle(bullet.x - 1, bullet.y, 3, 4, BACKGROUNDCOLOR);
        bullet.y = player.y - 6;
    }
}

void updateEnemy() {
    if (enemyToErase) {
        eraseEnemy(enemyToErase);
    }
}

void initBullet() {
    bullet.x = player.x + 3;
    bullet.y = player.y - 6;
    bullet.color = WHITE;
    bullet.hasMoved = 0;
    bullet.oldX = player.x + 3;
    bullet.oldY = player.y - 2;
    bullet.active = 0;
    bullet.width = 3;
    bullet.height = 4;
}

void drawBullet() {
    if (bullet.hasMoved) {
        drawRectangle(bullet.oldX, bullet.oldY, 1, 4, BACKGROUNDCOLOR);
        setPixel(bullet.oldX + 1, bullet.oldY + 1, BACKGROUNDCOLOR);
        setPixel(bullet.oldX - 1, bullet.oldY + 1, BACKGROUNDCOLOR);
    }
    drawRectangle(bullet.x, bullet.y, 1, 4, bullet.color);
    setPixel(bullet.x + 1, bullet.y + 1, RED);
    setPixel(bullet.x - 1, bullet.y + 1, RED);
}

void updateBullet() {
    bullet.oldX = bullet.x;
    bullet.oldY = bullet.y;
    if (BUTTON_PRESSED(BUTTON_A) && bullet.active == 0) {
        bullet.active = 1;
    }
    if (bullet.y == 0) {
        bullet.active = 0;
        drawRectangle(bullet.x - 1, bullet.y, 3, 4, BACKGROUNDCOLOR);
        bullet.y = player.y - 6;
    }
    if (bullet.active) {
        bullet.y--;
        bullet.hasMoved = 1;
        drawBullet();
    }
    if (bullet.active == 0) {
        bullet.x = player.x + 3;
    }
}

