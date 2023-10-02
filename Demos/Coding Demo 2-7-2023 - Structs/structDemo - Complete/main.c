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

enum {
    STATIONARY=0,
    MOVED=1
};

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    int color;
    int moved;
    int hide;
} PLAYER;

PLAYER* player; 
PLAYER player1;
PLAYER player2;

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

    player1.x = 100;
    player1.y = 100;
    player1.oldX = 100;
    player1.oldY = 100;
    player1.width = 20;
    player1.height = 40;
    player1.color = RED;
    player1.moved = MOVED;
    player1.hide = 0;

    player2.x = 0;
    player2.y = 0;
    player2.oldX = 0;
    player2.oldY = 0;
    player2.width = 40;
    player2.height = 20;
    player2.color = BLUE;
    player2.moved = MOVED;
    player2.hide = 0;

    player = &player1;
}

void update() {
    // UNCOMMENT #4
    player->oldX = player->x;
    player->oldY = player->y;

    if (BUTTON_PRESSED(BUTTON_A)) {
        player = &player1;
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        player = &player2;
    }

    if (BUTTON_HELD(BUTTON_UP) && (player->y > 0)) {
		player->y = (player->y - 1);
        player->moved = MOVED;
	} else if (BUTTON_HELD(BUTTON_DOWN) && (player->y < (160 - player->height))) {
		player->y = (player->y + 1);
        player->moved = MOVED;
	}
	if (BUTTON_HELD(BUTTON_RIGHT) && (player->x < (240 - player->width))) {
		player->x = (player->x + 1);
        player->moved = MOVED;
	} else if (BUTTON_HELD(BUTTON_LEFT) && (player->x > 0)) {
		player->x = (player->x - 1);
        player->moved = MOVED;
	}
}

void draw() {
    drawPlayer(&player1);
    drawPlayer(&player2);
}

void drawPlayer(PLAYER* current) {
    if (current->moved) {
        drawRect(current->oldX, current->oldY, current->width, current->height, WHITE);
        current->moved = STATIONARY;
    }
    drawRect(current->x, current->y, current->width, current->height, current->color);
}