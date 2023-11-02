// States enum
enum {
    START,
    PAUSE,
    GAME1,
    GAME2,
    WIN,
    LOSE
} STATE;

// State function prototypes
void start();
void game1(int);
void game2(int);
void pause();
void win();
void lose();

// State Machine Traversal Function Prototypes
void goToStart();
void goToGame1();
void goToGame2();
void goToPause();
void goToWin();
void goToLose();