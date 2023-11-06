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
    unsigned char oamIndex;
} LUFFY;
  
LUFFY luffy;