// Game State Prototypes
void start();
void instructions();
void kaido1();
void pause();
void win();
void lose();

// Game State Change Prototypes
void goToStart();
void goToInstructions();
void goToKaido1();
void goToPause();
void goToWin();
void goToLose();

// Luffy Functions
void luffyUpdate();
void initLuffy();
void luffyPunching();
void luffyJumping();
// Kaido Functions
void initKaido();
void kaidoUpdate();

// Object Structs
typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int yVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int punching;
    int punchingTime;
    int jumping;
    int jumpingTime;
    unsigned char oamIndex;
} LUFFY;
LUFFY luffy;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int attacking;
    int attackingTime;
    unsigned char oamIndex;
} KAIDO;
KAIDO kaido;