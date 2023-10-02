#include "gba.h"
#include "print.h"

// Variables
unsigned short buttons;
unsigned short oldButtons;
int lives;
int stopDrawing = 0;
int draw = 0;

// Enums
enum STATE{GAME, WIN, LOSE} state;
enum {
    STATIONARY = 0,
    MOVED = 1
};
enum {
    LEFT = 0,
    RIGHT = 1
};
enum {
    COLLIDING = 1,
    NOT = 0
};

// Structs
typedef struct {
    int x;
    int y; 
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    int active;
    unsigned short color;
    unsigned short direction;
} CAR;

CAR* car;
CAR car1;
CAR car2;
CAR car3;
CAR car4;
CAR car5;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    int active;
    unsigned short direction;
} LOG;

LOG* log;
LOG log1;
LOG log2;
LOG log3;
LOG log4;
LOG log5;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    unsigned short color;
    unsigned short colliding;
} PLAYER;

PLAYER* player;
PLAYER player1;

void initialize();

int main() {

    initialize();
    backgroundColors();
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        update();
        waitForVBlank();

        switch(state) {
            case GAME:
                game();
                stopDrawing = 0;
                if (lives == 0) {
                    state = LOSE;
                } 
                if (player1.y < 20) {
                    state = WIN;
                }
                drawLogs(&log1);
                drawLogs(&log2);
                drawLogs(&log3);
                drawLogs(&log4);
                drawLogs(&log5);
                drawCar(&car1);
                drawCar(&car2);
                drawCar(&car3);
                drawCar(&car4);
                drawCar(&car5);
                drawPlayer(&player1);
                lifeDisp(lives);
                break;
            case WIN:
                win(stopDrawing);
                stopDrawing = 1;
                if (BUTTON_PRESSED(BUTTON_A)) {
                    backgroundColors();
                    lives = 3;
                    player1.x = 115;
                    player1.y = 141;
                    state = GAME;
                }
                break;
            case LOSE:
                lose(stopDrawing);
                stopDrawing = 1;
                if (BUTTON_PRESSED(BUTTON_A)) {
                    backgroundColors();
                    player1.x = 115;
                    player1.y = 141;
                    lives = 3;
                    state = GAME;
                }
                break;
        }
        
    }
    
    return 0;

}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    state = GAME;
    player1.x = 115;
    player1.y = 141;
    player1.oldX = 115;
    player1.oldY = 141;
    player1.height = 8;
    player1.width = 8;
    player1.moved = STATIONARY;
    player1.color = WHITE;
    player1.colliding = NOT;

    player = &player1;

    log1.x = 214;
    log1.y = 21;
    log1.oldX = 214;
    log1.oldY = 21;
    log1.width = 16;
    log1.height = 8;
    log1.direction = LEFT;

    log2.x = 10;
    log2.y = 31;
    log2.oldX = 10;
    log2.oldY = 31;
    log2.width = 16;
    log2.height = 8;
    log2.direction = RIGHT;

    log3.x = 156;
    log3.y = 41;
    log3.oldX = 156;
    log3.oldY = 41;
    log3.width = 16;
    log3.height = 8;
    log3.direction = LEFT;

    log4.x = 60;
    log4.y = 51;
    log4.oldX = 60;
    log4.oldY = 51;
    log4.width = 16;
    log4.height = 8;
    log4.direction = RIGHT;

    log5.x = 106;
    log5.y = 61;
    log5.oldX = 106;
    log5.oldY = 61;
    log5.width = 16;
    log5.height = 8;
    log5.direction = LEFT;

    car1.x = 214;
    car1.y = 81;
    car1.oldX = 214;
    car1.oldY = 81;
    car1.width = 16;
    car1.height = 8;
    car1.color = YELLOW;
    car1.direction = LEFT;

    car2.x = 23;
    car2.y = 101;
    car2.oldX = 23;
    car2.oldY = 101;
    car2.width = 16;
    car2.height = 8;
    car2.color = RED;
    car2.direction = RIGHT;

    car3.x = 56;
    car3.y = 121;
    car3.oldX = 56;
    car3.oldY = 121;
    car3.width = 16;
    car3.height = 8;
    car3.color = CYAN;
    car3.direction = LEFT;
 
    lives = 3;
}

void update() {
    player->oldX = player->x;
    player->oldY = player->y;


    if (BUTTON_PRESSED(BUTTON_UP) && player->y > 20) {
        player->y = (player->y - 10);
        player->moved = MOVED;
    } else if (BUTTON_PRESSED(BUTTON_DOWN) && player->y < 140) {
        player->y = (player->y + 10);
        player->moved = MOVED;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT) && player->x > 20) {
        player->x = (player->x - 10);
        player->moved = MOVED;
    } else if (BUTTON_PRESSED(BUTTON_RIGHT) && player->x < 210) {
        player->x = (player->x + 10);
        player->moved = MOVED;
    }
    
}

void drawPlayer(PLAYER* player) {
    if (player->moved && (player->oldY >= 140)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, GREEN);
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 80)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, GRAY);
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 70)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, GREEN);
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 20)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, BLUE);
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 10)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, GREEN);
        player->moved = STATIONARY;
    }
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
    if (player->y > 20 && player->y < 70 && player->colliding == NOT) {
        drawRectangle(player->x, player->y, player->width, player->height, BLUE);
        player->x = 115;
        player->y = 141;
        lives -= 1;
    }
    player1.colliding = NOT;
}

void drawLogs(LOG* log) {
    drawRectangle(log->oldX, log->oldY, log->width, log->height, BLUE);
    log->oldX = log->x;
    log->oldY = log->y;
    drawRectangle(log->x, log->y, log->width, log->height, BROWN);
    if (log->x > 10 && log->direction == LEFT) {
        log->x -= 1;
    } else if (log->x <= 10 && log->direction == LEFT) {
        log->x = 214;
    } else if (log->x < 214 && log->direction == RIGHT) {
        log->x += 1;
    } else if (log->x >= 214 && log->direction == RIGHT) {
        log->x = 10;
    }
    if (log->x < player1.x + player1.width && log->x + log->width > player1.x && log->y < player1.y + player1.height && log->y + log->height > player1.y){
        if (log->direction == LEFT) {
            player1.x -= 1;
            player1.colliding = COLLIDING;
            player1.moved = MOVED;
            if (log->x < 10) {
                player1.colliding = NOT;
            }
        } else {
            player1.x += 1;
            player1.colliding = COLLIDING;
            player1.moved = MOVED;
            if (log->x > 214) {
                player1.colliding = NOT;
            }
        }
    } 
}

void drawCar(CAR* car) {
    drawRectangle(car->oldX, car->oldY, car->width, car->height, GRAY);
    car->oldX = car->x;
    car->oldY = car->y;
    drawRectangle(car->x, car->y, car->width, car->height, car->color);
    if (car->x > 10 && car->direction == LEFT) {
        car->x -= 1;
    } else if (car->x <= 10 && car->direction == LEFT) {
        car->x = 214;
    } else if (car->x < 214 && car->direction == RIGHT) {
        car->x += 1;
    } else if (car->x >= 214 && car->direction == RIGHT) {
        car->x = 10;
    }
    if (car->x < player1.x + player1.width && car->x + car->width > player1.x && car->y < player1.y + player1.height && car->y + car->height > player1.y) {
        drawRectangle(player1.x, player1.y, 8, 8, GRAY);
        player1.x = 115;
        player1.y = 141;
        lives -= 1;
    }
}