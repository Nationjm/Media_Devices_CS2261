# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 39 "gba.h"
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;


void waitForVBlank();
void drawHorizontalLine(int, int, int, u16);
void drawVerticalLine(int, int, int, u16);
void drawRectangle(int, int, int, int, u16);
void fillScreen(u16);
void drawFrame1();
void drawFrame2();
void drawFrame3();
void drawFrame4();
# 80 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        (videoBuffer[((y) * (240) + (i))] = color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        (videoBuffer[((i) * (240) + (x))] = color);
    }
}


void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}


void fillScreen(unsigned short color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);
}

void drawFrame1() {
    drawRectangle(30, 40, 55, 55, 0x7FFF);

    drawHorizontalLine(75, 57, 60, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(76, 55, 61, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(77, 58, 61, 0);
    drawHorizontalLine(77, 56, 57, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(78, 53, 55, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (56))] = 0);
    drawHorizontalLine(78, 57, 62, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (59))] = 0);
    drawVerticalLine(62, 78, 80, 0);
    drawHorizontalLine(79, 52, 61, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((79) * (240) + (55))] = 0);
    drawHorizontalLine(79, 58, 59, 0);
    drawHorizontalLine(80, 53, 56, 0);
    drawHorizontalLine(80, 57, 61, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(80, 61, 63, 0);
    drawHorizontalLine(81, 54, 61, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(82, 56, 61, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(83, 55, 62, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(83, 57, 58, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(84, 55, 60, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    (videoBuffer[((84) * (240) + (57))] = (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(84, 61, 62, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(85, 54, 59, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(85, 60, 62, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(86, 54, 62, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(86, 58, 60, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((86) * (240) + (61))] = (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(87, 54, 62, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(87, 59, 60, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(88, 55, 57, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(88, 59, 62, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(89, 55, 57, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(89, 60, 62, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(90, 54, 57, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(90, 59, 62, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
}

void drawFrame2() {
    drawRectangle(30, 40, 55, 55, 0x7FFF);


    drawHorizontalLine(75, 54, 57, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(76, 52, 58, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(77, 55, 58, 0);
    drawHorizontalLine(77, 53, 54, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(78, 50, 52, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (53))] = 0);
    drawHorizontalLine(78, 54, 59, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (56))] = 0);
    drawVerticalLine(59, 78, 80, 0);
    drawHorizontalLine(79, 49, 58, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((79) * (240) + (52))] = 0);
    drawHorizontalLine(79, 55, 56, 0);
    drawHorizontalLine(80, 50, 53, 0);
    drawHorizontalLine(80, 54, 58, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(80, 58, 60, 0);
    drawHorizontalLine(81, 51, 58, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));


    (videoBuffer[((82) * (240) + (52))] = (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((82) * (240) + (54))] = (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(82, 55, 59, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(83, 51, 53, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(83, 54, 59, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    (videoBuffer[((83) * (240) + (60))] = (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(84, 52, 53, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(84, 54, 57, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(84, 58, 59, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(84, 60, 61, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(85, 52, 61, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(85, 62, 63, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(86, 52, 61, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(86, 62, 63, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(87, 53, 55, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(87, 58, 61, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(87, 62, 63, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    (videoBuffer[((88) * (240) + (63))] = (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(88, 54, 56, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(89, 53, 56, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));


    drawHorizontalLine(70, 42, 46, 0);
    (videoBuffer[((69) * (240) + (41))] = 0);
    (videoBuffer[((69) * (240) + (47))] = 0);
    drawVerticalLine(40, 67, 68, 0);
    drawVerticalLine(48, 67, 68, 0);
    drawVerticalLine(43, 66, 67, 0);
    drawVerticalLine(45, 66, 67, 0);
    drawHorizontalLine(66, 39, 41, 0);
    drawHorizontalLine(66, 47, 49, 0);
    drawHorizontalLine(65, 42, 46, 0);
    drawVerticalLine(38, 63, 65, 0);
    drawVerticalLine(50, 63, 65, 0);
    (videoBuffer[((62) * (240) + (39))] = 0);
    (videoBuffer[((62) * (240) + (49))] = 0);
    (videoBuffer[((61) * (240) + (40))] = 0);
    (videoBuffer[((61) * (240) + (48))] = 0);
    drawHorizontalLine(60, 41, 42, 0);
    drawHorizontalLine(60, 46, 47, 0);
    drawHorizontalLine(59, 43, 45, 0);
    drawHorizontalLine(60, 43, 44, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(61, 41, 42, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(61, 44, 45, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    (videoBuffer[((61) * (240) + (47))] = (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(40, 62, 2, 2, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(65, 40, 41, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(64, 41, 42, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(64, 44, 47, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(65, 47, 49, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(63, 45, 46, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(62, 45, 47, (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
}

void drawFrame3() {
    drawRectangle(30, 40, 55, 55, 0x7FFF);


    drawHorizontalLine(62, 44, 47, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(63, 42, 48, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(64, 45, 48, 0);
    drawHorizontalLine(64, 43, 44, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(65, 40, 42, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((65) * (240) + (43))] = 0);
    drawHorizontalLine(65, 44, 49, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((65) * (240) + (46))] = 0);
    drawVerticalLine(49, 65, 67, 0);
    drawHorizontalLine(66, 39, 48, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((66) * (240) + (42))] = 0);
    drawHorizontalLine(66, 45, 46, 0);
    drawHorizontalLine(67, 40, 43, 0);
    drawHorizontalLine(67, 44, 48, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(67, 48, 50, 0);
    drawHorizontalLine(68, 41, 47, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));


    drawRectangle(38, 69, 2, 3, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((70) * (240) + (40))] = (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawRectangle(51, 70, 2, 3, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((71) * (240) + (50))] = (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));


    drawRectangle(44, 69, 3, 2, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(41, 71, 6, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(47, 72, 2, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    (videoBuffer[((73) * (240) + (49))] = (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(74, 49, 50, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(75, 41, 43, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));



    (videoBuffer[((71) * (240) + (41))] = (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    (videoBuffer[((71) * (240) + (45))] = (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));


    drawHorizontalLine(69, 43, 44, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(70, 41, 43, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    (videoBuffer[((71) * (240) + (40))] = (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawRectangle(47, 69, 4, 2, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(71, 47, 48, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));


    (videoBuffer[((72) * (240) + (39))] = (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawRectangle(39, 73, 2, 3, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawRectangle(49, 75, 3, 2, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(77, 48, 50, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));

}

void drawFrame4() {
    drawRectangle(30, 40, 55, 55, 0x7FFF);


    drawHorizontalLine(75, 37, 40, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(76, 35, 41, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(77, 38, 41, 0);
    drawHorizontalLine(77, 36, 37, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(78, 33, 35, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (36))] = 0);
    drawHorizontalLine(78, 37, 42, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((78) * (240) + (39))] = 0);
    drawVerticalLine(42, 78, 80, 0);
    drawHorizontalLine(79, 32, 41, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((79) * (240) + (35))] = 0);
    drawHorizontalLine(79, 38, 39, 0);
    drawHorizontalLine(80, 33, 36, 0);
    drawHorizontalLine(80, 37, 41, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(80, 41, 43, 0);
    drawHorizontalLine(81, 34, 41, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(82, 36, 41, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(83, 35, 42, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(83, 37, 38, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(84, 35, 40, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    (videoBuffer[((84) * (240) + (37))] = (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(84, 41, 42, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(85, 34, 39, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(85, 40, 42, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(86, 34, 42, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(86, 38, 40, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    (videoBuffer[((86) * (240) + (41))] = (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(87, 34, 42, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(87, 39, 40, (((31) & 31) | (((27) & 31) << 5) | (((17) & 31) << 10)));
    drawHorizontalLine(88, 35, 37, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(88, 39, 42, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawHorizontalLine(89, 35, 37, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(89, 40, 42, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(90, 34, 37, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
    drawHorizontalLine(90, 39, 42, (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));


    drawRectangle(50, 70, 2, 6, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawHorizontalLine(76, 49, 52, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    (videoBuffer[((70) * (240) + (49))] = (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(54, 70, 2, 6, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(55, 75, 4, 2, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(58, 70, 2, 6, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(62, 70, 2, 7, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawHorizontalLine(70, 64, 66, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawRectangle(66, 71, 2, 2, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
    drawHorizontalLine(73, 64, 66, (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10)));
}
