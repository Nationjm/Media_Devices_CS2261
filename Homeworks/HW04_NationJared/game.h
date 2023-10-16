// custom game colors
#define NUMCOLORS 10
// make the custom colors the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), WHITEID, GRAYID, REDID, GREENID, BLUEID, CYANID, MAGENTAID, YELLOWID, ORANGEID};
extern unsigned short colors[NUMCOLORS];

// Constants
#define CONECOUNT 7

// Structs
typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int yVel;
} CAR;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int active;
} CONE;

// Initialize player and object pooling objects
CAR car;
CONE cones[CONECOUNT];

// state function prototypes
void start();
int game(int frameCount);
void pause();
void highScore(int frameCount);
void lose();
void scoreboard();

// initialize function prototype
void initGame();

// Game Function Prototypes
void initGamePal();

// Car Function Prototypes
void drawCar();
void updateCar();
void initCar();
int carCollision(CONE *cone);

// Cone Function Prototypes
void drawCone(CONE *cone);
int updateCones();
void initCones();
