# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 20 "main.c"
void setPixel(int, int, unsigned short);
void drawHorizontalLine(int, int, int, unsigned short);
void drawVerticalLine(int, int, int, unsigned short);

int main() {


    *(volatile unsigned short *) 0x04000000 = 0x403;


    setPixel(0, 0, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    setPixel(0, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    setPixel(0, 2, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    setPixel(0, 3, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));




    drawVerticalLine(100, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(101, 42, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(102, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

    drawVerticalLine(104, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawHorizontalLine(40, 104, 106, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawHorizontalLine(42, 104, 106, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawHorizontalLine(44, 104, 106, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

    drawVerticalLine(108, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawHorizontalLine(44, 108, 110, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

    drawVerticalLine(112, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawHorizontalLine(44, 112, 114, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

    drawVerticalLine(116, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(117, 40, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(117, 44, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(118, 40, 45, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));



    drawVerticalLine(100, 50, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(101, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(102, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(103, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(104, 50, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));


    drawVerticalLine(106, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(107, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(107, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(108, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));


    drawVerticalLine(110, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(111, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(111, 52, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(112, 50, 51, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(112, 53, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));


    drawVerticalLine(114, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(115, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));


    drawVerticalLine(117, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(118, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    setPixel(118, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    drawVerticalLine(119, 51, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

    drawHorizontalLine(56, 100, 120, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));


    while (1) {}
    return 0;
}



void setPixel(int x, int y, unsigned short color) {
    *(volatile unsigned short*)(0x06000000 + (2 * (((x) + (240)*(y))))) = color;
}


void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for(int i = x1; i < x2 + 1; i++) {
        setPixel(i, y, color);
    }
}


void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i < y2; i++) {
        setPixel(x, i, color);
    }
}
