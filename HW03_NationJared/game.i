# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 23 "gba.h"
extern volatile unsigned short* videoBuffer;
# 35 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 55 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "game.c" 2
# 1 "game.h" 1




typedef struct {
    int x;
    int y;
    int oldX;
    int width;
    int height;
    int hasMoved;
    unsigned short color;
} PLAYER;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int active;
    unsigned short color;
} ENEMY;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int hasMoved;
    int active;
    int width;
    int height;
    unsigned short color;
} BULLET;

PLAYER player;
ENEMY enemies[30];
BULLET bullet;


void start(int drawStart);
void game(int drawGame);
void pause(int drawPause);
void win(int drawWin);
void lose();


void drawPlayer(PLAYER *player);
void initPlayer();
void drawPlayer();
void updatePlayer();
void initEnemies();
void drawEnemy(ENEMY *enemy);
void eraseEnemy(ENEMY *enemy);
void enemyCollision();
void updateEnemy();
# 3 "game.c" 2

ENEMY *enemyToErase;
int enemyErase = 0;
int activeEnemies = 25;

void start(int drawStart) {
    if (drawStart == 1) {
        fillScreen((((31) & 31) | ((20) & 31) << 5 | ((0) & 31) << 10));
        drawString(85, 67, "Press Start", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    }
}

void game(int drawGame) {
    player.oldX = player.x;
    if (drawGame == 1) {
        fillScreen((((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        for (int i = 0; i < 30; i++) {
            if (enemies[i].active) {
                drawEnemy(&enemies[i]);
            }
        }
    }
    drawPlayer(&player);
    updateBullet();
    for (int i = 0; i < 30; i++) {
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
        fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    }
    drawString(100, 70, "Pause", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
}

void win(int drawWin) {
    if (drawWin) {
        fillScreen((((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    }
    drawString(100, 70, "You Win!", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
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
    player.color = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
}

void drawPlayer(PLAYER *player) {
    if (player->hasMoved) {
        drawRectangle(player->oldX, player->y, player->width, player->height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((player->y - 1) * (240) + (player->oldX + 2))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((player->y - 1) * (240) + (player->oldX + 3))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((player->y - 1) * (240) + (player->oldX + 4))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((player->y - 2) * (240) + (player->oldX + 3))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    }
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
    (videoBuffer[((player->y - 1) * (240) + (player->x + 2))] = player->color);
    (videoBuffer[((player->y - 1) * (240) + (player->x + 3))] = player->color);
    (videoBuffer[((player->y - 1) * (240) + (player->x + 4))] = player->color);
    (videoBuffer[((player->y - 2) * (240) + (player->x + 3))] = player->color);
    (videoBuffer[((player->y) * (240) + (player->x))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    (videoBuffer[((player->y) * (240) + (player->x + 6))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    drawRectangle(player->x + 2, player->y + 5, 3, 2, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    (videoBuffer[((player->y + 6) * (240) + (player->x + 1))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    (videoBuffer[((player->y + 6) * (240) + (player->x + 5))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
}

void updatePlayer() {
    if ((~buttons & (1<<5)) && player.x > 0) {
        player.x -= 1;
        player.hasMoved = 1;
    } else if ((~buttons & (1<<4) && player.x < 233)) {
        player.x += 1;
        player.hasMoved = 1;
    }
    drawPlayer(&player);
    player.hasMoved = 0;
}

void initEnemies() {
    for (int i = 0; i < 30; i++) {
        enemies[i].x = 0;
        enemies[i].y = 0;
        enemies[i].color = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        enemies[i].width = 5;
        enemies[i].height = 5;
        enemies[i].active = 0;
    }

    for (int i = 0; i < 30 - 5; i++) {
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
    drawRectangle(enemy->x, enemy->y, enemy->width, enemy->height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    enemy->active = 0;
}

void enemyCollision(ENEMY *enemy) {
    if (collision(bullet.x - 1, bullet.y, 3, 4, enemy->x, enemy->y, enemy->width, enemy->height)) {
        enemyErase = 1;
        enemyToErase = enemy;
        bullet.active = 0;
        drawRectangle(bullet.x - 1, bullet.y, 3, 4, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
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
    bullet.color = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    bullet.hasMoved = 0;
    bullet.oldX = player.x + 3;
    bullet.oldY = player.y - 2;
    bullet.active = 0;
    bullet.width = 3;
    bullet.height = 4;
}

void drawBullet() {
    if (bullet.hasMoved) {
        drawRectangle(bullet.oldX, bullet.oldY, 1, 4, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((bullet.oldY + 1) * (240) + (bullet.oldX + 1))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        (videoBuffer[((bullet.oldY + 1) * (240) + (bullet.oldX - 1))] = (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    }
    drawRectangle(bullet.x, bullet.y, 1, 4, bullet.color);
    (videoBuffer[((bullet.y + 1) * (240) + (bullet.x + 1))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    (videoBuffer[((bullet.y + 1) * (240) + (bullet.x - 1))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
}

void updateBullet() {
    bullet.oldX = bullet.x;
    bullet.oldY = bullet.y;
    if ((((~buttons & (1<<0)) && !(~oldButtons & (1<<0)))) && bullet.active == 0) {
        bullet.active = 1;
    }
    if (bullet.y == 0) {
        bullet.active = 0;
        drawRectangle(bullet.x - 1, bullet.y, 3, 4, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
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
