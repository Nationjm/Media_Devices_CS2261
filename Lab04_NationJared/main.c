#include "gba.h"
#include "axolotl.h"
#include "text.h"

// Variables
AXOLOTL axolotls[AXOLOTLCOUNT];
u16 buttons;
u16 oldButtons;
int frameCounter;

// State enum
enum STATE {REST, ANIMATE} state;

// Prototypes
void initialize();
void updateGame();
void drawGame();
void reverseAxolotls();
void goToRest();
void goToAnimate();
void swap();

// TODO 1.2: Add your state transition function prototypes here

// TODO 4.1: Add the function prototype for the swap method you wrote

int main() {
    // First, set up
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        // TODO 1.0: Make the state machine here 
        switch (state) {
            case REST:
                waitForVBlank();
                drawGame();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToAnimate();
                }
                break;
            case ANIMATE:
                updateGame();
                waitForVBlank();
                drawGame();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToRest();
                }
                break;
        }
        // TODO 3.2: Add the appropriate function calls to each state
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    // TODO 1.3: Call goToRest()

    frameCounter = 0;
    initializeAxolotls();
    goToRest();
}

// TODO 1.1: Make your state transition functions
void goToRest() {
    state = REST;   
    drawRect(10, 10, 150, 10, BLACK);
    drawString(10, 10, "Resting Axolotls", LIGHTPINK);
}

void goToAnimate() {
    state = ANIMATE;
    drawRect(10, 10, 150, 10, BLACK);
    drawString(10, 10, "Animated Axolotls!", BLUE);
}

// TODO 2.1: Add drawString calls for each state transition function inside your state machine 
// TODO 2.2: Add your drawRect calls to hide text from the previous state

void updateGame() {
    // Animates axolotls so they are constantly swapping
    frameCounter++;
    if (frameCounter == 20) {
        frameCounter = 0;
        reverseAxolotls();
    }
}

void drawGame() {
    for (int i = 0; i < AXOLOTLCOUNT; i++) {
            drawAxolotl(&axolotls[i], i);
        }
}

void reverseAxolotls() {
    // TODO 4.2: Implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    for (int i = 0; i < (AXOLOTLCOUNT / 2); i++) {
        swap(&axolotls[i], &axolotls[AXOLOTLCOUNT - i - 1]);
    }
}

// TODO 4.0: Implement swap for two axolotls
void swap(AXOLOTL *a, AXOLOTL *b) {
    AXOLOTL temp = *a;
    *a = *b;
    *b = temp;
}
