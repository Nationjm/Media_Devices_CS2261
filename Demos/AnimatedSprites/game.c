#include "gba.h"
#include "mode4.h"
#include "sprites.h"
#include "game.h"

// Variables
OBJ_ATTR shadowOAM[128];
SPRITE car;
typedef enum {UP, RIGHT, DOWN, LEFT} DIRECTION;

// Initialize the game
void initGame() {
    initCar();
}

// Updates the game each frame
void updateGame() {
    updateCar();
}

// Draws the game each frame
void drawGame() {
    drawCar();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Initialize the car
void initCar() {
    car.x = 120; 
    car.y = 80;
    car.direction = RIGHT;
    car.xVel = 1; 
    car.yVel = 1; 
    car.width = 16; 
    car.height = 16; 
    car.oamIndex = 0;
    car.hide = 0;
    car.isAnimating = 0;
    car.currentFrame = 0;
    car.numFrames = 3;
    car.timeUntilNextFrame = 20;
}


// Handle every-frame actions of the car
void updateCar() {
    car.isAnimating = 0;
    if(BUTTON_HELD(BUTTON_UP)) {
        if(car.y > 0){
            car.y -= car.yVel;
        }
        car.isAnimating = 1;
        car.direction = UP;
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if(car.y < 160 - car.height){
            car.y += car.yVel;
        }
        car.isAnimating = 1;
        car.direction = DOWN;
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if(car.x > 0){
            car.x -= car.xVel;
        }
        car.isAnimating = 1;
        car.direction = LEFT; 
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if(car.x < 240 - car.width){

            car.x += car.xVel;
        }
        car.direction = RIGHT;
        car.isAnimating = 1;
    }

    if (car.isAnimating) {
        car.timeUntilNextFrame--;
        if (car.timeUntilNextFrame == 0) {
            car.currentFrame = (car.currentFrame + 1) % car.numFrames;
            car.timeUntilNextFrame = 20;
        }
    } else {
        car.currentFrame = 0;
    }
}

// Draw the car
void drawCar() {
    
    shadowOAM[car.oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(car.y);
    shadowOAM[car.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(car.x);
    shadowOAM[car.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | (512 + ATTR2_TILEID((car.direction * 2), (car.currentFrame * 2)));
    if (car.hide) {
        shadowOAM[car.oamIndex].attr0 |= ATTR0_HIDE;       
    }
}