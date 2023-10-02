#include "gba.h"
#include "print.h"

// Prototypes
void init();
void draw();
void update();
void drawPlayer();

// Extern Vars
unsigned short buttons;
unsigned short oldButtons;

// TODO 1.0 Put together a player struct with (x,y), old (x,y), width, height, color, and whether the player has moved
typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    unsigned short color;
    int hasMoved;

} PLAYER;

// TODO 1.1 Declare two players, and a player pointer
PLAYER player1;
PLAYER player2;
PLAYER* playerPtr;

int main() {
    init();
    while (1) {
        oldButtons = buttons;
		buttons = REG_BUTTONS;

        update();
        waitForVBlank();
        draw();
    }
}

void init() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    fillScreen(WHITE);

    oldButtons = 0;
	buttons = REG_BUTTONS;

    // TODO 1.2 Initialize your two players
    player1.x = 20;
    player1.y = 20;
    player1.oldX = 20;
    player1.oldY = 20;
    player1.color = BLUE;
    player1.width = 10;
    player1.height = 20;
    player1.hasMoved = 1;

    player2.x = 20;
    player2.y = 20;
    player2.oldX = 20;
    player2.oldY = 20;
    player2.color = MAGENTA;
    player2.width = 20;
    player2.height = 10;
    player2.hasMoved = 1;
    
    

    // TODO 1.3 Initalize your player pointer to point to player 1
    playerPtr = &player1;
}

void update() {
    // TODO 2.0 Update the oldX and oldY referenced by your player pointer
    playerPtr->oldX = playerPtr->x;
    playerPtr->oldY = playerPtr->y;
    
    // TODO 2.1 Switch which player the player pointer is referencing using buttons A and B
    if (BUTTON_PRESSED(BUTTON_A)) {
        playerPtr = &player1;
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        playerPtr = &player2;
    }

    // TODO 2.2 Update the player's location and moved status based on button inputs
    if (BUTTON_HELD(BUTTON_UP)) {
        playerPtr->y -= 1;
        playerPtr->hasMoved = 1;
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
        playerPtr->y += 1;
        playerPtr->hasMoved = 1;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
        playerPtr->x += 1;
        playerPtr->hasMoved = 1;
	} else if (BUTTON_HELD(BUTTON_LEFT)) {
        playerPtr->x -= 1;
        playerPtr->hasMoved = 1;
	}
}

void draw() {
    // TODO 2.3 Call your drawPlayer method twice with a pointer to each player
    drawPlayer(&player1);
    drawPlayer(&player2);
}

void drawPlayer(PLAYER* current) {
    //TODO 2.4 Draw a rectangle based on the player pointer you've been given
    if (current->hasMoved) {
        drawRect(current->oldX, current->oldY, current->width, current->height, WHITE);
        current->hasMoved = 0;
    }
    drawRect(current->x, current->y, current->width, current->height, current->color);
}