#include "gba.h"
#include "print.h"

// prototypes
void initialize();
void update();
void draw();

// buttonsRow
unsigned short oldButtons;
unsigned short buttons;

// background
unsigned short bgColor;

// height and width for all colorful rectangles
int rHeight, rWidth;

// colorful rectangle 1
int r1Y, r1X;
unsigned short r1Color;

// colorful rectangle 2
int r2Y, r2X;
unsigned short r2Color;

// colorful rectangle 3
int r3Y, r3X;
unsigned short r3Color;

// colorful rectangle 4
int r4Y, r4X;
unsigned short r4Color;

// painter rectangle
int pY, pX, pOldY, pOldX, pYVel, pXVel, pHeight, pWidth;
unsigned short pColor;

int main() {

	mgba_open();
	mgba_printf("Debugging Initialized");


	initialize();
 
	while (1) {
		// TODO 2.2: update the button variables every frame
		oldButtons = buttons;
		buttons = REG_BUTTONS;

		update();
		waitForVBlank();
		draw();
	}
}

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE(3) | BG2_ENABLE;

	// TODO 2.1: intialize the buttons variables
	oldButtons = buttons;
	buttons = REG_BUTTONS;

	// initialize rectangle colors
	pColor = YELLOW;
	r1Color = GREEN;
	r2Color = PURPLE;
	r3Color = ORANGE;
	r4Color = CYAN;

	// initialize background color and draw background
	bgColor = WHITE;
	fillScreen(bgColor);

	// initialize color rectangles
	rHeight = 30;
	rWidth = 30;

	r1Y = 30;
	r1X = 30;	

	r2Y = 30;
	r2X = 180;	

	r3Y = 100;
	r3X = 180;

	r4Y = 100;
	r4X = 30;						

	// initialize painter rectangle
	pHeight = 15;
	pWidth = 15;
	pY = (SCREENHEIGHT / 2) - (pHeight / 2);
	pX = (SCREENWIDTH / 2) - (pWidth / 2);
	pOldY = pY;
	pOldX = pX;
	pYVel = 1;
	pXVel = 1;
}

// performs all of the game's calculations
void update() {
	// change the color of the painter rectangle if A or B is pressed
	if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_B)) {
		// If it is yellow, bitwise XOR will set all of the bits to 0
		// If it is black, bitwise XOR will set it to yellow
		// Note: when you change the painter rectangle to a color other than yellow by
		// coliding with the colored rectangles, this will no longer work and that's fine!
		pColor ^= YELLOW;
	}

	// TODO 3.0: make the painter rectangle move with the arrow keys
	if (BUTTON_HELD(BUTTON_LEFT)) {
		pX -= 1;
	} 
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		pX += 1;
	}
	if (BUTTON_HELD(BUTTON_UP)) {
		pY -= 1;
	}
	if (BUTTON_HELD(BUTTON_DOWN)) {
		pY += 1;
	}

	// boundary checks
	if (pX < 0) { // left
		pX = 0;	
	}
	if (pX + pWidth > SCREENWIDTH - 1) { // right
		pX = SCREENWIDTH - pWidth;
	}
	if (pY < 0) { // top
		pY = 0;
	}
	if (pY + pHeight >= SCREENHEIGHT) { // bottom
		pY = (SCREENHEIGHT - 1) - (pHeight - 1);
	}

	// TODO 4.1: change the color of the painter rectangle if it collides with any of the colorful rectangles
	if (collision(r1X, r1Y, rWidth, rHeight, pX, pY, pWidth, pHeight)) {
		pColor = r1Color;
	} else if (collision(r2X, r2Y, rWidth, rHeight, pX, pY, pWidth, pHeight)) {
		pColor = r2Color;
	} else if (collision(r3X, r3Y, rWidth, rHeight, pX, pY, pWidth, pHeight)) {
		pColor = r3Color;
	} else if (collision(r4X, r4Y, rWidth, rHeight, pX, pY, pWidth, pHeight)) {
		pColor = r4Color;
	}

	// checking if our player row or col has changed
	if (pOldY != pY || pOldX != pX) {
		// TODO 3.1: Log when the player has moved, and what their current position is
		mgba_printf_level(MGBA_LOG_DEBUG, "Player has moved!");
		mgba_printf("Current Position: (%d, %d)", pX, pY);
	}
}

// performs all of the drawing to screen
void draw() {
	// TODO 4.2: add a condition that stops the previous painter rectangle location from being erased if the select button is held
	if ((BUTTON_HELD(BUTTON_SELECT))) {
	} else {
		drawRect(pOldX, pOldY, pWidth, pHeight, bgColor);
	}
	// draw the new painter rectangle location
	drawRect(pX, pY, pWidth, pHeight, pColor);

	// draw obstacles
	drawRect(r1X, r1Y, rWidth, rHeight, r1Color);
	drawRect(r2X, r2Y, rWidth, rHeight, r2Color);
	drawRect(r3X, r3Y, rWidth, rHeight, r3Color);
	drawRect(r4X, r4Y, rWidth, rHeight, r4Color);

	// update old variables
	pOldY = pY;
	pOldX = pX;

}
