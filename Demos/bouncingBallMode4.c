// notQuiteBouncingRectangle.c

#define RGB(R, G, B) (((R) & 31) | ((G) & 31) << 5 | ((B) & 31) << 10)
#define REG_DISPCNT (*(volatile unsigned short *)0x04000000)
#define MODE(x)     ((x) & 7)
#define BG2_ENABLE  (1<<10)
#define VIDEO_BUFFER ((volatile unsigned short *)0x06000000)

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
#define KEY_DOWN_NOW(key) (~(REG_KEYINPUT) & key)

#define DMA ((volatile DMAREC*)0x040000b0)

typedef unsigned short u16;
typedef unsigned char u8;
typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;


volatile u16* paletteMem = (unsigned short*)0x05000000;
const u16 myPalette[256] = { 0,11,21,31,32,43,53,63,192,203,213,223,352,363,373,383,512,523,533,543,672,683,693,703,832,843,853,863,992,1003,1013,1023,1024,1035,1045,1055,1056,1067,1077,1087,1216,1227,1237,1247,1376,1387,1397,1407,1536,1547,1557,1567,1696,1707,1717,1727,1856,1867,1877,1887,2016,2027,2037,2047,6144,6155,6165,6175,6176,6187,6197,6207,6336,6347,6357,6367,6496,6507,6517,6527,6656,6667,6677,6687,6816,6827,6837,6847,6976,6987,6997,7007,7136,7147,7157,7167,11264,11275,11285,11295,11296,11307,11317,11327,11456,11467,11477,11487,11616,11627,11637,11647,11776,11787,11797,11807,11936,11947,11957,11967,12096,12107,12117,12127,12256,12267,12277,12287,16384,16395,16405,16415,16416,16427,16437,16447,16576,16587,16597,16607,16736,16747,16757,16767,16896,16907,16917,16927,17056,17067,17077,17087,17216,17227,17237,17247,17376,17387,17397,17407,21504,21515,21525,21535,21536,21547,21557,21567,21696,21707,21717,21727,21856,21867,21877,21887,22016,22027,22037,22047,22176,22187,22197,22207,22336,22347,22357,22367,22496,22507,22517,22527,26624,26635,26645,26655,26656,26667,26677,26687,26816,26827,26837,26847,26976,26987,26997,27007,27136,27147,27157,27167,27296,27307,27317,27327,27456,27467,27477,27487,27616,27627,27637,27647,31744,31755,31765,31775,31776,31787,31797,31807,31936,31947,31957,31967,32096,32107,32117,32127,32256,32267,32277,32287,32416,32427,32437,32447,32576,32587,32597,32607,32736,32747,32757,32767 };

int time = 0;
int ballSize, ballX, ballY, ball_Vx, ball_Vy;
int screenWidth, screenHeight;
volatile u16* scanlineCounter = (u16*) 0x04000006;

#define FrameBuffer1 ((volatile unsigned short*)0x06000000)
#define FrameBuffer2 ((volatile unsigned short*)0x0600a000)
#define PS 16

// start drawing in frame 2 since frame 1 is showing.
volatile unsigned short *videoBuffer = FrameBuffer2;

void flipPages(){
  if(REG_DISPCNT & PS){
    videoBuffer = FrameBuffer2;  // videoBuffer needs to be a variable
  } else {
    videoBuffer = FrameBuffer1;
  }
  REG_DISPCNT ^= PS; // flip this bit every time
}

void setPixel4(int x, int y, unsigned char color){
  int offset = (x + y*240) >> 1;
  unsigned short originalShort = videoBuffer[offset];
  if (x & 1){
    videoBuffer[offset] = color << 8 | (originalShort & 0x00FF);
  } else {
    videoBuffer[offset] = color | (originalShort & 0xFF00);
  }
}

void drawImage4(int x, int y, int width, int height, const u8 *img){
  for (int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      setPixel4(x+i, y+j, img[i + width*j]);
    }
  }
}

void drawSquare(int x, int y, u16 size, u8 color){
  for (int i=0; i<size; i++){
    for (int j=0; j<size; j++){
      setPixel4(x+i, y+j, color);
    }
  }
}

void waitForVBlank() {
  while (*scanlineCounter >= 160);  // wait until current VBlank ends
  while (*scanlineCounter < 160);  // wait until next VBlank starts
}

void updateBallPosition() {
    ballX += ball_Vx;
    ballY += ball_Vy;

    if (ballX < 0){
      ballX = -ballX;
      ball_Vx = -ball_Vx;
    }
    if (ballY < 0){
      ballY = -ballY;
      ball_Vy = -ball_Vy;
    }
    if (ballX + ballSize >= screenWidth) {
      ballX -= ballX + ballSize - screenWidth;
      ball_Vx = -ball_Vx;
    }
    if (ballY + ballSize >= screenHeight) {
      ballY -= ballY + ballSize - screenHeight;
      ball_Vy = -ball_Vy;
    }
}

u8 colorFromInputs(){
  u8 color = 7; // red
  if (KEY_DOWN_NOW(KEY_A)) {
    color = color | (3 << 6);  // add blue
  }
  if (KEY_DOWN_NOW(KEY_B)) {
    color = color | (7 << 3);  // add green
  }
  return color;
}

void fillScreen4(unsigned char paletteI){
  // let's set 4 pixels at a time!
  volatile unsigned int color = paletteI << 24 | paletteI << 16 |
                                paletteI << 8 | paletteI;
  DMA[3].cnt = 0;  // clear it first!
  DMA[3].src = &color;
  DMA[3].dst = videoBuffer;
  DMA[3].cnt = 1 << 31 | // turn it on
               1 << 24 | // with src fixed
               1 << 26 | // with chunk size 32
               (38400 / 4); // 4 pixels per-int
}

int main() {
  REG_DISPCNT = MODE(4) | BG2_ENABLE;

  time = 0;
  ballSize = 5;
  screenWidth = 240;
  screenHeight = 160;
  ballX = screenWidth / 2;
  ballY = screenHeight / 2;
  ball_Vx = 1;
  ball_Vy = 2;

  // set up myPalette!
  DMA[3].src = &myPalette;
  DMA[3].dst = paletteMem;
  DMA[3].cnt = (1 << 31) | 256;

  while (1) {
    int skipFrames = 2;  // only do things every so many frames
    if (time % skipFrames == 0) {
      updateBallPosition();
    }
    fillScreen4(0);
    drawSquare(ballX, ballY, ballSize, colorFromInputs());

    waitForVBlank();
    flipPages();
    time++;
  }
  return 0;
}
