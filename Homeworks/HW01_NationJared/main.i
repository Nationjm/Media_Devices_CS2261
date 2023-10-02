# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1
# 39 "gba.h"
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;


void waitForVBlank();
void drawHorizontalLine(int, int, int, u16);
void drawVerticalLine(int, int, int, u16);
void drawRectangle(int, int, int, int, u16);
void fillScreen(u16);
void drawFrame1();
void drawFrame2();
void drawFrame3();
void drawFrame4();
# 80 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2


void initialize();
void updateGame();
void drawGame();
void loopingBackward();
void loopingForward();
int isLooping();

int frame = 1;
int oldFrame;

int frameDelay = 30;

int frameCount = 0;

unsigned short oldButtons;
unsigned short buttons;
int forwardBool;
int backwardBool;
int speed = 3;
int loopBool;


int main() {

    initialize();
    for (int i = 0; i < 38400; i++) {
        (videoBuffer[((1) * (240) + (i))] = 0x7FFF);
    }
    drawGame(1);

    while (1) {
        oldFrame = frame;
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        updateGame();
        waitForVBlank();
        if (((~buttons & ((1 << 3))) && (oldButtons & ((1 << 3)))) && forwardBool == 0 && backwardBool == 0) {
            forwardBool = 1;
        } else if (((~buttons & ((1 << 3))) && (oldButtons & ((1 << 3)))) && forwardBool == 1) {
            forwardBool = 0;
        } else if (((~buttons & ((1 << 3))) && (oldButtons & ((1 << 3)))) && backwardBool == 1) {
            backwardBool = 0;
        }
        if (forwardBool == 1) {
            loopingForward();
        }
        if (backwardBool == 1) {
            loopingBackward();
        }
        if (((~buttons & ((1 << 0))) && (oldButtons & ((1 << 0))))) {
            frame += 1;
            if (frame > 4) {
                frame = 1;
            }
            drawGame(frame);
        }
        if (((~buttons & ((1 << 1))) && (oldButtons & ((1 << 1))))) {
            frame -= 1;
            if (frame < 1) {
                frame = 4;
            }
            drawGame(frame);
        }
        if (((~buttons & ((1 << 5))) && (oldButtons & ((1 << 5))))) {
            frame = 1;
            drawGame(frame);
        }
        if (((~buttons & ((1 << 4))) && (oldButtons & ((1 << 4))))) {
            frame = 4;
            drawGame(frame);
        }
        if (((~buttons & ((1 << 2))) && (oldButtons & ((1 << 2)))) && forwardBool) {
            loopingBackward();
        } else if (((~buttons & ((1 << 2))) && (oldButtons & ((1 << 2)))) && backwardBool) {
            loopingForward();
        } else if (((~buttons & ((1 << 2))) && (oldButtons & ((1 << 2))))) {
            loopingBackward();
        }

        if (((~buttons & ((1 << 6))) && (oldButtons & ((1 << 6)))) && speed < 5) {
            speed += 1;
            switch(speed) {
                case 1:
                    frameDelay = 50;
                    break;
                case 2:
                    frameDelay = 40;
                    break;
                case 3:
                    frameDelay = 30;
                    break;
                case 4:
                    frameDelay = 20;
                    break;
                case 5:
                    frameDelay = 10;
                    break;
            }
        }
        if (((~buttons & ((1 << 7))) && (oldButtons & ((1 << 7)))) && speed > 1) {
            speed -= 1;
            switch(speed) {
                case 1:
                    frameDelay = 50;
                    break;
                case 2:
                    frameDelay = 40;
                    break;
                case 3:
                    frameDelay = 30;
                    break;
                case 4:
                    frameDelay = 20;
                    break;
                case 5:
                    frameDelay = 10;
                    break;
            }
        }


    }

    return 0;

}

void initialize() {
    mgba_open();
    mgba_printf("%s", "Debug logs initialized");
    (*(volatile unsigned short *) 0x04000000) = ((3) & 7) | (1 << 10);
}



void updateGame() {
    frameCount++;
    mgba_printf("%d", frameCount);
}

void drawGame(int frameNum) {
    if (frameNum == 1) {
        drawFrame1();
    } else if (frameNum == 2) {
        drawFrame2();
    } else if (frameNum == 3) {
        drawFrame3();
    } else if (frameNum == 4) {
        drawFrame4();
    }
}

void loopingForward() {
    forwardBool = 1;
    backwardBool = 0;
    if (frameCount > frameDelay && frame == 4) {
        frameCount = 0;
        frame = 1;
        drawGame(1);
    } else if (frameCount > frameDelay && frame == 1) {
        frameCount = 0;
        frame++;
        drawGame(2);
    } else if (frameCount > frameDelay && frame == 2) {
        frameCount = 0;
        frame++;
        drawGame(3);
    } else if (frameCount > frameDelay && frame == 3) {
        frameCount = 0;
        frame++;
        drawGame(4);
    }
}

void loopingBackward() {
    backwardBool = 1;
    forwardBool = 0;
    if (frameCount > frameDelay && frame == 4) {
        frameCount = 0;
        frame--;
        drawGame(3);
    } else if (frameCount > frameDelay && frame == 3) {
        frameCount = 0;
        frame--;
        drawGame(2);
    } else if (frameCount > frameDelay && frame == 2) {
        frameCount = 0;
        frame--;
        drawGame(1);
    } else if (frameCount > frameDelay && frame == 1) {
        frameCount = 0;
        frame = 4;
        drawGame(4);
    }
}
