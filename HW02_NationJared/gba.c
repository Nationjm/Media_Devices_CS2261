#include "gba.h"

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(x + i, y + j, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

void backgroundColors() {
    fillScreen(BLACK);
    for (int i = 10; i < 230; i++) {
        for (int j = 10; j < 20; j++) {
            setPixel(i, j, GREEN);
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 20; j < 70; j++) {
            setPixel(i, j, BLUE);
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 70; j < 80; j++) {
            setPixel(i, j, GREEN);
        }
    }
    for (int i = 10; i < 230; i++) {
        for (int j = 80; j < 140; j++) {
            setPixel(i, j, GRAY);
        }
    }
    for(int i = 10; i < 230; i++) {
        for (int j = 140; j < 150; j++) {
            setPixel(i, j, GREEN);
        }
    }
}

void lifeDisp(int lives) {
    drawRectangle(170, 2, 1, 7, WHITE);
    drawRectangle(170, 8, 3, 1, WHITE);
    drawRectangle(175, 2, 1, 7, WHITE);
    drawRectangle(178, 2, 1, 6, WHITE);
    setPixel(179, 8, WHITE);
    drawRectangle(180, 2, 1, 6, WHITE);
    drawRectangle(183, 2, 1, 7, WHITE);
    drawRectangle(183, 2, 3, 1, WHITE);
    drawRectangle(183, 5, 3, 1, WHITE);
    drawRectangle(183, 8, 3, 1, WHITE);
    drawRectangle(188, 2, 3, 1, WHITE);
    drawRectangle(188, 8, 3, 1, WHITE);
    drawRectangle(188, 5, 3, 1, WHITE);
    setPixel(188, 3, WHITE);
    setPixel(190, 6, WHITE);
    setPixel(188, 4, WHITE);
    setPixel(190, 7, WHITE);
    setPixel(193, 3, WHITE);
    setPixel(193, 7, WHITE);

    if (lives == 1) {
        drawRectangle(202, 2, 1, 7, WHITE);
        drawRectangle(199, 2, 1, 7, BLACK);
        drawRectangle(196, 2, 1, 7, BLACK);
    } else if (lives == 2) {
        drawRectangle(202, 2, 1, 7, WHITE);
        drawRectangle(199, 2, 1, 7, WHITE);
        drawRectangle(196, 2, 1, 7, BLACK);
    } else if (lives == 3) {
        drawRectangle(202, 2, 1, 7, WHITE);
        drawRectangle(199, 2, 1, 7, WHITE);
        drawRectangle(196, 2, 1, 7, WHITE);
    }
}

void game() {
    
}

void win(int stopDrawing) {
    if (stopDrawing == 0) {
        fillScreen(MAGENTA);
        // Y
        drawRectangle(65, 45, 3, 10, BLACK);
        drawRectangle(63, 40, 2, 6, BLACK);
        drawRectangle(68, 40, 2, 6, BLACK);

        // O
        drawRectangle(71, 40, 2, 15, BLACK);
        drawRectangle(73, 40, 3, 2, BLACK);
        drawRectangle(76, 40, 2, 15, BLACK);
        drawRectangle(73, 53, 3, 2, BLACK);

        // U
        drawRectangle(79, 40, 2, 15, BLACK);
        drawRectangle(84, 40, 2, 15, BLACK);
        drawRectangle(81, 53, 3, 2, BLACK);

        // W
        drawRectangle(135, 100, 3, 15, BLACK);
        drawRectangle(138, 113, 3, 2, BLACK);
        drawRectangle(141, 107, 2, 8, BLACK);
        drawRectangle(143, 113, 3, 2, BLACK);
        drawRectangle(146, 100, 3, 15, BLACK);

        // I
        drawRectangle(151, 100, 3, 15, BLACK);

        // N
        drawRectangle(157, 100, 3, 15, BLACK);
        drawRectangle(160, 100, 2, 3, BLACK);
        drawRectangle(161, 103, 2, 3, BLACK);
        drawRectangle(162, 106, 2, 3, BLACK);
        drawRectangle(163, 109, 2, 3, BLACK);
        drawRectangle(164, 112, 2, 3, BLACK);
        drawRectangle(165, 100, 3, 15, BLACK);
    }
}

void lose(int stopDrawing) {
    if (stopDrawing == 0) {
        fillScreen(BLACK);

        // G
        drawRectangle(65, 45, 9, 1, RED);
        drawRectangle(60, 46, 5, 1, RED);
        setPixel(59, 47, RED);
        setPixel(58, 48, RED);
        drawRectangle(57, 49, 1, 2, RED);
        drawRectangle(56, 51, 1, 2, RED);
        drawRectangle(55, 53, 1, 8, RED);
        setPixel(56, 61, RED);
        setPixel(57, 62, RED);
        drawRectangle(58, 63, 3, 1, RED);
        drawRectangle(61, 64, 10, 1, RED);
        setPixel(71, 63, RED);
        drawRectangle(72, 59, 1, 5, RED);
        setPixel(71, 58, RED);
        drawRectangle(69, 57, 2, 1, RED);
        drawRectangle(66, 56, 3, 1, RED);
        drawRectangle(63, 55, 4, 1, RED);
        drawRectangle(66, 54, 9, 1, RED);

        // A
        drawRectangle(81, 61, 1, 3, RED);
        drawRectangle(82, 59, 1, 2, RED);
        drawRectangle(83, 57, 1, 2, RED);
        drawRectangle(84, 54, 1, 3, RED);
        drawRectangle(85, 53, 1, 2, RED);
        setPixel(86, 54, RED);
        drawRectangle(86, 55, 7, 1, RED);
        setPixel(86, 52, RED);
        setPixel(87, 51, RED);
        setPixel(88, 50, RED);
        drawRectangle(89, 46, 1, 4, RED);
        setPixel(90, 45, RED);
        drawRectangle(92, 42, 1, 3, RED);
        drawRectangle(91, 43, 1, 11, RED);
        drawRectangle(92, 54, 1, 5, RED);
        drawRectangle(93, 59, 1, 4, RED);
        drawRectangle(94, 63, 1, 2, RED);

        // M
        drawRectangle(100, 61, 1, 3, RED);
        drawRectangle(101, 58, 1, 3, RED);
        drawRectangle(102, 56, 1, 2, RED);
        drawRectangle(103, 50, 1, 6, RED);
        drawRectangle(104, 47, 1, 3, RED);
        setPixel(105, 46, RED);
        drawRectangle(106, 43, 2, 3, RED);
        drawRectangle(107, 46, 1, 5, RED);
        drawRectangle(108, 51, 2, 1, RED);
        drawRectangle(110, 48, 1, 3, RED);
        drawRectangle(111, 45, 1, 3, RED);
        drawRectangle(112, 42, 1, 8, RED);
        drawRectangle(113, 50, 1, 6, RED);
        drawRectangle(114, 56, 1, 5, RED);

        // E
        drawRectangle(127, 44, 1, 13, RED);
        drawRectangle(128, 57, 1, 4, RED);
        drawRectangle(127, 44, 7, 1, RED);
        drawRectangle(134, 43, 3, 1, RED);
        drawRectangle(137, 42, 3, 1, RED);
        drawRectangle(127, 52, 7, 1, RED);
        drawRectangle(134, 51, 2, 1, RED);
        drawRectangle(135, 50, 2, 1, RED);
        drawRectangle(136, 49, 2, 1, RED);
        drawRectangle(128, 61, 13, 1, RED);
        setPixel(141, 60, RED);

        // O
        drawRectangle(95, 85, 7, 1, RED);
        drawRectangle(100, 84, 5, 1, RED);
        setPixel(95, 86, RED);
        setPixel(94, 87, RED);
        drawRectangle(93, 88, 1, 5, RED);
        drawRectangle(92, 93, 1, 4, RED);
        drawRectangle(93, 97, 1, 2, RED);
        drawRectangle(94, 99, 2, 2, RED);
        setPixel(95, 99, BLACK);
        setPixel(96, 101, RED);
        drawRectangle(97, 102, 3, 1, RED);
        drawRectangle(100, 103, 4, 1, RED);
        drawRectangle(104, 104, 4, 1, RED);
        drawRectangle(108, 102, 2, 2, RED);
        setPixel(108, 102, BLACK);
        setPixel(110, 101, RED);
        drawRectangle(111, 99, 1, 2, RED);
        drawRectangle(112, 94, 1, 5, RED);
        drawRectangle(111, 92, 1, 2, RED);
        drawRectangle(110, 89, 1, 3, RED);
        drawRectangle(108, 87, 2, 2, RED);
        setPixel(108, 88, BLACK);
        setPixel(107, 86, RED);
        drawRectangle(105, 85, 2, 1, RED);

        // V
        drawRectangle(120, 83, 2, 1, RED);
        drawRectangle(122, 84, 1, 2, RED);
        setPixel(123, 86, RED);
        drawRectangle(124, 87, 1, 2, RED);
        drawRectangle(125, 89, 1, 2, RED);
        setPixel(126, 91, RED);
        setPixel(127, 92, RED);
        setPixel(128, 93, RED);
        setPixel(129, 94, RED);
        drawRectangle(130, 95, 1, 2, RED);
        drawRectangle(131, 97, 1, 2, RED);
        setPixel(132, 99, RED);
        drawRectangle(133, 100, 2, 2, RED);
        setPixel(134, 100, BLACK);
        drawRectangle(135, 96, 1, 5, RED);
        drawRectangle(136, 92, 1, 4, RED);
        drawRectangle(137, 88, 1, 4, RED);
        drawRectangle(138, 85, 1, 3, RED);
        drawRectangle(139, 82, 1, 3, RED);
        drawRectangle(140, 80, 2, 2, RED);
        setPixel(141, 81, BLACK);

        // E
        drawRectangle(146, 79, 1, 13, RED);
        drawRectangle(147, 92, 1, 6, RED);
        setPixel(148, 97, RED);
        drawRectangle(148, 98, 11, 1, RED);
        setPixel(159, 97, RED);
        drawRectangle(147, 88, 2, 1, RED);
        drawRectangle(149, 87, 5, 1, RED);
        drawRectangle(154, 86, 5, 1, RED);
        drawRectangle(147, 78, 7, 1, RED);
        drawRectangle(154, 77, 3, 1, RED);
        setPixel(157, 76, RED);

        // R
        drawRectangle(165, 73, 1, 7, RED);
        drawRectangle(166, 80, 1, 5, RED);
        drawRectangle(167, 84, 1, 4, RED);
        drawRectangle(168, 88, 1, 4, RED);
        drawRectangle(169, 92, 1, 2, RED);
        drawRectangle(170, 94, 1, 3, RED);
        drawRectangle(165, 73, 6, 1, RED);
        drawRectangle(171, 74, 2, 1, RED);
        drawRectangle(172, 74, 1, 3, RED);
        drawRectangle(173, 77, 2, 1, RED);
        drawRectangle(175, 78, 1, 3, RED);
        setPixel(174, 81, RED);
        setPixel(173, 82, RED);
        setPixel(172, 83, RED);
        drawRectangle(168, 84, 7, 1, RED);
        setPixel(175, 85, RED);
        setPixel(176, 86, RED);
        drawRectangle(177, 87, 2, 1, RED);
        setPixel(179, 88, RED);
        drawRectangle(180, 89, 2, 1, RED);
        setPixel(182, 90, RED);
        setPixel(183, 91, RED);
        setPixel(184, 92, RED);

        // !
        drawRectangle(188, 91, 2, 2, RED);
        setPixel(189, 91, BLACK);
        setPixel(188, 89, RED);
        drawRectangle(187, 87, 1, 2, RED);
        drawRectangle(186, 85, 1, 2, RED);
        drawRectangle(185, 80, 1, 5, RED);
        drawRectangle(184, 73, 1, 7, RED);
        drawRectangle(183, 71, 1, 2, RED);
    }
}

