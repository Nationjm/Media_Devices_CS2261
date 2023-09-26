#include "print.h"
#include "gba.h"

unsigned short oldButtons;
unsigned short buttons;

void draw();
void update();

int playerWidth = 20;
int playerHeight = 20;

int playerX = 20;
int playerY = 20;

int oldPlayerX;
int oldPlayerY;

int canMoveDown();
int canMoveUp();

#define SCREENCOLOR WHITE


void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    fillScreen(SCREENCOLOR);
    mgba_open();
    mgba_printf_level(1, "Debugger Opened");
}

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        update();
        waitForVBlank();
        draw();
    }
    return 0;
}

void draw() {
    drawRect(oldPlayerX, oldPlayerY, playerWidth, playerHeight, SCREENCOLOR);
    drawRect(playerX, playerY, playerWidth, playerHeight, BLUE);

}

void update() {
    oldPlayerX = playerX;
    oldPlayerY = playerY;
    if (BUTTON_HELD(BUTTON_DOWN) && (canMoveDown())) {
        playerY += 1;
        mgba_printf("User is trying to go down!");
    } else if (BUTTON_HELD(BUTTON_UP) && (canMoveUp())) {
        playerY -= 1;
    mgba_printf("User is trying to go up!");
    }
}

int canMoveUp() {
    int canMoveUp = (playerY > 0);
    return canMoveUp;
}

int canMoveDown() {
    int canMoveDown = playerY + playerHeight < (SCREENHEIGHT);
    return canMoveDown;
}