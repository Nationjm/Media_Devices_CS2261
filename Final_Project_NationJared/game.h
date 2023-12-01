#define ALIGN(x) __attribute__((aligned(x)))

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
void gearFive();

// Kaido Functions
void initKaido();
void kaidoUpdate();
// Fireball Functions
void fireballUpdate();
void shootFireball();

// Collision Functions
int fireballCollision();
int punchCollision();

// Sound Functions
void setupSounds();
void setupInterrupts();
void interruptHandler();


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
    unsigned char oamIndex;
} LUFFYFIST;
LUFFYFIST luffyFist;

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

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int timeUntilNextFrame;
    int numFrames;
    int frame;
    int shooting;
    int timeUntilNextShot;
    unsigned char oamIndex;
} FIREBALL;
FIREBALL fireball;