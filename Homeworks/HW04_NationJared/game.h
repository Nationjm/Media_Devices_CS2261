// state function prototypes
void start();
void game();
void pause();
void win();
void lose();

// initialize function prototype
void initGame();

// custom game colors
#define NUMCOLORS 10
// make the custom colors the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), WHITEID, GRAYID, REDID, GREENID, BLUEID, CYANID, MAGENTAID, YELLOWID, ORANGEID};
extern unsigned short colors[NUMCOLORS];