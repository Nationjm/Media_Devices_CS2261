#define ORANGE RGB(31, 20, 0)
#define BACKGROUNDCOLOR RGB(1, 1, 3)
#define ENEMYCOUNT 30

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

PLAYER player;
ENEMY enemies[ENEMYCOUNT];
BULLET bullet;
POWERUP powerUP;

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