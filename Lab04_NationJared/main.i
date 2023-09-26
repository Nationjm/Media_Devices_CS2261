# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 62 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 79 "gba.h"
extern unsigned short oldButtons;
# 2 "main.c" 2
# 1 "axolotl.h" 1




typedef struct {
 int* bitmap;
 unsigned short color;
} AXOLOTL;

extern AXOLOTL axolotls[5];
extern int* axolotlBitmaps[5];


void initializeAxolotls();
void drawAxolotl(AXOLOTL* axolotl_ptr, int index);
# 3 "main.c" 2
# 1 "text.h" 1

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 4 "main.c" 2


AXOLOTL axolotls[5];
u16 buttons;
u16 oldButtons;
int frameCounter;


enum STATE {REST, ANIMATE} state;


void initialize();
void updateGame();
void drawGame();
void reverseAxolotls();
void goToRest();
void goToAnimate();
void swap();





int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);



        switch (state) {
            case REST:
                waitForVBlank();
                drawGame();
                if ((((~buttons & (1<<3)) && !(~oldButtons & (1<<3))))) {
                    goToAnimate();
                }
                break;
            case ANIMATE:
                updateGame();
                waitForVBlank();
                drawGame();
                if ((((~buttons & (1<<3)) && !(~oldButtons & (1<<3))))) {
                    goToRest();
                }
                break;
        }

    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1<<10);



    frameCounter = 0;
    initializeAxolotls();
    goToRest();
}


void goToRest() {
    state = REST;
    drawRect(10, 10, 150, 10, ((0) | (0) << 5 | (0) << 10));
    drawString(10, 10, "Resting Axolotls", ((31) | (24) << 5 | (29) << 10));
}

void goToAnimate() {
    state = ANIMATE;
    drawRect(10, 10, 150, 10, ((0) | (0) << 5 | (0) << 10));
    drawString(10, 10, "Animated Axolotls!", ((0) | (0) << 5 | (31) << 10));
}




void updateGame() {

    frameCounter++;
    if (frameCounter == 20) {
        frameCounter = 0;
        reverseAxolotls();
    }
}

void drawGame() {
    for (int i = 0; i < 5; i++) {
            drawAxolotl(&axolotls[i], i);
        }
}

void reverseAxolotls() {

    for (int i = 0; i < (5 / 2); i++) {
        swap(&axolotls[i], &axolotls[5 - i - 1]);
    }
}


void swap(AXOLOTL *a, AXOLOTL *b) {
    AXOLOTL temp = *a;
    *a = *b;
    *b = temp;
}
