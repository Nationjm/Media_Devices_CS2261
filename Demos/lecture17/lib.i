# 1 "lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib.c"
# 1 "lib.h" 1

typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
# 35 "lib.h"
typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;






extern volatile u16 *videoBuffer;


void waitForVBlank();
void DMANow(int channel, const volatile void* src, volatile void* dst, volatile unsigned int cnt);

typedef void (*ihp_t)(void);
# 87 "lib.h"
extern int enableInput;
# 2 "lib.c" 2

volatile u16* videoBuffer = ((volatile unsigned short *)0x06000000);

int enableInput = 1;

void waitForVBlank() {
  enableInput = 0;
  __asm__("swi 0x02 << 16");



}

void DMANow(int channel, const volatile void* src, volatile void* dst, volatile unsigned int cnt){
  ((volatile DMAREC*)0x040000b0)[channel].src = src;
  ((volatile DMAREC*)0x040000b0)[channel].dst = dst;
  ((volatile DMAREC*)0x040000b0)[channel].cnt = (1<<31) | cnt;
}
