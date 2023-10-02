#include "gba.h"
#include "print.h"

// Function Prototypes
void initialize();
void updateGame();
void drawGame();
void loopingBackward();
void loopingForward();
int isLooping();

int frame = 1;
int oldFrame;

int frameDelay = 30;

int frameCount = 0;

unsigned short oldButtons;
unsigned short buttons;
int forwardBool;
int backwardBool;
int speed = 3;
int loopBool;


int main() {

    initialize();
    for (int i = 0; i < 38400; i++) {
        setPixel(i, 1, WHITE);
    }
    drawGame(1);

    while (1) {
        oldFrame = frame;
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        updateGame();
        waitForVBlank();
        if (BUTTON_PRESSED(BUTTON_START) && forwardBool == 0 && backwardBool == 0) {
            forwardBool = 1;
        } else if (BUTTON_PRESSED(BUTTON_START) && forwardBool == 1) {
            forwardBool = 0;
        } else if (BUTTON_PRESSED(BUTTON_START) && backwardBool == 1) {
            backwardBool = 0;
        }
        if (forwardBool == 1) {
            loopingForward();
        }
        if (backwardBool == 1) {
            loopingBackward();
        }
        if (BUTTON_PRESSED(BUTTON_A)) {
            frame += 1;
            if (frame > 4) {
                frame = 1;
            }            
            drawGame(frame);
        }
        if (BUTTON_PRESSED(BUTTON_B)) {
            frame -= 1;
            if (frame < 1) {
                frame = 4;
            }
            drawGame(frame);
        }
        if (BUTTON_PRESSED(BUTTON_LEFT)) {
            frame = 1;
            drawGame(frame);
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            frame = 4;
            drawGame(frame);
        }
        if (BUTTON_PRESSED(BUTTON_SELECT) && forwardBool) {
            loopingBackward();
        } else if (BUTTON_PRESSED(BUTTON_SELECT) && backwardBool) {
            loopingForward();
        } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
            loopingBackward();
        }

        if (BUTTON_PRESSED(BUTTON_UP) && speed < 5) {
            speed += 1;
            switch(speed) {
                case 1: 
                    frameDelay = 50;
                    break;
                case 2: 
                    frameDelay = 40;
                    break;
                case 3:
                    frameDelay = 30;
                    break;
                case 4:
                    frameDelay = 20;
                    break;
                case 5: 
                    frameDelay = 10;
                    break;
            }
        }
        if (BUTTON_PRESSED(BUTTON_DOWN) && speed > 1) {
            speed -= 1;
            switch(speed) {
                case 1: 
                    frameDelay = 50;
                    break;
                case 2: 
                    frameDelay = 40;
                    break;
                case 3:
                    frameDelay = 30;
                    break;
                case 4:
                    frameDelay = 20;
                    break;
                case 5: 
                    frameDelay = 10;
                    break;
            }
        }
        

    }

    return 0;

}

void initialize() {
    mgba_open();
    mgba_printf("%s", "Debug logs initialized");
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
}



void updateGame() {
    frameCount++;
    mgba_printf("%d", frameCount);
}

void drawGame(int frameNum) {
    if (frameNum == 1) {
        drawFrame1();
    } else if (frameNum == 2) {
        drawFrame2();
    } else if (frameNum == 3) {
        drawFrame3();
    } else if (frameNum == 4) {
        drawFrame4();
    }
}

void loopingForward() {
    forwardBool = 1;
    backwardBool = 0;
    if (frameCount > frameDelay && frame == 4) {
        frameCount = 0;
        frame = 1;
        drawGame(1);
    } else if (frameCount > frameDelay && frame == 1) {
        frameCount = 0;
        frame++;
        drawGame(2);
    } else if (frameCount > frameDelay && frame == 2) {
        frameCount = 0;
        frame++;
        drawGame(3);
    } else if (frameCount > frameDelay && frame == 3) {
        frameCount = 0;
        frame++;
        drawGame(4);
    } 
}

void loopingBackward() {
    backwardBool = 1;
    forwardBool = 0;
    if (frameCount > frameDelay && frame == 4) {
        frameCount = 0;
        frame--;
        drawGame(3);
    } else if (frameCount > frameDelay && frame == 3) {
        frameCount = 0;
        frame--;
        drawGame(2);
    } else if (frameCount > frameDelay && frame == 2) {
        frameCount = 0;
        frame--;
        drawGame(1);
    } else if (frameCount > frameDelay && frame == 1) {
        frameCount = 0;
        frame = 4;
        drawGame(4);
    }
}


