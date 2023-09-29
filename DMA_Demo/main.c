#include "gba.h"

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
        buttons = REG_BUTTONS;

        update();
        waitForVBlank();
        draw();

    }

}

// sets up GBA
void initialize() {

    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    rectangle.x = (SCREENWIDTH / 2) - (rectangle.width / 2);
    rectangle.y = (SCREENHEIGHT / 2) - (rectangle.height / 2);
    rectangle.height = 50;
    rectangle.width = 50;
    rectangle.color = BLACK;
    
    backgroundColor = RGB(31, 0, 31);
    changeBackground = 0;
    fillScreen(backgroundColor);

}

void update() {

    rectangle.oldX = rectangle.x;
    rectangle.oldY = rectangle.y;

    if (BUTTON_HELD(BUTTON_LEFT) && rectangle.x > 0)
        rectangle.x--;
        
    if (BUTTON_HELD(BUTTON_RIGHT) && rectangle.x < (SCREENWIDTH - rectangle.width))
        rectangle.x++;

    if (BUTTON_HELD(BUTTON_UP) && rectangle.y > 0)
        rectangle.y--;

    if (BUTTON_HELD(BUTTON_DOWN) && rectangle.y < (SCREENHEIGHT - rectangle.height))
        rectangle.y++;
    
    if (BUTTON_PRESSED(BUTTON_START)) 
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

        backgroundColor = RGB(red, green, blue);

    }
    
}

//                                                    ---DMA MEMORY LOCATIONS---

// DMA CHANNEL 0                  | DMA CHANNEL 1                  | DMA CHANNEL 2                  | DMA CHANNEL 3
// Source Address:      0x40000B0 | Source Address:      0x40000BC | Source Address:      0x40000C8 | Source Address:      0x40000D4
// Destination Address: 0x40000B4 | Destination Address: 0x40000C0 | Destination Address: 0x40000CC | Destination Address: 0x40000D8
// Control Register:    0x40000B8 | Control Register:    0x40000C4 | Control Register:    0x40000D0 | Control Register:    0x40000DC

// IMPORTANT: Don't use these macros in Lab 5 or you won't receive credit — write DMANow using the DMA struct instead!! This is for practice and learning
#define DMA_3_SOURCE_ADDRESS (*((volatile u32*) 0x40000D4))
#define DMA_3_DESTINATION_ADDRESS (*((volatile u32*) 0x40000D8))
#define DMA_3_REG_CONTROL (*((volatile u32*) 0x40000DC))

void draw() {

    if (changeBackground) {

        fillScreen(backgroundColor);

    }

    drawRectangle(rectangle.oldX, rectangle.oldY, rectangle.width, rectangle.height, backgroundColor);
    drawRectangle(rectangle.x, rectangle.y, rectangle.width, rectangle.height, rectangle.color);

}