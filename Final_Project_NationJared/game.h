#define ALIGN(x) __attribute__((aligned(x)))

// Constants
#define LIGHTNINGCOUNT 4
#define FIREBALLCOUNT 5
#define LIGHTNINGSPEED 2

#define REG_MOSAIC *(u32*)0x400004C


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
    int lightning;
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
FIREBALL fireballs[FIREBALLCOUNT];

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int timeUntilNextShot;
    int active;
    int direction;
    unsigned char oamIndex;
} LIGHTNING;
LIGHTNING lightning[LIGHTNINGCOUNT];

// Game State Prototypes
void start();
void instructions();
void kaido1();
void kaido2();
void pause();
void win();
void lose();

// Game State Change Prototypes
void goToStart();
void goToInstructions();
void goToKaido1();
void goToKaido2();
void goToPause();
void goToWin();
void goToLose();

// Luffy Functions
void luffyUpdate();
void initLuffy();
void luffyPunching();
void luffyJumping();
void gearFive();
void groundChange();
void luffyUpdate2();
// Lightning Functions
void lightningUpdate();
void luffyLightningThrow();
void initLightning();


// Kaido Functions
void initKaido();
void kaidoUpdate();
void kaidoUpdate2();
// Fireball Functions
void fireballUpdate();
void shootFireball();
void fireballUpdate2();
void initFireball2();
void shootFireball2(FIREBALL *fireball);

// Collision Functions
int fireballCollision();
int punchCollision();
int lightningCollision(LIGHTNING *lightning);
int fireballCollision2(FIREBALL *fireball);

// Sound Functions
void setupSounds();
void setupInterrupts();
void interruptHandler();
