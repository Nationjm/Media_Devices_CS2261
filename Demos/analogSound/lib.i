# 1 "lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib.c"
# 1 "lib.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u16 oldButtons;
# 29 "lib.h"
void waitForVBlank();
# 49 "lib.h"
extern unsigned short oldButtons;
# 58 "lib.h"
typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;

void fillScreen(volatile u16 color);
void drawChar(int x, int y, char ch, u16 color);
void drawCharWithBGColor(int x, int y, char ch, u16 color, u16 bgcolor);

void drawString(int x, int y, char* str, u16 color);
void drawStringWithBGColor(int x, int y, char* str, u16 color, u16 bgcolor);
# 2 "lib.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[];
# 3 "lib.c" 2


unsigned short oldButtons;


void waitForVBlank() {
    while((*(volatile unsigned short *)0x4000006) >= 160);
    while((*(volatile unsigned short *)0x4000006) < 160);
}

void drawChar(int x, int y, char ch, u16 color){
  for(int i=0; i<6; i++) {
    for(int j=0; j<8; j++) {
      if (fontdata_6x8[48*ch + i + 6*j]) {
        (((u16*)0x06000000)[(x + i) + (y + j)*240] = color);
      }
    }
  }
}

void drawCharWithBGColor(int x, int y, char ch, u16 color, u16 bgcolor){
  for(int i=0; i<6; i++) {
    for(int j=0; j<8; j++) {
      if (fontdata_6x8[48*ch + i + 6*j]) {
        (((u16*)0x06000000)[(x + i) + (y + j)*240] = color);
      } else {
        (((u16*)0x06000000)[(x + i) + (y + j)*240] = bgcolor);
      }
    }
  }
}



void drawString(int x, int y, char* str, u16 color){
  if (*str == '\0') return;
  if (x>230){
    y += 8;
    x -= 230;
  }
  drawChar(x, y, *str, color);
  drawString(x + 6, y, str + 1, color);
}

void drawStringWithBGColor(int x, int y, char* str, u16 color, u16 bgcolor){
  if (*str == '\0') return;
  if (x>230){
    y += 8;
    x -= 230;
  }
  drawCharWithBGColor(x, y, *str, color, bgcolor);
  drawStringWithBGColor(x + 6, y, str + 1, color, bgcolor);
}

void fillScreen(u16 color){
  volatile int temp = color | color << 16;
  ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
  ((volatile DMAREC*)0x040000b0)[3].src = &temp;
  ((volatile DMAREC*)0x040000b0)[3].dst = ((u16*)0x06000000);
  ((volatile DMAREC*)0x040000b0)[3].cnt = 1 << 31 |
               1 << 26 |
               1 << 24 |
               19200;
}
