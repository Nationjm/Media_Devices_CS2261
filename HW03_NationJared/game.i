# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 23 "gba.h"
extern volatile unsigned short* videoBuffer;
# 35 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 55 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "game.c" 2
# 1 "game.h" 1


void start();
void game();
void pause();
void win();
void lose();
# 3 "game.c" 2

void start(int drawStart) {
    if (drawStart == 1) {
        fillScreen((((31) & 31) | ((20) & 31) << 5 | ((0) & 31) << 10));
        drawString(85, 67, "Press Start", (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    }
}

void game() {

}

void pause() {

}

void win() {

}

void lose() {

}
