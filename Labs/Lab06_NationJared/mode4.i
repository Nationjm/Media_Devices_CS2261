# 1 "mode4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode4.c"
# 1 "mode4.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();
# 63 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 79 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 111 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 5 "mode4.h" 2





void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
void drawChar4(int x, int y, char ch, unsigned short colorIndex);
void drawString4(int x, int y, char *str, unsigned short colorIndex);
# 2 "mode4.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "mode4.c" 2


void setPixel4(int x, int y, unsigned char colorIndex) {

    int offset = ((y) * (240) + (x)) >> 1;
    unsigned short originalShort = videoBuffer[offset];
    if (x & 1) {
        videoBuffer[offset] = colorIndex << 8 | (originalShort & 0x00FF);
    } else {
        videoBuffer[offset] = colorIndex | (originalShort & 0xFF00);
    }
}


void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex) {

    volatile unsigned short color = colorIndex << 8 | colorIndex;
    if (x & 1) {
        if (width & 1) {
            for (int i = 0; i < height; i++) {
                setPixel4(x, y + i, color);
                if (width - 1 >= 2) {
                    DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x + 1)) / 2], ((width - 1) / 2) | (2 << 23) | (0 << 26));
                }
            }
        } else {
            for (int i = 0; i < height; i++) {
                setPixel4(x, y + i, color);
                setPixel4(x + width - 1, y + i, color);
                if (width - 2 >= 2) {
                    DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x + 1)) / 2], ((width - 2) / 2) | (2 << 23) | (0 << 26));
                }
            }
        }
    } else {
        if (width & 1) {
            for (int i = 0; i < height; i++) {
                setPixel4(x + width - 1, y + i, color);
                if (width - 1 >= 2) {
                    DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x)) / 2], ((width - 1) / 2) | (2 << 23) | (0 << 26));
                }
            }
        } else {
            if (width >= 2) {
                for (int i = 0; i < height; i++) {
                    DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x)) / 2], (width / 2) | (2 << 23));
                }
            }
        }
    }
}


void fillScreen4(volatile unsigned char colorIndex) {

    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 |
                                  colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, 1 << 24 | 1 << 26 | (38400 / 4));
}


void drawImage4(int x, int y, int width, int height, const unsigned short *image) {

    for (int i = 0; i < height; i++ ) {
        DMANow(3, &image[((i) * (width / 2) + (0))], &videoBuffer[((y + i) * (240) + (x)) / 2], (width / 2));
    }
}


void drawFullscreenImage4(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 160 * 240 / 2);
}


void drawChar4(int x, int y, char ch, unsigned short colorIndex) {
    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + ((r) * (6) + (c))]) {
                setPixel4(x+c, y+r, colorIndex);
            }
        }
    }
}


void drawString4(int x, int y, char *str, unsigned short colorIndex) {

    while(*str != '\0') {
        drawChar4(x, y, *str, colorIndex);
        x += 6;

        str++;
    }
}


void flipPage() {
    if ((*(volatile unsigned short *)0x4000000) & (1 << 4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}
