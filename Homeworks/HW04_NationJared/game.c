#include "game.h"
#include "mode4.h"
#include "print.h"
#include "gba.h"
#include "road.h"
#include "car.h"
#include "cone.h"
#include <stdio.h>
#include "car2.h"
#include "rocket.h"
#include "explosion.h"
#include "explosion2.h"
#include "analogSound.h"

int score = 0; // score variable

int highscore = 0; // highscore variable to update over multiple game attempts
int highscoreUpdate = 0; // variable for if the highscore is update in this game


char printScore[41]; // score text buffer
char printHighScore[41]; // high score text buffer

void initGame() {
    // initializing colors
    unsigned short colors[NUMCOLORS] = {BLACK, WHITE, GRAY, RED, GREEN, BLUE, CYAN, MAGENTA, YELLOW, ORANGE};
    
    // load the custom game colors to the end of the palette
    initGamePal();
    for (int i = 0; i < NUMCOLORS; i++) {
        BG_PALETTE[256-NUMCOLORS+i] = colors[i];
    }
    initSound();
}

// State Functions

void start() {
    // Reinitialize the cones and car when entering the start state
    initCones();
    initCar();
    // Revert score and the highscore checker back to 0
    score = 0;
    highscoreUpdate = 0;
    // Draw the start state
    fillScreen4(ORANGEID);
    drawString4(60, 70, "Press Start to Begin!", BLACKID);
    drawString4(35, 85, "Press Select to View High Score!", BLACKID);
}

int game(int frameCount) {
    int gameOver = 0;

    // background drawing
    drawFullscreenImage4(roadBitmap);
    // game function
    updateCar();
    gameOver = updateCones();

    if (frameCount % 120 == 0) {
        int coneCounter = 0;
        score += 10;
        if (score > highscore) {
            highscore = score;
            highscoreUpdate = 1;
        }
        for (int i = 0; i < CONECOUNT; i++) {
            if (cones[i].active == 0) {
                cones[i].active = 1;
                coneCounter += 1;
                if (coneCounter == 2) {
                    break;
                }
            }
        }
    }
    if (frameCount % 640 == 0) {
        for (int i = 0; i < CONECOUNT; i++) {
            cones[i].xVel += 1;
        }
    }

    // draw score on the bottom right of the screen
    drawRectangle4(180, 150, 60, 10, BLACKID);
    drawString4(180, 151, "Score: ", WHITEID);
    sprintf(printScore, "%d", score);
    drawString4(220, 151, printScore, WHITEID);

    if (highscoreUpdate && gameOver) {
        return 3;
    } else {
        return gameOver;
    }
}

void pause() {
    fillScreen4(CYANID);
    drawString4(100, 70, "PAUSED", GRAYID);
    drawString4(50, 85, "Press Select to Continue", GRAYID);
}

void highScore(int frameCount) {
    fillScreen4(GREENID);
    drawString4(80, 70, "New High Score!", BLACKID);
    drawString4(50, 85, "Press Start to Continue", BLACKID);
    if (frameCount < 30) {
        drawImage4(10, 100, 32, 32, rocketBitmap);
    }
    if (frameCount < 60 && frameCount > 30) {
        drawImage4(10, 60, 32, 32, rocketBitmap);
    }
    if (frameCount < 90 && frameCount > 60) {
        drawImage4(10, 30, 32, 32, explosionBitmap);
    }
    if (frameCount < 120 && frameCount > 90) {
        drawImage4(-3, 14, 64, 64, explosion2Bitmap);
        playAnalogSound(17);
    }

}

void lose() {
    fillScreen4(REDID);
    drawString4(85, 70, "Game Over", BLACKID);
    drawString4(50, 85, "Press Start to Continue", BLACKID);
}

void scoreboard() {
    fillScreen4(YELLOWID);
    sprintf(printHighScore, "%d", highscore);
    drawString4(140, 70, printHighScore, BLACKID);
    drawString4(70, 70, "High Score: ", BLACKID);
    drawString4(35, 85, "Press Select to Return to Start", BLACKID);
}


// Car Functions 
void initCar() {
    car.x = 20;
    car.y = 80;
    car.width = 20;
    car.height = 20;
    car.xVel = 2;
    car.yVel = 2;
}

void updateCar() {
    if (BUTTON_HELD(BUTTON_LEFT) && (car.x > 2)) {
        car.x -= car.xVel;
    } else if (BUTTON_HELD(BUTTON_RIGHT) && (car.x + car.width < 100)) {
        car.x += car.xVel;
    }
    if (BUTTON_HELD(BUTTON_UP) && (car.y > 0)) {
        car.y -= car.yVel;
    } else if (BUTTON_HELD(BUTTON_DOWN) && (car.y + car.height < 160)) {
        car.y += car.yVel;
    }
    drawCar();
}

void drawCar() {
    if (score < 100) {
        car.xVel = 2;
        car.yVel = 2;
        drawImage4(car.x, car.y, car.width, car.height, carBitmap);
    } else {
        drawImage4(car.x, car.y, car.width, car.height, car2Bitmap);
        car.xVel = 3;
        car.yVel = 3;
    }
}

int carCollision(CONE *cone) {
    return collision(car.x, car.y, car.width, car.height, cone->x, cone->y, cone->width, cone->height);
}

// Palette Initialization Function
void initGamePal() {
    DMANow(3, roadPal, BG_PALETTE, roadPalLen / 2);
}


// Cone Functions
void initCones() {
    for (int i = 0; i < CONECOUNT; i++) {
        cones[i].x = 230;
        cones[i].y = rand() % 130;
        cones[i].active = 0;
        cones[i].height = 12;
        cones[i].width = 12;
        cones[i].xVel = 1;
    }
}

int updateCones() {
    for (int i = 0; i < CONECOUNT; i++) {
        if (cones[i].active) {
            if (carCollision(&cones[i])) {
                playAnalogSound(2);
                return 1;
            }
            drawCone(&cones[i]);
            cones[i].x -= cones[i].xVel;
        }
        if (cones[i].x < 0) {
            cones[i].active = 0;
            cones[i].y = rand() % 130;
            cones[i].x = 230;
        }
    }
    return 0;
}

void drawCone(CONE *cone) {
    drawImage4(cone->x, cone->y, cone->width, cone->height, coneBitmap);
}
