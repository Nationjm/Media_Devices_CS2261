/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
#include "lib.h"
#include "collab.h"
#include "world1.h"

void initialize();
void game();

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;

int sbb = 32-15;

int screenTile;

	// TODO 4.0: Customize the map manually (normally you would let Usenti do this for you)
	unsigned short bgMap[1024] = 
	{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 6, 6 | (1<<10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 6 | (1<<11), 6 | (3<<10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,};

int main() {

	initialize();

	while(1) {

		game();
		
		oldButtons = buttons;
		buttons = BUTTONS;
	}
}
/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
// Initializes the game on launch
void initialize() {
	// TODO 2.0: Set the Display Control Register
	//       Choose Mode 0 and enable background 0
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;


	// TODO 2.1: Setup the Background 0 Control Register
	//           Use 32x32 tiles that are 4bpp
	//           Tell it which Charblock to find the tiles
	//           Tell it which Screenblock to find the map
	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(1);
	REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(sbb);


	// TODO 2.2: Load the palette for your tiles
	DMANow(3, world1Pal, PALETTE, 256);


	// TODO 2.3: Load your tiles into the charblock that your background is using
	DMANow(3, collabTiles, &CHARBLOCK[0], collabTilesLen/2);


	// TODO 2.4: Load your tile map into the screenblock that your background is using
	DMANow(3, bgMap, &SCREENBLOCK[1], sizeof(bgMap) /2);

	DMANow(3, world1Tiles, &CHARBLOCK[1], world1TilesLen/2);
	DMANow(3, world1Map, &SCREENBLOCK[sbb], world1MapLen/2);
	
	// The variables for background offset
	hOff = 0;
	vOff = 0;

	buttons = BUTTONS;
}
/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */
void game() {

		// TODO 3.0: Change the hOff and vOff variables with the arrow keys

		if (BUTTON_HELD(BUTTON_RIGHT)){
			hOff++;
		}
		if (BUTTON_HELD(BUTTON_LEFT)){
			hOff--;
		}

		if (BUTTON_HELD(BUTTON_UP)){
			vOff++;
		}
		if (BUTTON_HELD(BUTTON_DOWN)){
			vOff--;
		}

		if (BUTTON_PRESSED(BUTTON_L)){
			screenTile--;
		}
		if (BUTTON_PRESSED(BUTTON_R)){
			screenTile++;
		}

		if (BUTTON_PRESSED(BUTTON_B)){
			bgMap[screenTile]--;
		}
		if (BUTTON_PRESSED(BUTTON_A)){
			bgMap[screenTile]++;
		}

		oldButtons = BUTTONS;
		//waitForVBlank();

		if (hOff > 256){
			sbb++;
			hOff -= 256;
		}
		if (hOff < 0 && sbb > (32-15)) {
			sbb--;
			hOff+=256;
		}

		REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(sbb);

		// TODO 3.1: Update the Background 0 Offset Registers with those variables
		REG_BG0HOFF = hOff * 2;
		REG_BG0VOFF = vOff;
		REG_BG1VOFF = vOff;
		REG_BG1HOFF = hOff;
		DMANow(3, bgMap, &SCREENBLOCK[31], sizeof(bgMap)/2);
}
/*
 * NOTE: DO NOT JUST COPY ANY OF THIS CODE FOR FUTURE HW/LABS
 * YOU MUST UNDERSTAND AND RE-WRITE FOR YOURSELF ANYTHING YOU
 * FIND USEFUL IN THIS FILE!
 */