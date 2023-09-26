# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
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
# 56 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);


void backgroundColors();
void lifeDisp(int lives);
void game();
void win();
void lose();
# 79 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

void backgroundColors() {
    fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    for (int i = 10; i < 230; i++) {
        for (int j = 10; j < 20; j++) {
            (videoBuffer[((j) * (240) + (i))] = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 20; j < 70; j++) {
            (videoBuffer[((j) * (240) + (i))] = (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 70; j < 80; j++) {
            (videoBuffer[((j) * (240) + (i))] = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 80; j < 140; j++) {
            (videoBuffer[((j) * (240) + (i))] = (((15) & 31) | ((15) & 31) << 5 | ((15) & 31) << 10));
        }
    }
    for(int i = 10; i < 230; i++) {
        for (int j = 140; j < 150; j++) {
            (videoBuffer[((j) * (240) + (i))] = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        }
    }
}

void lifeDisp(int lives) {
    drawRectangle(170, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(170, 8, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(175, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(178, 2, 1, 6, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((8) * (240) + (179))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(180, 2, 1, 6, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(183, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(183, 2, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(183, 5, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(183, 8, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(188, 2, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(188, 8, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(188, 5, 3, 1, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((3) * (240) + (188))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((6) * (240) + (190))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((4) * (240) + (188))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((7) * (240) + (190))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((3) * (240) + (193))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    (videoBuffer[((7) * (240) + (193))] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));

    if (lives == 1) {
        drawRectangle(202, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
        drawRectangle(199, 2, 1, 7, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(196, 2, 1, 7, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    } else if (lives == 2) {
        drawRectangle(202, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
        drawRectangle(199, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
        drawRectangle(196, 2, 1, 7, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    } else if (lives == 3) {
        drawRectangle(202, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
        drawRectangle(199, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
        drawRectangle(196, 2, 1, 7, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    }
}

void game() {

}

void win(int stopDrawing) {
    if (stopDrawing == 0) {
        fillScreen((((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));

        drawRectangle(65, 45, 3, 10, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(63, 40, 2, 6, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(68, 40, 2, 6, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(71, 40, 2, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(73, 40, 3, 2, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(76, 40, 2, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(73, 53, 3, 2, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(79, 40, 2, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(84, 40, 2, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(81, 53, 3, 2, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(135, 100, 3, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(138, 113, 3, 2, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(141, 107, 2, 8, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(143, 113, 3, 2, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(146, 100, 3, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(151, 100, 3, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(157, 100, 3, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(160, 100, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(161, 103, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(162, 106, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(163, 109, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(164, 112, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(165, 100, 3, 15, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    }
}

void lose(int stopDrawing) {
    if (stopDrawing == 0) {
        fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(65, 45, 9, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(60, 46, 5, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((47) * (240) + (59))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((48) * (240) + (58))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(57, 49, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(56, 51, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(55, 53, 1, 8, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((61) * (240) + (56))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((62) * (240) + (57))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(58, 63, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(61, 64, 10, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((63) * (240) + (71))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(72, 59, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((58) * (240) + (71))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(69, 57, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(66, 56, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(63, 55, 4, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(66, 54, 9, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(81, 61, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(82, 59, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(83, 57, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(84, 54, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(85, 53, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((54) * (240) + (86))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(86, 55, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((52) * (240) + (86))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((51) * (240) + (87))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((50) * (240) + (88))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(89, 46, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((45) * (240) + (90))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(92, 42, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(91, 43, 1, 11, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(92, 54, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(93, 59, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(94, 63, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(100, 61, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(101, 58, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(102, 56, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(103, 50, 1, 6, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(104, 47, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((46) * (240) + (105))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(106, 43, 2, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(107, 46, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(108, 51, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(110, 48, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(111, 45, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(112, 42, 1, 8, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(113, 50, 1, 6, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(114, 56, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(127, 44, 1, 13, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(128, 57, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(127, 44, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(134, 43, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(137, 42, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(127, 52, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(134, 51, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(135, 50, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(136, 49, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(128, 61, 13, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((60) * (240) + (141))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(95, 85, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(100, 84, 5, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((86) * (240) + (95))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((87) * (240) + (94))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(93, 88, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(92, 93, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(93, 97, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(94, 99, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((99) * (240) + (95))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((101) * (240) + (96))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(97, 102, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(100, 103, 4, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(104, 104, 4, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(108, 102, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((102) * (240) + (108))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((101) * (240) + (110))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(111, 99, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(112, 94, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(111, 92, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(110, 89, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(108, 87, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((88) * (240) + (108))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((86) * (240) + (107))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(105, 85, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(120, 83, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(122, 84, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((86) * (240) + (123))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(124, 87, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(125, 89, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((91) * (240) + (126))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((92) * (240) + (127))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((93) * (240) + (128))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((94) * (240) + (129))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(130, 95, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(131, 97, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((99) * (240) + (132))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(133, 100, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((100) * (240) + (134))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(135, 96, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(136, 92, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(137, 88, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(138, 85, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(139, 82, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(140, 80, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((81) * (240) + (141))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(146, 79, 1, 13, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(147, 92, 1, 6, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((97) * (240) + (148))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(148, 98, 11, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((97) * (240) + (159))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(147, 88, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(149, 87, 5, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(154, 86, 5, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(147, 78, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(154, 77, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((76) * (240) + (157))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(165, 73, 1, 7, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(166, 80, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(167, 84, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(168, 88, 1, 4, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(169, 92, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(170, 94, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(165, 73, 6, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(171, 74, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(172, 74, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(173, 77, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(175, 78, 1, 3, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((81) * (240) + (174))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((82) * (240) + (173))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((83) * (240) + (172))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(168, 84, 7, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((85) * (240) + (175))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((86) * (240) + (176))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(177, 87, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((88) * (240) + (179))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(180, 89, 2, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((90) * (240) + (182))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((91) * (240) + (183))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((92) * (240) + (184))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));


        drawRectangle(188, 91, 2, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((91) * (240) + (189))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        (videoBuffer[((89) * (240) + (188))] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(187, 87, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(186, 85, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(185, 80, 1, 5, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(184, 73, 1, 7, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
        drawRectangle(183, 71, 1, 2, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    }
}
