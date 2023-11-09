// Common Typedefs
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

// Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE(num) (num)
#define DISP_BACKBUFFER (1<<4)
#define BG0_ENABLE (1<<8)
#define BG1_ENABLE (1<<9)
#define BG2_ENABLE (1<<10)
#define BG3_ENABLE (1<<11)
#define SPRITE_ENABLE (1<<12)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Video Buffer
extern unsigned short *videoBuffer;

// Palette
#define PALETTE ((unsigned short *)0x5000000)

// Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)

// Miscellaneous Drawing Functions
void waitForVBlank();

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
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))


// DMA Struct
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

// First DMA Register Address
extern DMA *dma;

// Begin DMA
#define DMA_ON (1 << 31)

// DMA Functions
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

// MODE 0 STUFF!

// Some useful defines:
#define REG_BG0CNT *(volatile unsigned short*)0x4000008
#define REG_BG1CNT *(volatile unsigned short*)0x400000A
#define REG_BG2CNT *(volatile unsigned short*)0x400000C
#define REG_BG3CNT *(volatile unsigned short*)0x400000E

#define BG_SBB(num) ((num) << 8)  // remember SBB: [0-31]
#define BG_CBB(num) ((num) << 2)  // CBB: [0-3]
#define BG_COLOR256 (1 << 7)      // 8bpp mode
                        // width x height
#define BG_SIZE0 0<<14  // 32 x 32 tiles
#define BG_SIZE1 1<<14  // 64 x 32 tiles
#define BG_SIZE2 2<<14  // 32 x 64 tiles
#define BG_SIZE3 3<<14  // 64 x 64 tiles

#define REG_BG0HOFS *(volatile unsigned short *)0x04000010
#define REG_BG0VOFS *(volatile unsigned short *)0x04000012
#define REG_BG1HOFS *(volatile unsigned short *)0x04000014
#define REG_BG1VOFS *(volatile unsigned short *)0x04000016
#define REG_BG2HOFS *(volatile unsigned short *)0x04000018
#define REG_BG2VOFS *(volatile unsigned short *)0x0400001A
#define REG_BG3HOFS *(volatile unsigned short *)0x0400001C
#define REG_BG3VOFS *(volatile unsigned short *)0x0400001E

typedef u16 SCREENBLOCK[1024];
#define SBB ((SCREENBLOCK*)0x06000000)

typedef struct { u16 data[16];  } TILE;
typedef TILE CHARBLOCK[512];
#define CBB ((CHARBLOCK*)0x06000000)


// sprite stuff
#define SPRITE_ENABLE (1<<12)
#define SPRITE_1D_MODE (1<<6)
#define SPRITE_2D_MODE (0<<6)
#define ALIGN(x) __attribute__((aligned(x)))
#define OAM ((void *)0x07000000)
#define SPRITE_TILE_MEM ((void *)0x06010000)

#define OAM_ATTRO_MODE_REGULAR (0<<8)
#define OAM_ATTRO_MODE_AFFINE (1<<8)
#define OAM_ATTRO_MODE_HIDE (2<<8)
#define OAM_ATTRO_MODE_DOUBLE_AFFINE (3<<8)
#define OAM_ATTRO_SHAPE_SQUARE (0<<14)
#define OAM_ATTRO_SHAPE_WIDE (1<<14)
#define OAM_ATTRO_SHAPE_TALL (2<<14)

#define OAM_ATTR1_SIZE_XS (0<<14)
#define OAM_ATTR1_SIZE_S (1<<14)
#define OAM_ATTR1_SIZE_M (2<<14)
#define OAM_ATTR1_SIZE_L (3<<14)
#define OAM_ATTR1_AFFINE(x) ((x) << 9)

#define OAM_ATTR1_H_FLIP (1<<12)
#define OAM_ATTR1_V_FLIP (1<<13)

#define OAM_ATTR2_SUBPAL(row) ((row) << 12)

typedef struct
{
  u16 attr0;
  u16 attr1;
  u16 attr2;
  short fill;
} ALIGN(4) OBJ_ATTR;