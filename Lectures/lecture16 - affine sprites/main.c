/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */


#include <stdlib.h>
#include <stdio.h>
#include "lib.h"
#include "world1.h"
#include "pikachu.h"
#include "sin.notquitec"

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

volatile unsigned short *spritePaletteMem = (unsigned short*)0x05000200;
OBJ_ATTR shadowOAM[128];

int pikachuFramecount = 6;
int pikachuFrames[] = {0, 8, 16, 24, 256, 264};

// Setup GBA
void initialize() {
  REG_DISPCTL = MODE(0) | BG0_ENABLE | SPRITE_ENABLE;
  DMANow(3, world1Pal, PALETTE, world1PalLen/2);
  DMANow(3, world1Tiles, &CBB[0], world1TilesLen/2);
  DMANow(3, world1Map, &SBB[8], world1MapLen/2);

  DMANow(3, pikachuPal, spritePaletteMem, pikachuPalLen/2);
  DMANow(3, pikachuTiles, &CBB[4], pikachuTilesLen/2);

  for (int i=0; i<128; i++) {
    shadowOAM[i].attr0 = OAM_ATTRO_MODE_HIDE;
  }
}
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

void readButtons(){
  // Update button variables
  oldButtons = buttons;
  buttons = BUTTONS;  
}

typedef struct
{
    u16 fill0[3];  // leave gaps for the normal OAM attrs
    short a;       // make sure they're signed (-sin(x), etc.)!
    u16 fill1[3];
    short b;
    u16 fill2[3];
    short c;
    u16 fill3[3];
    short d;
} ALIGN(4) OBJ_AFFINE;

OBJ_AFFINE *SHADOW_OAM_AFF = (OBJ_AFFINE*)shadowOAM;

int main() {
  initialize();

  int hoff = 0;
  int voff = 64;

  int sbb = 8;

  int currentFrame = 0;
  int time=0;

  SHADOW_OAM_AFF[0].a = 256;
  SHADOW_OAM_AFF[0].d = 256;

  short Sx = 2;
  short Sy = 2;

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
  while(1) {
    readButtons();
    //updateGame();
    //drawGame();

    shadowOAM[0].attr0 = OAM_ATTRO_MODE_DOUBLE_AFFINE | 30;
    shadowOAM[0].attr1 = OAM_ATTR1_SIZE_L | OAM_ATTR1_AFFINE(0) | 20;
    shadowOAM[0].attr2 = pikachuFrames[currentFrame];

    shadowOAM[1].attr0 = OAM_ATTRO_MODE_DOUBLE_AFFINE | 30;
    shadowOAM[1].attr1 = OAM_ATTR1_SIZE_L | OAM_ATTR1_AFFINE(1) | 80;
    shadowOAM[1].attr2 = pikachuFrames[currentFrame];

    SHADOW_OAM_AFF[0].d = (512 - time*2);

    // cos𝜃/Sx  -sin𝜃/Sx
    // sin𝜃/Sy  cos𝜃/Sy
    SHADOW_OAM_AFF[1].a = sin_lut_fixed8[(time + 90) % 360] / Sx;
    SHADOW_OAM_AFF[1].b = -sin_lut_fixed8[time  % 360] / Sx;
    SHADOW_OAM_AFF[1].c = sin_lut_fixed8[time  % 360] / Sy;
    SHADOW_OAM_AFF[1].d = sin_lut_fixed8[(time + 90)  % 360] / Sy;

    if (time % 10 == 0) currentFrame = (currentFrame + 1) % pikachuFramecount;

    if(BUTTON_HELD(BUTTON_LEFT)) {
      hoff--;
      orientation = 0;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
      hoff++;
      orientation = 1;
    }

    if(BUTTON_HELD(BUTTON_UP)) voff--;
    if(BUTTON_HELD(BUTTON_DOWN)) voff++;

    // if (voff > 64) voff = 64;
    // if (voff < 0) voff = 0;

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
    waitForVBlank();

    REG_BG0CNT = BG_SIZE1 | BG_SBB(sbb) | BG_CBB(0);

    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM)/2);
    REG_BG0HOFS = hoff;
    REG_BG0VOFS = voff;
    time = (time + 1) % 512;
  }
}
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */