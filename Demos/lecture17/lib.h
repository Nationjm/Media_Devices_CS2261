// unsigned types
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

// video macros
#define RGB(R, G, B) ((R) | (G) << 5 | (B) << 10)
#define REG_DISPCNT (*(volatile unsigned short *)0x04000000)
#define MODE(x) ((x) % 6)
#define BG2_ENABLE (1<<10)
#define VIDEO_BUFFER ((volatile unsigned short *)0x06000000)
#define SCANLINE_COUNTER (*(volatile u16*)0x04000006)
#define SetPixel(x, y, val) (VIDEO_BUFFER[(x) + (y)*240] = (val))
#define PAL_MEM ((volatile unsigned short*)0x05000000)
#define SPRITE_PAL (PAL_MEM + 256)
#define SPRITE_ENABLE (1 << 12)
#define ROWMASK (0xFF)
#define COLMASK (0x1FF)

// Input
#define REG_KEYINPUT (*(volatile u16*)0x04000130)
#define KEY_A        0x0001
#define KEY_B        0x0002
#define KEY_SELECT   0x0004
#define KEY_START    0x0008
#define KEY_RIGHT    0x0010
#define KEY_LEFT     0x0020
#define KEY_UP       0x0040
#define KEY_DOWN     0x0080
#define KEY_R        0x0100
#define KEY_L        0x0200
#define KEY_DOWN_NOW(key) ((~(REG_KEYINPUT) & key) && enableInput)

// DMA
typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;

#define DMA ((volatile DMAREC*)0x040000b0)
#define DMA_SRC_FIXED (1 << 24)
#define DMA_CHUNK_32 (1 << 26)

// Common Variables
extern volatile u16 *videoBuffer;

// Methods
void waitForVBlank();
void DMANow(int channel, const volatile void* src, volatile void* dst, volatile unsigned int cnt);

typedef void (*ihp_t)(void);

//primary interrupt locations
#define REG_IME *(volatile u16*)0x04000208
#define REG_IE *(volatile u16*)0x04000200
#define REG_IF *(volatile u16*)0x04000202
#define REG_INTERRUPT *((ihp_t *)0x03007FFC)		// ???
#define REG_DISPSTAT *(volatile u16*)0x04000004

//interrupt constants for turning them on
#define INT_VBLANK_ENABLE 1 << 3
#define INT_HBLANK_ENABLE 1 << 4

//interrupt constants for checking which type of interrupt happened
#define INT_VB 1 << 0
#define INT_BUTTON 1 << 12
//interrupt constants for checking which type of interrupt happened
#define INT_VB     1 <<  0	// VB – vertical blank interrupt
#define INT_HB     1 <<  1  // HB – horizontal blank interrupt
#define INT_VC     1 <<  2	// VC – vertical scanline count interrupt
#define INT_T0     1 <<  3	// T0 – timer 0 interrupt
#define INT_T1     1 <<  4	// T1 – timer 1 interrupt
#define INT_T2     1 <<  5	// T2 – timer 2 interrupt
#define INT_T3     1 <<  6	// T3 – timer 3 interrupt
#define INT_COM    1 <<  7	// COM – serial communication interrupt
#define INT_DMA0   1 <<  8	// DMA0 – DMA0 finished interrupt
#define INT_DMA1   1 <<  9	// DMA1 – DMA1 finished interrupt
#define INT_DMA2   1 << 10 	// DMA2 – DMA2 finished interrupt
#define INT_DMA3   1 << 11	// DMA3 – DMA3 finished interrupt
#define INT_BUTTON 1 << 12 	// BUTTON – button interrupt
#define INT_CART   1 << 13	// CART – game cartridge interrupt



extern int enableInput;