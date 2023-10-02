#include "gba.h"

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        setPixel(i, y, color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        setPixel(x, i, color);
    }
}

// TODO: Add this function from Lab 2
void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(x + i, y + j, color);
        }
    }
}


void fillScreen(unsigned short color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

void drawFrame1() {
    drawRectangle(30, 40, 55, 55, WHITE); // reset color

    drawHorizontalLine(75, 57, 60, RED); // hat
    drawHorizontalLine(76, 55, 61, RED); // hat
    drawHorizontalLine(77, 58, 61, BLACK); // hair top
    drawHorizontalLine(77, 56, 57, MARIO); // forehead
    drawHorizontalLine(78, 53, 55, MARIO); // nose
    setPixel(56, 78, BLACK); // eye
    drawHorizontalLine(78, 57, 62, MARIO); // in between eye and sideburns
    setPixel(59, 78, BLACK); // sideburn
    drawVerticalLine(62, 78, 80, BLACK); // back hair
    drawHorizontalLine(79, 52, 61, MARIO); // nose and ear
    setPixel(55, 79, BLACK); // top mustache
    drawHorizontalLine(79, 58, 59, BLACK); // sideburns
    drawHorizontalLine(80, 53, 56, BLACK); // mustache
    drawHorizontalLine(80, 57, 61, MARIO);
    drawHorizontalLine(80, 61, 63, BLACK);
    drawHorizontalLine(81, 54, 61, MARIO); 
    drawHorizontalLine(82, 56, 61, BLUE);
    drawHorizontalLine(83, 55, 62, BLUE);
    drawHorizontalLine(83, 57, 58, RED);
    drawHorizontalLine(84, 55, 60, RED);
    setPixel(57, 84, YELLOW);
    drawHorizontalLine(84, 61, 62, BLUE);
    drawHorizontalLine(85, 54, 59, RED);
    drawHorizontalLine(85, 60, 62, BLUE);
    drawHorizontalLine(86, 54, 62, RED);
    drawHorizontalLine(86, 58, 60, MARIO);
    setPixel(61, 86, BLUE);
    drawHorizontalLine(87, 54, 62, RED);
    drawHorizontalLine(87, 59, 60, MARIO);
    drawHorizontalLine(88, 55, 57, RED);
    drawHorizontalLine(88, 59, 62, RED);
    drawHorizontalLine(89, 55, 57, BLUE);
    drawHorizontalLine(89, 60, 62, BLUE);
    drawHorizontalLine(90, 54, 57, BLUE);
    drawHorizontalLine(90, 59, 62, BLUE);
}

void drawFrame2() {
    drawRectangle(30, 40, 55, 55, WHITE); // reset color

    // Mario head
    drawHorizontalLine(75, 54, 57, RED); // hat
    drawHorizontalLine(76, 52, 58, RED); // hat
    drawHorizontalLine(77, 55, 58, BLACK); // hair top
    drawHorizontalLine(77, 53, 54, MARIO); // forehead
    drawHorizontalLine(78, 50, 52, MARIO); // nose
    setPixel(53, 78, BLACK); // eye
    drawHorizontalLine(78, 54, 59, MARIO); // in between eye and sideburns
    setPixel(56, 78, BLACK); // sideburn
    drawVerticalLine(59, 78, 80, BLACK); // back hair
    drawHorizontalLine(79, 49, 58, MARIO); // nose and ear
    setPixel(52, 79, BLACK); // top mustache
    drawHorizontalLine(79, 55, 56, BLACK); // sideburns
    drawHorizontalLine(80, 50, 53, BLACK); // mustache
    drawHorizontalLine(80, 54, 58, MARIO); // chin
    drawHorizontalLine(80, 58, 60, BLACK); // hair
    drawHorizontalLine(81, 51, 58, MARIO); // bottom hair

    // Mario body
    setPixel(52, 82, MARIO); // thumb
    setPixel(54, 82, RED); // overall shoulder
    drawHorizontalLine(82, 55, 59, BLUE); // shirt
    drawHorizontalLine(83, 51, 53, MARIO); // front hand
    drawHorizontalLine(83, 54, 59, BLUE); // shirt
    setPixel(60, 83, MARIO); // back thumb
    drawHorizontalLine(84, 52, 53, MARIO); // front hand
    drawHorizontalLine(84, 54, 57, BLUE); // shirt
    drawHorizontalLine(84, 58, 59, RED); // overall
    drawHorizontalLine(84, 60, 61, MARIO); // back hand
    drawHorizontalLine(85, 52, 61, RED); // overalls
    drawHorizontalLine(85, 62, 63, BLUE); // shoe
    drawHorizontalLine(86, 52, 61, RED); // overalls
    drawHorizontalLine(86, 62, 63, BLUE); // shoe
    drawHorizontalLine(87, 53, 55, RED); // pants
    drawHorizontalLine(87, 58, 61, RED); // pants
    drawHorizontalLine(87, 62, 63, BLUE); // shoe
    setPixel(63, 88, BLUE); // back toe
    drawHorizontalLine(88, 54, 56, BLUE); // front shoe
    drawHorizontalLine(89, 53, 56, BLUE); // front shoe and toe

    // mushroom
    drawHorizontalLine(70, 42, 46, BLACK); 
    setPixel(41, 69, BLACK);
    setPixel(47, 69, BLACK);
    drawVerticalLine(40, 67, 68, BLACK);
    drawVerticalLine(48, 67, 68, BLACK);
    drawVerticalLine(43, 66, 67, BLACK);
    drawVerticalLine(45, 66, 67, BLACK);
    drawHorizontalLine(66, 39, 41, BLACK);
    drawHorizontalLine(66, 47, 49, BLACK);
    drawHorizontalLine(65, 42, 46, BLACK);
    drawVerticalLine(38, 63, 65, BLACK);
    drawVerticalLine(50, 63, 65, BLACK);
    setPixel(39, 62, BLACK);
    setPixel(49, 62, BLACK);
    setPixel(40, 61, BLACK);
    setPixel(48, 61, BLACK);
    drawHorizontalLine(60, 41, 42, BLACK);
    drawHorizontalLine(60, 46, 47, BLACK);
    drawHorizontalLine(59, 43, 45, BLACK);
    drawHorizontalLine(60, 43, 44, GREEN);
    drawHorizontalLine(61, 41, 42, GREEN);
    drawHorizontalLine(61, 44, 45, GREEN);
    setPixel(47, 61, GREEN);
    drawRectangle(40, 62, 2, 2, GREEN);
    drawHorizontalLine(65, 40, 41, GREEN);
    drawHorizontalLine(64, 41, 42, GREEN);
    drawHorizontalLine(64, 44, 47, GREEN);
    drawHorizontalLine(65, 47, 49, GREEN);
    drawHorizontalLine(63, 45, 46, GREEN);
    drawHorizontalLine(62, 45, 47, GREEN);
}

void drawFrame3() {
    drawRectangle(30, 40, 55, 55, WHITE); // reset color

    // Mario head
    drawHorizontalLine(62, 44, 47, RED); // hat
    drawHorizontalLine(63, 42, 48, RED); // hat
    drawHorizontalLine(64, 45, 48, BLACK); // hair top
    drawHorizontalLine(64, 43, 44, MARIO); // forehead
    drawHorizontalLine(65, 40, 42, MARIO); // nose
    setPixel(43, 65, BLACK); // eye
    drawHorizontalLine(65, 44, 49, MARIO); // in between eye and sideburns
    setPixel(46, 65, BLACK); // sideburn
    drawVerticalLine(49, 65, 67, BLACK); // back hair
    drawHorizontalLine(66, 39, 48, MARIO); // nose and ear
    setPixel(42, 66, BLACK); // top mustache
    drawHorizontalLine(66, 45, 46, BLACK); // sideburns
    drawHorizontalLine(67, 40, 43, BLACK); // mustache
    drawHorizontalLine(67, 44, 48, MARIO); // chin
    drawHorizontalLine(67, 48, 50, BLACK); // hair
    drawHorizontalLine(68, 41, 47, MARIO); // bottom chin

    // Mario Hands
    drawRectangle(38, 69, 2, 3, MARIO); // Left Hand
    setPixel(40, 70, MARIO); // Left Hand
    drawRectangle(51, 70, 2, 3, MARIO); // Right Hand
    setPixel(50, 71, MARIO); // Right Hand

    // Red overalls
    drawRectangle(44, 69, 3, 2, RED);
    drawRectangle(41, 71, 6, 4, RED);
    drawRectangle(47, 72, 2, 4, RED);
    setPixel(49, 73, RED);
    drawHorizontalLine(74, 49, 50, RED);
    drawHorizontalLine(75, 41, 43, RED);
    

    // Overall Buttons
    setPixel(41, 71, YELLOW); // Left Button
    setPixel(45, 71, YELLOW); // Right Button

    // Blue shirt
    drawHorizontalLine(69, 43, 44, BLUE); // Left Shoulder
    drawHorizontalLine(70, 41, 43, BLUE); // Left Shoulder
    setPixel(40, 71, BLUE); // Left Shoulder
    drawRectangle(47, 69, 4, 2, BLUE); // Right Shoulder
    drawHorizontalLine(71, 47, 48, BLUE); // Right Shoulder

    // Blue shoes
    setPixel(39, 72, BLUE); // Left Shoe
    drawRectangle(39, 73, 2, 3, BLUE); // Left Shoe
    drawRectangle(49, 75, 3, 2, BLUE); // Right Shoe
    drawHorizontalLine(77, 48, 50, BLUE); // Right Shoe

}

void drawFrame4() {
    drawRectangle(30, 40, 55, 55, WHITE); // reset color

    // Mario
    drawHorizontalLine(75, 37, 40, RED); // hat
    drawHorizontalLine(76, 35, 41, RED); // hat
    drawHorizontalLine(77, 38, 41, BLACK); // hair top
    drawHorizontalLine(77, 36, 37, MARIO); // forehead
    drawHorizontalLine(78, 33, 35, MARIO); // nose
    setPixel(36, 78, BLACK); // eye
    drawHorizontalLine(78, 37, 42, MARIO); // in between eye and sideburns
    setPixel(39, 78, BLACK); // sideburn
    drawVerticalLine(42, 78, 80, BLACK); // back hair
    drawHorizontalLine(79, 32, 41, MARIO); // nose and ear
    setPixel(35, 79, BLACK); // top mustache
    drawHorizontalLine(79, 38, 39, BLACK); // sideburns
    drawHorizontalLine(80, 33, 36, BLACK); // mustache
    drawHorizontalLine(80, 37, 41, MARIO);
    drawHorizontalLine(80, 41, 43, BLACK);
    drawHorizontalLine(81, 34, 41, MARIO); 
    drawHorizontalLine(82, 36, 41, BLUE);
    drawHorizontalLine(83, 35, 42, BLUE);
    drawHorizontalLine(83, 37, 38, RED);
    drawHorizontalLine(84, 35, 40, RED);
    setPixel(37, 84, YELLOW);
    drawHorizontalLine(84, 41, 42, BLUE);
    drawHorizontalLine(85, 34, 39, RED);
    drawHorizontalLine(85, 40, 42, BLUE);
    drawHorizontalLine(86, 34, 42, RED);
    drawHorizontalLine(86, 38, 40, MARIO);
    setPixel(41, 86, BLUE);
    drawHorizontalLine(87, 34, 42, RED);
    drawHorizontalLine(87, 39, 40, MARIO);
    drawHorizontalLine(88, 35, 37, RED);
    drawHorizontalLine(88, 39, 42, RED);
    drawHorizontalLine(89, 35, 37, BLUE);
    drawHorizontalLine(89, 40, 42, BLUE);
    drawHorizontalLine(90, 34, 37, BLUE);
    drawHorizontalLine(90, 39, 42, BLUE);

    // 1-UP Words
    drawRectangle(50, 70, 2, 6, ORANGE); // 1
    drawHorizontalLine(76, 49, 52, ORANGE); // 1
    setPixel(49, 70, ORANGE); // 1
    drawRectangle(54, 70, 2, 6, ORANGE); // U
    drawRectangle(55, 75, 4, 2, ORANGE); // U
    drawRectangle(58, 70, 2, 6, ORANGE); // U
    drawRectangle(62, 70, 2, 7, ORANGE); // P
    drawHorizontalLine(70, 64, 66, ORANGE); // P
    drawRectangle(66, 71, 2, 2, ORANGE); // P
    drawHorizontalLine(73, 64, 66, ORANGE); // P
}

