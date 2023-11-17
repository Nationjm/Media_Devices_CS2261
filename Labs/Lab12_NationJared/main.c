#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "list.h"
#include "tiles.h"
#include "spritesheet.h"
#include "print.h"
#include "sprites.h"
#include "mode0.h"

void initialize();
int rand();
void update();
void draw();
void checkForLose();
void checkForFood();
void spawnFood();
int headIsCollidingWithBody();

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

LIST *snakeList;

#define FRAMES_BETWEEN_MOVEMENT 10
#define SNAKE_TILE_ID 1
#define FOOD_TILE_ID 5

enum {UP, RIGHT, DOWN, LEFT};
int direction;

int skipFrames;

enum {GAME, LOSE};
int state = GAME;

#define FOOD_COUNT 1

typedef struct food {
    int tileCol;
    int tileRow;
    int active;
} FOOD;

FOOD food[FOOD_COUNT];

int main() {
    initialize();

    while (1) {
        switch (state) {
            case GAME:
                update();
                waitForVBlank();
                draw();
                break;
            case LOSE:
                if (BUTTON_PRESSED(BUTTON_START)) {
                    initialize();
                }
        }

        oldButtons = buttons;
		buttons = REG_BUTTONS;
    }
}

void initialize() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | 1;

    state = GAME;

    DMANow(3, &tilesTiles, &CHARBLOCK[0], tilesTilesLen / 2);
    DMANow(3, &tilesPal, PALETTE, tilesPalLen / 2);

    // Clear the background out
    u16 emptyTile = 0;
    DMANow(3, &emptyTile, &SCREENBLOCK[31], 1024 | DMA_SOURCE_FIXED);
    for (int i = 0; i < SCREENHEIGHT / 8; i++) {
        SCREENBLOCK[31].tilemap[OFFSET(0, i, 32)] = 1;
        SCREENBLOCK[31].tilemap[OFFSET(SCREENWIDTH / 8 - 1, i, 32)] = 1;
    }
    for (int i = 0; i < SCREENWIDTH / 8; i++) {
        SCREENBLOCK[31].tilemap[OFFSET(i, 0, 32)] = 1;
        SCREENBLOCK[31].tilemap[OFFSET(i, SCREENHEIGHT / 8 - 1, 32)] = 1;
    }

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    // Initialize our snake with 5 nodes lined up horizontally
    snakeList = createList();
    pushFront(snakeList, (POSITION) {.x = 20, .y = 10});
    pushFront(snakeList, (POSITION) {.x = 19, .y = 10});
    pushFront(snakeList, (POSITION) {.x = 18, .y = 10});
    pushFront(snakeList, (POSITION) {.x = 17, .y = 10});
    pushFront(snakeList, (POSITION) {.x = 16, .y = 10});

    direction = LEFT;

    spawnFood();

    mgba_open();
}

void update() {
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        direction = LEFT;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        direction = RIGHT;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        direction = UP;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        direction = DOWN;
    }

    // Cheats for testing
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        pushBack(snakeList, snakeList->tail->position);
    }

    // Move the snake
    skipFrames++;
    if (skipFrames >= FRAMES_BETWEEN_MOVEMENT) {
        skipFrames = 0;
        updateNodePositions(snakeList);
        switch (direction) {
            case UP:
                snakeList->head->position.y--;
                break;
            case RIGHT:
                snakeList->head->position.x++;
                break;
            case DOWN:
                snakeList->head->position.y++;
                break;
            case LEFT:
                snakeList->head->position.x--;
                break;
        }
        checkForFood();
        checkForLose();
    }
}

void checkForLose() {
    POSITION position = snakeList->head->position;

    if (position.x < 1 || position.x > 28 || position.y < 1 || position.y > 18 || headIsCollidingWithBody()) {
        u16 one = SNAKE_TILE_ID;
        DMANow(3, &one, &SCREENBLOCK[31], 1024 | DMA_SOURCE_FIXED);
        state = LOSE;
        deleteList(snakeList); // Stop from leaking memory when we restart the game
    }
}

int headIsCollidingWithBody() {
    NODE* curr = snakeList->head;
    while (curr->next != NULL) {
        curr = curr->next;
        if (curr->position.x == snakeList->head->position.x
         && curr->position.y == snakeList->head->position.y) {
            return 1;
        }
    }
    return 0;
}

void checkForFood() {
    POSITION position = snakeList->head->position;
    for (int i = 0; i < FOOD_COUNT; i++) {
        if (food[i].tileCol == position.x && food[i].tileRow == position.y) {
            food[i].active = 0;
            pushBack(snakeList, snakeList->tail->position);
            spawnFood();
        }
    }
}

void spawnFood() {
    for (int i = 0; i < FOOD_COUNT; i++) {
        if (!food[i].active) {
            food[i].tileCol = 2 + rand() % 26;
            food[i].tileRow = 2 + rand() % 16;
            food[i].active = 1;
            break;
        }
    }
}

void draw() {
    if (state == GAME) {
        int shadowOAMIndex = 0;
        NODE *curr = snakeList->head;

        // Head
        shadowOAM[shadowOAMIndex].attr0 = curr->position.y * 8;
        shadowOAM[shadowOAMIndex].attr1 = curr->position.x * 8;
        shadowOAM[shadowOAMIndex].attr2 = (1 + direction) | ATTR2_PRIORITY(1);
        shadowOAMIndex++;

        // Body
        while (curr->next != NULL) {
            curr = curr->next;
            shadowOAM[shadowOAMIndex].attr0 = curr->position.y * 8;
            shadowOAM[shadowOAMIndex].attr1 = curr->position.x * 8;
            shadowOAM[shadowOAMIndex].attr2 = 0 | ATTR2_PRIORITY(1);
            shadowOAMIndex++;
        }

        for (int i = 0; i < FOOD_COUNT; i++) {
            shadowOAM[shadowOAMIndex].attr0 = food[i].tileRow * 8;
            shadowOAM[shadowOAMIndex].attr1 = food[i].tileCol * 8;
            shadowOAM[shadowOAMIndex].attr2 = FOOD_TILE_ID;
            shadowOAMIndex++;
        }

        DMANow(3, shadowOAM, OAM, 512);
    }
}