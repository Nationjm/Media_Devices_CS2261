typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    int xVel;
    int yVel;
    unsigned short color; 
    int active;
    int hasMoved;     
    int erased;
} RECTANGLE;

// Objects
RECTANGLE player;

// TODO 1.0 Size your object pool
#define BULLETCOUNT 10

// TODO 1.1 Create your object pool
RECTANGLE bullets[BULLETCOUNT];

// TODO 1.2 Define constants for your object pool
#define BULLETSPEED 1
#define BULLETCOLOR RED

#define BACKGROUNDCOLOR WHITE

// Prototypes
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer(RECTANGLE*);

void initBullets();
void updateBullets();
void newBullet(int x, int y, int xVel, int yVel);
void drawBullets();