/// Copy anything you want from here -- it's not special...


#ifndef LIB_H
#define LIB_H

// Common Typedefs
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u16 oldButtons;

// ================================= DISPLAY ==================================

// Display Control Register
#define RGB(R, G, B) ((R) | (G) << 5 | (B) << 10)
#define REG_DISPCNT (*(unsigned short *)0x04000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define VIDEO_BUFFER ((u16*)0x06000000)
#define SetPixel(x, y, val) (VIDEO_BUFFER[(x) + (y)*240] = val)
#define V_COUNT (*(volatile u16*)0x04000006)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Miscellaneous Drawing Functions
void waitForVBlank();

// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;

// Button Macros
#define BUTTON_HELD(key)    (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~BUTTONS & (key)))

// DMA
#define DMA ((volatile DMAREC*)0x040000b0)

typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;

void fillScreen(volatile u16 color);
void drawChar(int x, int y, char ch, u16 color);
void drawCharWithBGColor(int x, int y, char ch, u16 color, u16 bgcolor);
/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */
void drawString(int x, int y, char* str, u16 color);
void drawStringWithBGColor(int x, int y, char* str, u16 color, u16 bgcolor);

#endif