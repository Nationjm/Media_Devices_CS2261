# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




void DMANow(int channel, volatile void* src, volatile void* dst, unsigned int cnt);


typedef volatile struct {
    volatile void *src;
    volatile void *dst;
    unsigned int cnt;

} DMA;

extern DMA* dma;
# 43 "gba.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 70 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 89 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 106 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "main.c" 2

void update();
void draw();
void initialize();

u16 buttons, oldButtons;

typedef struct {
    int x, y, oldX, oldY;
    int width, height;
    u16 color;

} RECTANGLE;

RECTANGLE rectangle;

volatile u16 backgroundColor;
int changeBackground;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        update();
        waitForVBlank();
        draw();

    }

}


void initialize() {

    (*(volatile unsigned short*) 0x4000000) = ((3) & 7) | (1 << 10);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    rectangle.x = (240 / 2) - (rectangle.width / 2);
    rectangle.y = (160 / 2) - (rectangle.height / 2);
    rectangle.height = 50;
    rectangle.width = 50;
    rectangle.color = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);

    backgroundColor = (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10);
    changeBackground = 0;
    fillScreen(backgroundColor);

}

void update() {

    rectangle.oldX = rectangle.x;
    rectangle.oldY = rectangle.y;

    if ((~(buttons) & ((1<<5))) && rectangle.x > 0)
        rectangle.x--;

    if ((~(buttons) & ((1<<4))) && rectangle.x < (240 - rectangle.width))
        rectangle.x++;

    if ((~(buttons) & ((1<<6))) && rectangle.y > 0)
        rectangle.y--;

    if ((~(buttons) & ((1<<7))) && rectangle.y < (160 - rectangle.height))
        rectangle.y++;

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))))
        changeBackground = !changeBackground;

    if (changeBackground) {

        static short red = 31;
        static short green = 0;
        static short blue = 31;

        if (red == 31 && green < 31 && blue == 0) green++;
        else if (red > 0 && green == 31 && blue == 0) red--;
        else if (red == 0 && green == 31 && blue < 31) blue++;
        else if (red == 0 && green > 0 && blue == 31) green--;
        else if (red < 31 && green == 0 && blue == 31) red++;
        else if (red == 31 && green == 0 && blue > 0) blue--;

        red &= 31;
        green &= 31;
        blue &= 31;

        backgroundColor = (((red) & 31) | ((green) & 31) << 5 | ((blue) & 31) << 10);

    }

}
# 113 "main.c"
void draw() {

    if (changeBackground) {

        fillScreen(backgroundColor);

    }

    drawRectangle(rectangle.oldX, rectangle.oldY, rectangle.width, rectangle.height, backgroundColor);
    drawRectangle(rectangle.x, rectangle.y, rectangle.width, rectangle.height, rectangle.color);

}
