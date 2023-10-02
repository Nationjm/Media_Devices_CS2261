#define REG_DISPCTL *(volatile unsigned short *) 0x04000000
#define MODE3 3
#define BG2_ENABLE (1 << 10)
#define PIXEL00 0x06000000

// TODO 1.1: Complete RGB color macro
#define RGB(R, G, B) (((R) & 31) | ((G) & 31) << 5 | ((B) & 31) << 10)

// TODO 1.2: Complete offset macro
#define OFFSET(x, y, width) (((x) + (width)*(y)))

// Predefined colors
#define RED RGB(31, 0, 0)
#define GREEN RGB(0, 31, 0)
#define BLUE RGB(0, 0, 31)
#define ORANGE RGB(31, 10, 5)
#define BLACK 0
#define WHITE RGB(31, 31, 31)

void setPixel(int, int, unsigned short);
void drawHorizontalLine(int, int, int, unsigned short);
void drawVerticalLine(int, int, int, unsigned short);

int main() {
    
    // TODO 1.0: Set the value of REG_DISPCTL to enable mode 3 and background 2
    REG_DISPCTL = 0x403;
    
    // TODO 1.4: Uncomment
    setPixel(0, 0, WHITE);
    setPixel(0, 1, RED);
    setPixel(0, 2, BLUE);
    setPixel(0, 3, GREEN);
    // END TODO 1.4

    // TODO 3.0 - draw out 'HELLO' above 'WORLD' using a combination of the line functions and setPixel
    // 'H'
    drawVerticalLine(100, 40, 45, ORANGE);
    setPixel(101, 42, ORANGE);
    drawVerticalLine(102, 40, 45, ORANGE);
    // 'E'
    drawVerticalLine(104, 40, 45, ORANGE);
    drawHorizontalLine(40, 104, 106, ORANGE);
    drawHorizontalLine(42, 104, 106, ORANGE);
    drawHorizontalLine(44, 104, 106, ORANGE);
    // 'L'
    drawVerticalLine(108, 40, 45, ORANGE);
    drawHorizontalLine(44, 108, 110, ORANGE);
    // 'L'
    drawVerticalLine(112, 40, 45, ORANGE);
    drawHorizontalLine(44, 112, 114, ORANGE);
    // 'O'
    drawVerticalLine(116, 40, 45, ORANGE);
    setPixel(117, 40, ORANGE);
    setPixel(117, 44, ORANGE);
    drawVerticalLine(118, 40, 45, ORANGE);

    // TODO 2.2: Uncomment
    // 'W'
    drawVerticalLine(100, 50, 53, ORANGE);
    setPixel(101, 54, ORANGE);
    setPixel(102, 53, ORANGE);
    setPixel(103, 54, ORANGE);
    drawVerticalLine(104, 50, 53, ORANGE);

    // 'O'
    drawVerticalLine(106, 50, 54, ORANGE);
    setPixel(107, 50, ORANGE);
    setPixel(107, 54, ORANGE);
    drawVerticalLine(108, 50, 54, ORANGE);

    // 'R'
    drawVerticalLine(110, 50, 54, ORANGE);
    setPixel(111, 50, ORANGE);
    setPixel(111, 52, ORANGE);
    drawVerticalLine(112, 50, 51, ORANGE);
    drawVerticalLine(112, 53, 54, ORANGE);

    // 'L'
    drawVerticalLine(114, 50, 54, ORANGE);
    setPixel(115, 54, ORANGE);

    // 'D'
    drawVerticalLine(117, 50, 54, ORANGE);
    setPixel(118, 50, ORANGE);
    setPixel(118, 54, ORANGE);
    drawVerticalLine(119, 51, 53, ORANGE);

    drawHorizontalLine(56, 100, 120, ORANGE);
    // END TODO 2.2

    while (1) {}
    return 0;
}


// TODO 1.3: Complete setPixel function
void setPixel(int x, int y, unsigned short color) {
    *(volatile unsigned short*)(PIXEL00 + (2 * OFFSET(x, y, 240))) = color;
}

// TODO 2.0: Complete drawHorizontalLine function
void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for(int i = x1; i < x2 + 1; i++) {
        setPixel(i, y, color);
    }
}

// TODO 2.1: Complete drawVerticalLine function
void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i < y2; i++) {
        setPixel(x, i, color);
    }
}