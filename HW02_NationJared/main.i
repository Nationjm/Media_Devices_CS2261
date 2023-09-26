# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 23 "gba.h"
extern volatile unsigned short* videoBuffer;
# 35 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 56 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);


void backgroundColors();
void lifeDisp(int lives);
void game();
void win();
void lose();
# 79 "gba.h"
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


unsigned short buttons;
unsigned short oldButtons;
int lives;
int stopDrawing = 0;
int draw = 0;


enum STATE{GAME, WIN, LOSE} state;
enum {
    STATIONARY = 0,
    MOVED = 1
};
enum {
    LEFT = 0,
    RIGHT = 1
};
enum {
    COLLIDING = 1,
    NOT = 0
};


typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    int active;
    unsigned short color;
    unsigned short direction;
} CAR;

CAR* car;
CAR car1;
CAR car2;
CAR car3;
CAR car4;
CAR car5;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    int active;
    unsigned short direction;
} LOG;

LOG* log;
LOG log1;
LOG log2;
LOG log3;
LOG log4;
LOG log5;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    int moved;
    unsigned short color;
    unsigned short colliding;
} PLAYER;

PLAYER* player;
PLAYER player1;

void initialize();

int main() {

    initialize();
    backgroundColors();
    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        update();
        waitForVBlank();

        switch(state) {
            case GAME:
                game();
                stopDrawing = 0;
                if (lives == 0) {
                    state = LOSE;
                }
                if (player1.y < 20) {
                    state = WIN;
                }
                drawLogs(&log1);
                drawLogs(&log2);
                drawLogs(&log3);
                drawLogs(&log4);
                drawLogs(&log5);
                drawCar(&car1);
                drawCar(&car2);
                drawCar(&car3);
                drawCar(&car4);
                drawCar(&car5);
                drawPlayer(&player1);
                lifeDisp(lives);
                break;
            case WIN:
                win(stopDrawing);
                stopDrawing = 1;
                if ((((~buttons & (1<<0)) && !(~oldButtons & (1<<0))))) {
                    backgroundColors();
                    lives = 3;
                    player1.x = 115;
                    player1.y = 141;
                    state = GAME;
                }
                break;
            case LOSE:
                lose(stopDrawing);
                stopDrawing = 1;
                if ((((~buttons & (1<<0)) && !(~oldButtons & (1<<0))))) {
                    backgroundColors();
                    player1.x = 115;
                    player1.y = 141;
                    lives = 3;
                    state = GAME;
                }
                break;
        }

    }

    return 0;

}

void initialize() {
    mgba_open();
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | ((1 << (8 + ((2) % 4))));
    state = GAME;
    player1.x = 115;
    player1.y = 141;
    player1.oldX = 115;
    player1.oldY = 141;
    player1.height = 8;
    player1.width = 8;
    player1.moved = STATIONARY;
    player1.color = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    player1.colliding = NOT;

    player = &player1;

    log1.x = 214;
    log1.y = 21;
    log1.oldX = 214;
    log1.oldY = 21;
    log1.width = 16;
    log1.height = 8;
    log1.direction = LEFT;

    log2.x = 10;
    log2.y = 31;
    log2.oldX = 10;
    log2.oldY = 31;
    log2.width = 16;
    log2.height = 8;
    log2.direction = RIGHT;

    log3.x = 156;
    log3.y = 41;
    log3.oldX = 156;
    log3.oldY = 41;
    log3.width = 16;
    log3.height = 8;
    log3.direction = LEFT;

    log4.x = 60;
    log4.y = 51;
    log4.oldX = 60;
    log4.oldY = 51;
    log4.width = 16;
    log4.height = 8;
    log4.direction = RIGHT;

    log5.x = 106;
    log5.y = 61;
    log5.oldX = 106;
    log5.oldY = 61;
    log5.width = 16;
    log5.height = 8;
    log5.direction = LEFT;

    car1.x = 214;
    car1.y = 81;
    car1.oldX = 214;
    car1.oldY = 81;
    car1.width = 16;
    car1.height = 8;
    car1.color = (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);
    car1.direction = LEFT;

    car2.x = 23;
    car2.y = 101;
    car2.oldX = 23;
    car2.oldY = 101;
    car2.width = 16;
    car2.height = 8;
    car2.color = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
    car2.direction = RIGHT;

    car3.x = 56;
    car3.y = 121;
    car3.oldX = 56;
    car3.oldY = 121;
    car3.width = 16;
    car3.height = 8;
    car3.color = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    car3.direction = LEFT;

    lives = 3;
}

void update() {
    player->oldX = player->x;
    player->oldY = player->y;


    if ((((~buttons & (1<<6)) && !(~oldButtons & (1<<6)))) && player->y > 20) {
        player->y = (player->y - 10);
        player->moved = MOVED;
    } else if ((((~buttons & (1<<7)) && !(~oldButtons & (1<<7)))) && player->y < 140) {
        player->y = (player->y + 10);
        player->moved = MOVED;
    }
    if ((((~buttons & (1<<5)) && !(~oldButtons & (1<<5)))) && player->x > 20) {
        player->x = (player->x - 10);
        player->moved = MOVED;
    } else if ((((~buttons & (1<<4)) && !(~oldButtons & (1<<4)))) && player->x < 210) {
        player->x = (player->x + 10);
        player->moved = MOVED;
    }

}

void drawPlayer(PLAYER* player) {
    if (player->moved && (player->oldY >= 140)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 80)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, (((15) & 31) | ((15) & 31) << 5 | ((15) & 31) << 10));
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 70)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 20)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
        player->moved = STATIONARY;
    } else if (player->moved && (player->oldY > 10)) {
        drawRectangle(player->oldX, player->oldY, player->width, player->height, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
        player->moved = STATIONARY;
    }
    drawRectangle(player->x, player->y, player->width, player->height, player->color);
    if (player->y > 20 && player->y < 70 && player->colliding == NOT) {
        drawRectangle(player->x, player->y, player->width, player->height, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
        player->x = 115;
        player->y = 141;
        lives -= 1;
    }
    player1.colliding = NOT;
}

void drawLogs(LOG* log) {
    drawRectangle(log->oldX, log->oldY, log->width, log->height, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    log->oldX = log->x;
    log->oldY = log->y;
    drawRectangle(log->x, log->y, log->width, log->height, (((20) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
    if (log->x > 10 && log->direction == LEFT) {
        log->x -= 1;
    } else if (log->x <= 10 && log->direction == LEFT) {
        log->x = 214;
    } else if (log->x < 214 && log->direction == RIGHT) {
        log->x += 1;
    } else if (log->x >= 214 && log->direction == RIGHT) {
        log->x = 10;
    }
    if (log->x < player1.x + player1.width && log->x + log->width > player1.x && log->y < player1.y + player1.height && log->y + log->height > player1.y){
        if (log->direction == LEFT) {
            player1.x -= 1;
            player1.colliding = COLLIDING;
            player1.moved = MOVED;
            if (log->x < 10) {
                player1.colliding = NOT;
            }
        } else {
            player1.x += 1;
            player1.colliding = COLLIDING;
            player1.moved = MOVED;
            if (log->x > 214) {
                player1.colliding = NOT;
            }
        }
    }
}

void drawCar(CAR* car) {
    drawRectangle(car->oldX, car->oldY, car->width, car->height, (((15) & 31) | ((15) & 31) << 5 | ((15) & 31) << 10));
    car->oldX = car->x;
    car->oldY = car->y;
    drawRectangle(car->x, car->y, car->width, car->height, car->color);
    if (car->x > 10 && car->direction == LEFT) {
        car->x -= 1;
    } else if (car->x <= 10 && car->direction == LEFT) {
        car->x = 214;
    } else if (car->x < 214 && car->direction == RIGHT) {
        car->x += 1;
    } else if (car->x >= 214 && car->direction == RIGHT) {
        car->x = 10;
    }
    if (car->x < player1.x + player1.width && car->x + car->width > player1.x && car->y < player1.y + player1.height && car->y + car->height > player1.y) {
        drawRectangle(player1.x, player1.y, 8, 8, (((15) & 31) | ((15) & 31) << 5 | ((15) & 31) << 10));
        player1.x = 115;
        player1.y = 141;
        lives -= 1;
    }
}
