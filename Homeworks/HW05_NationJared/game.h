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
void game1();
void game2();
void pause();
void win();
void lose();