// TODO 1.0: Include header files
#include "gba.h"
#include "print.h"


// Function Prototypes
void initialize();
void updateGame();
void drawGame();

int main() {

    initialize();

    // TODO 2.4: Test your drawing functions here!


    while (1) {

        // TODO 3.2: Add game loop functions in the correct order
        updateGame();
        waitForVBlank();
        drawGame();
    }
    
    return 0;

}

void initialize() {
    
    // TODO 1.1: Initialize MGBA logs

    mgba_open();
    mgba_printf("%s", "Debug logs initialized!");
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

}

// TODO 3.3: Choose the two colors the flickering rectangle switches between
#define COLOR1 YELLOW
#define COLOR2 BLUE

// TODO 3.3: Choose the rate at which the rectangle color flickers
#define FRAME_DELAY 30

u16 flickeringColor = COLOR1;
int frameCount = 0;

void updateGame() {

    // Switch flickering rectangle from color 1 to color 2 after FRAME_DELAY number of frames
    if (frameCount > FRAME_DELAY && flickeringColor == COLOR1) {
        frameCount = 0;
        flickeringColor = COLOR2;

    // Switch flickering rectangle from color 2 to color 1 after FRAME_DELAY number of frames
    } else if (frameCount > FRAME_DELAY && flickeringColor == COLOR2) {
        frameCount = 0;
        flickeringColor = COLOR1;

    }

    frameCount++;

    // TODO 3.4: Print the frameCount variable every frame
    mgba_printf("Frame count: %d", frameCount);

}

void drawGame() {

    // TODO 3.5: Call your drawRectangle function using flickeringColor
    drawRectangle(15, 15, 15, 15, flickeringColor);

    //TODO 3.5: Call your drawRightTriangle function using flickeringColor
    drawRightTriangle(30, 30, 15, flickeringColor);

    // TODO 3.5: Call your drawParallelogram function using flickeringColor
    drawParallelogram(45, 45, 15, 15, flickeringColor);

    // TODO 3.5: Call your drawCircle function using flickeringColor
    drawCircle(90, 90, 15, flickeringColor);
}