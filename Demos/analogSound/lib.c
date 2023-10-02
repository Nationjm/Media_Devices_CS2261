#include "lib.h"
#include "font.h"

// The old buttons
unsigned short oldButtons;

// Pause code execution until vertical blank begins
void waitForVBlank() {
    while(SCANLINECOUNTER >= 160);
    while(SCANLINECOUNTER < 160);
}

void drawChar(int x, int y, char ch, u16 color){
  for(int i=0; i<6; i++) {
    for(int j=0; j<8; j++) {
      if (fontdata_6x8[48*ch + i + 6*j]) {
        SetPixel(x + i, y + j, color);
      }
    }
  }
}

void drawCharWithBGColor(int x, int y, char ch, u16 color, u16 bgcolor){
  for(int i=0; i<6; i++) {
    for(int j=0; j<8; j++) {
      if (fontdata_6x8[48*ch + i + 6*j]) {
        SetPixel(x + i, y + j, color);
      } else {
        SetPixel(x + i, y + j, bgcolor);
      }
    }
  }
}

/* !!!!! For learning purposes only -- DO NOT COPY+PASTE FROM THIS FILE !!!!! */

void drawString(int x, int y, char* str, u16 color){
  if (*str == '\0') return;
  if (x>230){  // crude line wrapping
    y += 8;
    x -= 230;
  }
  drawChar(x, y, *str, color);
  drawString(x + 6, y, str + 1, color);
}

void drawStringWithBGColor(int x, int y, char* str, u16 color, u16 bgcolor){
  if (*str == '\0') return;
  if (x>230){  // crude line wrapping
    y += 8;
    x -= 230;
  }
  drawCharWithBGColor(x, y, *str, color, bgcolor);
  drawStringWithBGColor(x + 6, y, str + 1, color, bgcolor);
}

void fillScreen(u16 color){
  volatile int temp = color | color << 16;
  DMA[3].cnt = 0;  // No leftover settings breaking things!
  DMA[3].src = &temp;
  DMA[3].dst = VIDEO_BUFFER;
  DMA[3].cnt = 1 << 31 | // turn it on!
               1 << 26 | // set chunk size to 32 bits
               1 << 24 | // set src as fixed
               19200;    // 38400 / 2
}