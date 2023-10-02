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
void DMANow(int channel, volatile void *src, volatile void *dst, unsigned int cnt);
# 74 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "game.c" 2
# 1 "game.h" 1




typedef struct {
    int x;
    int y;
    int oldX;
    int width;
    int xVel;
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

typedef struct {
    int x;
    int y;
    int oldY;
    int width;
    int height;
    int active;
    unsigned short color;
} POWERUP;

typedef struct {
    int x;
    int y;
    int oldX;
    int width;
    int height;
    int hasMoved;
    unsigned short color;
} DANGERZONE;

PLAYER player;
ENEMY enemies[30];
BULLET bullet;
POWERUP powerUP;
DANGERZONE dangerZone;

void start(int drawStart);
void game(int drawGame);
void pause(int drawPause);
void win(int drawWin);


void drawPlayer(PLAYER *player);
void initPlayer();
void initBullet();
void goToPause();
void goToGame();
void updateBullet();
void goToWin();
void drawPlayer();
void updatePlayer();
void initEnemies();
void drawEnemy(ENEMY *enemy);
void eraseEnemy(ENEMY *enemy);
void enemyCollision();
void updateEnemy();
void drawEnemies();
void drawDangerZone();
void drawPowerUP();
void dropPowerUP();
void powerUPCollision();
void updatePowerUP();
void initDangerZone();
void drawDangerZone();
void dangerZoneCollision();
# 3 "game.c" 2
# 1 "analogSound.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 263 "analogSound.h"
enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(u8 r, u8 s, u8 b, u8 length, u8 steptime);
void playNoteWithDuration(NoteWithDuration *n, u8 duty);
void playChannel1(u16 note, u8 length, u8 sweepShift, u8 sweepTime, u8 sweepDir, u8 envStepTime, u8 envDir, u8 duty);
void playAnalogSound(u16 sound);
# 4 "game.c" 2

ENEMY *enemyToErase;
int enemyErase = 0;
int activeEnemies = 25;
int noShoot = 0;

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
    drawDangerZone();
    drawPlayer(&player);
    updateBullet();
    updatePowerUP();
    for (int i = 0; i < 30; i++) {
        if (enemies[i].active) {
            enemyCollision(&enemies[i]);
            if (enemyErase == 1) {
                activeEnemies--;
                updateEnemy();
                if (rand() % 20 == 0) {
                    dropPowerUP(&enemies[i]);
                }
                if (activeEnemies == 10) {
                    dangerZone.hasMoved = 1;
                    dangerZone.x = rand() % 230;
                    mgba_printf("%d", dangerZone.x);
                }
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

void initPlayer() {
    player.x = 130;
    player.y = 150;
    player.oldX = 130;
    player.width = 7;
    player.height = 7;
    player.hasMoved = 0;
    player.xVel = 1;
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
        player.x -= player.xVel;
        player.hasMoved = 1;
    } else if ((~buttons & (1<<4) && player.x < 232)) {
        player.x += player.xVel;
        player.hasMoved = 1;
    }
    drawPlayer(&player);
    player.hasMoved = 0;
    dangerZoneCollision();
}

void initEnemies() {
    for (int i = 0; i < 30; i++) {
        enemies[i].x = 0;
        enemies[i].y = 0;
        enemies[i].color = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
        enemies[i].width = 7;
        enemies[i].height = 7;
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
        playAnalogSound(2);
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
    if ((((~buttons & (1<<0)) && !(~oldButtons & (1<<0)))) && bullet.active == 0 && noShoot == 0) {
        playAnalogSound(4);
        bullet.active = 1;
    }
    if (bullet.y == 0) {
        bullet.active = 0;
        drawRectangle(bullet.x - 1, bullet.y, 3, 4, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        bullet.y = player.y - 6;
    }
    if (bullet.active) {
        bullet.y -= 2;
        bullet.hasMoved = 1;
        drawBullet();
    }
    if (bullet.active == 0) {
        bullet.x = player.x + 3;
    }
}

void initPowerUP() {
    powerUP.x = 15;
    powerUP.y = 15;
    powerUP.oldY = 0;
    powerUP.active = 0;
    powerUP.width = 3;
    powerUP.height = 3;
    powerUP.color = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);
}

void dropPowerUP(ENEMY *enemy) {
    if (enemyErase) {
        powerUP.x = bullet.x;
        powerUP.y = enemy->y;
        powerUP.oldY = enemy->y;
        powerUP.active = 1;
    }
}

void drawPowerUP() {
    drawRectangle(powerUP.x, powerUP.y - 1, powerUP.width, powerUP.height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    drawRectangle(powerUP.x, powerUP.y, powerUP.width, powerUP.height, powerUP.color);
    if (powerUP.y > 159){
        drawRectangle(powerUP.x, powerUP.y, powerUP.width, powerUP.height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        powerUP.active = 0;
    }
}

void powerUPCollision() {
    if (collision(powerUP.x, powerUP.y, powerUP.width, powerUP.height, player.x, player.y, player.width, player.height)) {
        player.xVel = 2;
        powerUP.active = 0;
        drawRectangle(powerUP.x, powerUP.y, powerUP.width, powerUP.height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
    }
}

void updatePowerUP() {
    powerUP.oldY = powerUP.y;
    if (powerUP.active == 1) {
        drawPowerUP();
        powerUPCollision();
        powerUP.y++;
    }
}

void initDangerZone() {
    dangerZone.color = (((31) & 31) | ((20) & 31) << 5 | ((0) & 31) << 10);
    dangerZone.x = rand() % 230;
    mgba_printf("%d", dangerZone.x);
    dangerZone.oldX = dangerZone.x;
    dangerZone.y = 147;
    dangerZone.width = 12;
    dangerZone.height = 12;
    dangerZone.hasMoved = 0;
}

void drawDangerZone() {
    if (dangerZone.hasMoved) {
        drawRectangle(dangerZone.oldX, dangerZone.y, dangerZone.width, dangerZone.height, (((1) & 31) | ((1) & 31) << 5 | ((3) & 31) << 10));
        dangerZone.hasMoved = 0;
    }
    drawRectangle(dangerZone.x, dangerZone.y, dangerZone.width, dangerZone.height, dangerZone.color);
}

void dangerZoneCollision() {
    if (collision(player.x, player.y, player.width, player.height, dangerZone.x, dangerZone.y, dangerZone.width, dangerZone.height)) {
        noShoot = 1;
        player.color = (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);
    } else {
        noShoot = 0;
        player.color = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    }
}
