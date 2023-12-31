# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short* videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 99 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 4 "game.c" 2
# 1 "print.h" 1
# 25 "print.h"
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
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "game.c" 2
# 1 "game.h" 1
# 12 "game.h"
typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int yVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int punching;
    int punchingTime;
    int jumping;
    int jumpingTime;
    int lightning;
    unsigned char oamIndex;
} LUFFY;
LUFFY luffy;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    unsigned char oamIndex;
} LUFFYFIST;
LUFFYFIST luffyFist;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int isMoving;
    int xVel;
    int numFrames;
    int frame;
    int timeUntilNextFrame;
    int direction;
    int attacking;
    int attackingTime;
    unsigned char oamIndex;
} KAIDO;
KAIDO kaido;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int timeUntilNextFrame;
    int numFrames;
    int frame;
    int shooting;
    int timeUntilNextShot;
    unsigned char oamIndex;
} FIREBALL;
FIREBALL fireball;
FIREBALL fireballs[5];

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int timeUntilNextShot;
    int active;
    int direction;
    unsigned char oamIndex;
} LIGHTNING;
LIGHTNING lightning[4];


void start();
void instructions();
void kaido1();
void kaido2();
void pause();
void win();
void lose();


void goToStart();
void goToInstructions();
void goToKaido1();
void goToKaido2();
void goToPause();
void goToWin();
void goToLose();


void luffyUpdate();
void initLuffy();
void luffyPunching();
void luffyJumping();
void gearFive();
void groundChange();
void luffyUpdate2();

void lightningUpdate();
void luffyLightningThrow();
void initLightning();



void initKaido();
void kaidoUpdate();
void kaidoUpdate2();

void fireballUpdate();
void shootFireball();
void fireballUpdate2();
void initFireball2();
void shootFireball2(FIREBALL *fireball);


int fireballCollision();
int punchCollision();
int lightningCollision(LIGHTNING *lightning);
int fireballCollision2(FIREBALL *fireball);


void setupSounds();
void setupInterrupts();
void interruptHandler();
# 6 "game.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 7 "game.c" 2
# 1 "luffyStartScreen.h" 1
# 21 "luffyStartScreen.h"
extern const unsigned short luffyStartScreenBitmap[19200];


extern const unsigned short luffyStartScreenPal[256];
# 8 "game.c" 2
# 1 "LuffyWinScreen.h" 1
# 21 "LuffyWinScreen.h"
extern const unsigned short LuffyWinScreenBitmap[19200];


extern const unsigned short LuffyWinScreenPal[256];
# 9 "game.c" 2
# 1 "wanoInstructions.h" 1
# 21 "wanoInstructions.h"
extern const unsigned short wanoInstructionsBitmap[19200];


extern const unsigned short wanoInstructionsPal[256];
# 10 "game.c" 2

# 1 "RooftopGroundBackground.h" 1







extern const unsigned short RooftopGroundBackgroundMap[1024];
# 12 "game.c" 2
# 1 "Rooftop_Ground_TilesetBitmap.h" 1
# 21 "Rooftop_Ground_TilesetBitmap.h"
extern const unsigned short Rooftop_Ground_TilesetBitmapTiles[9600];


extern const unsigned short Rooftop_Ground_TilesetBitmapPal[256];
# 13 "game.c" 2
# 1 "LuffyandKaidoSprites.h" 1
# 21 "LuffyandKaidoSprites.h"
extern const unsigned short LuffyandKaidoSpritesTiles[16384];


extern const unsigned short LuffyandKaidoSpritesPal[256];
# 14 "game.c" 2
# 1 "digitalSound.h" 1

void setupSounds();
void playSong(const signed char* songData, int length, int offState);
void playSoundEffect(const signed char* soundData, int length);

void stopSong();
void stopSoundEffect();

void pauseSong();
void unpauseSong();
# 49 "digitalSound.h"
typedef struct {
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int state;
    int vBlankCount;
} SOUND;

SOUND song;
SOUND soundEffect;
# 15 "game.c" 2
# 1 "BinksBrew.h" 1


extern const unsigned int BinksBrew_sampleRate;
extern const unsigned int BinksBrew_length;
extern const signed char BinksBrew_data[];
# 16 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 60 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 80 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 186 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 266 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 396 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 577 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 17 "game.c" 2
# 1 "loseScreen.h" 1
# 21 "loseScreen.h"

# 21 "loseScreen.h"
extern const unsigned short loseScreenBitmap[19200];


extern const unsigned short loseScreenPal[256];
# 18 "game.c" 2
# 1 "DrumsOfLiberation.h" 1


extern const unsigned int DrumsOfLiberation_sampleRate;
extern const unsigned int DrumsOfLiberation_length;
extern const signed char DrumsOfLiberation_data[];
# 19 "game.c" 2
# 1 "PauseScreen.h" 1
# 21 "PauseScreen.h"
extern const unsigned short PauseScreenBitmap[19200];


extern const unsigned short PauseScreenPal[256];
# 20 "game.c" 2
# 1 "LuffyPunchSound.h" 1


extern const unsigned int LuffyPunchSound_sampleRate;
extern const unsigned int LuffyPunchSound_length;
extern const signed char LuffyPunchSound_data[];
# 21 "game.c" 2
# 1 "Clouds.h" 1







extern const unsigned short CloudsMap[2048];
# 22 "game.c" 2
# 1 "MovingMountains.h" 1







extern const unsigned short MovingMountainsMap[2048];
# 23 "game.c" 2
# 1 "betweenFightScreen.h" 1
# 21 "betweenFightScreen.h"
extern const unsigned short betweenFightScreenBitmap[19200];


extern const unsigned short betweenFightScreenPal[256];
# 24 "game.c" 2


extern unsigned short state;
enum {
    START,
    INSTRUCTIONS,
    KAIDO1,
    KAIDO2,
    BIGMOM1,
    BIGMOM2,
    PAUSE,
    WIN,
    LOSE,
    BETWEENFIGHT
} STATE;


enum {
    LEFT,
    RIGHT,
    JUMP,
    PUNCH
} DIRECTION;


enum {
    UP,
    DOWN
} KAIDODIRECTION;


OBJ_ATTR shadowOAM[128];

int luffyLives;
int kaidoHealth;
int luffyPunched;
int kaidoWordOAMIndex = 19;
int rSeed;
int punchDamage = 1;
int gearFifth = 0;
int groundChanging = 0;
int groundFrames = 0;
int tileTemp = 0;
int luffyLightning = 0;
int timeUntilNextFireball = 20;


int offVariable = 0;
int vOff;
int hOff;

typedef struct {
    unsigned short fill0[3];
    short a;
    unsigned short fill1[3];
    short b;
    unsigned short fill2[3];
    short c;
    unsigned short fill3[3];
    short d;
} __attribute__((aligned(4))) OBJ_AFFINE;

OBJ_AFFINE *SHADOW_OAM_AFF = (OBJ_AFFINE*)shadowOAM;




void start() {
    DMANow(3, luffyStartScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(luffyStartScreenBitmap);
    flipPage();
}

void instructions() {
    DMANow(3, wanoInstructionsPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(wanoInstructionsBitmap);
    flipPage();
    rSeed++;
}

void kaido1() {
    hideSprites();
    luffyUpdate();
    kaidoUpdate();
    fireballUpdate();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    if (offVariable % 2 == 0) {
        hOff++;
    }
    offVariable++;
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000018) = hOff * 2;
}

void betweenFight() {
    DMANow(3, betweenFightScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(betweenFightScreenBitmap);
    flipPage();
}

void kaido2() {
    hideSprites();
    luffyUpdate2();
    kaidoUpdate2();
    lightningUpdate();
    fireballUpdate2();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    if (offVariable % 2 == 0) {
        hOff++;
    }
    offVariable++;
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000018) = hOff * 2;
    mgba_printf("%d", lightning[0].direction );
}

void bigMom1() {
    hideSprites();
}

void bigMom2() {
    hideSprites();
}

void pause() {
    DMANow(3, PauseScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(PauseScreenBitmap);
    flipPage();
}

void win() {
    DMANow(3, LuffyWinScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(LuffyWinScreenBitmap);
    flipPage();
}

void lose() {
    DMANow(3, loseScreenPal, ((unsigned short*) 0x05000000), 512 / 2);
    drawFullscreenImage4(loseScreenBitmap);
    flipPage();
}



void goToStart() {
    punchDamage = 1;
    gearFifth = 0;
    state = START;
}

void goToInstructions() {
    state = INSTRUCTIONS;
}

void goToKaido1() {
    state = KAIDO1;
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8);
    (*(volatile unsigned short*) 0x0400000A) = ((0) << 2) | ((16) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x0400000C) = ((0) << 2) | ((8) << 8) | (1 << 14);
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    srand(rSeed);
    DMANow(3, LuffyandKaidoSpritesPal, ((u16*) 0x5000200), 256);

    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &((CB*) 0x06000000)[0], 19200 / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, RooftopGroundBackgroundMap, &((SB*) 0x06000000)[28], (2048) / 2);
    DMANow(3, LuffyandKaidoSpritesTiles, &((CB*) 0x06000000)[4], 32768 / 2);
    DMANow(3, MovingMountainsMap, &((SB*) 0x06000000)[16], (4096) / 2);
    DMANow(3, CloudsMap, &((SB*) 0x06000000)[8], (4096) / 2);
}

void goToBetweenFight() {
    state = BETWEENFIGHT;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}

void goToKaido2() {
    state = KAIDO2;
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8);
    (*(volatile unsigned short*) 0x0400000A) = ((0) << 2) | ((16) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x0400000C) = ((0) << 2) | ((8) << 8) | (1 << 14);
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    srand(rSeed);

    DMANow(3, Rooftop_Ground_TilesetBitmapTiles, &((CB*) 0x06000000)[0], 19200 / 2);
    DMANow(3, Rooftop_Ground_TilesetBitmapPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, RooftopGroundBackgroundMap, &((SB*) 0x06000000)[28], (2048) / 2);
    DMANow(3, LuffyandKaidoSpritesTiles, &((CB*) 0x06000000)[4], 32768 / 2);
    DMANow(3, MovingMountainsMap, &((SB*) 0x06000000)[16], (4096) / 2);
    DMANow(3, CloudsMap, &((SB*) 0x06000000)[8], (4096) / 2);
}

void goToBigMom1() {
    state = BIGMOM1;
}

void goToBigMom2() {
    state = BIGMOM2;
}

void goToPause() {
    state = PAUSE;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}

void goToWin() {
    state = WIN;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    playSong(BinksBrew_data, BinksBrew_length, WIN);
}

void goToLose() {
    state = LOSE;
    (*(volatile unsigned short*) 0x04000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
}




void initLuffy() {
    luffy.x = 200;
    luffy.y = 110;
    luffy.xVel = 2;
    luffy.direction = LEFT;
    luffy.frame = 0;
    luffy.height = 40;
    luffy.width = 32;
    luffy.isMoving = 0;
    luffy.yVel = 1;
    luffy.timeUntilNextFrame = 10;
    luffy.oamIndex = 0;
    luffy.numFrames = 4;
    luffy.punching = 0;
    luffy.punchingTime = 22;
    luffy.jumping = 0;
    luffy.jumpingTime = 85;
    luffy.lightning = 0;

    luffyLives = 3;
    luffyPunched = 0;

    luffyFist.x = luffy.x;
    luffyFist.y = luffy.y + 16;
    luffyFist.height = 8;
    luffyFist.width = 8;
}

void luffyUpdate() {
    luffy.isMoving = 0;
    luffyFist.x = luffy.x;
    if ((~(buttons) & ((1 << 5))) && luffy.punching == 0) {
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if ((~(buttons) & ((1 << 4))) && luffy.punching == 0) {
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }

    if (luffy.punching == 0 && luffy.jumping == 0) {

        shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);

        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = (((0) * (32) + ((luffy.frame * 4) + 16)) & 0x3FF);
        } else if (luffy.timeUntilNextFrame < 0) {
            luffy.timeUntilNextFrame = 10;
        }
    }

    if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0)))) && luffy.jumping != 1) {
        luffyPunched = 1;
        luffy.punching = 1;
    }

    if (luffy.punching) {
        luffyPunching();
    }

    if ((!(~(oldButtons) & ((1 << 6))) && (~(buttons) & ((1 << 6))))) {
        luffy.jumping = 1;
        luffy.punching = 0;
    }

    if (luffy.jumping) {
        luffyJumping();
    }

    if ((!(~(oldButtons) & ((1 << 7))) && (~(buttons) & ((1 << 7)))) && luffy.jumping != 1 && gearFifth == 1 && groundChanging == 0) {
        groundChanging = 1;
        groundFrames = 45;
        tileTemp = (luffy.x / 8) - 2;
    }

    if (groundChanging == 1 && groundFrames > 0) {
        groundFrames--;
        groundChange();
    }


    for (int i = 0; i < luffyLives; i++) {
        shadowOAM[35 + i].attr0 = (0 << 14) | ((luffy.y - 10) & 0xFF);
        shadowOAM[35 + i].attr1 = (0 << 14) | ((luffy.x + 2 + (10 * i)) & 0x1FF);
        shadowOAM[35 + i].attr2 = (((31) * (32) + (14)) & 0x3FF);
    }

    luffy.timeUntilNextFrame--;
}

void luffyPunching() {
    shadowOAM[luffy.oamIndex].attr0 = (0 << 14) | ((luffy.y) & 0xFF);
    shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
    shadowOAM[luffy.oamIndex].attr2 = (((7) * (32) + (3)) & 0x3FF);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        if (luffy.punchingTime < 20) {
            shadowOAM[luffy.oamIndex + 1].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 1].attr1 = (0 << 14) | ((luffy.x + 32 + luffy.width) & 0x1FF);
            luffyFist.x = luffy.x + 32 + luffy.width;
            shadowOAM[luffy.oamIndex + 1].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 2].attr1 = (0 << 14) | ((luffy.x + 36 + luffy.width) & 0x1FF);
            luffyFist.x = luffy.x + 36 + luffy.width;
            shadowOAM[luffy.oamIndex + 2].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 3].attr1 = (0 << 14) | ((luffy.x + 40 + luffy.width) & 0x1FF);
            luffyFist.x = luffy.x + 40 + luffy.width;
            shadowOAM[luffy.oamIndex + 3].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 4].attr1 = (0 << 14) | ((luffy.x + 44 + luffy.width) & 0x1FF);
            luffyFist.x = luffy.x + 44 + luffy.width;
            shadowOAM[luffy.oamIndex + 4].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 5].attr1 = (0 << 14) | ((luffy.x + 48 + luffy.width) & 0x1FF);
            luffyFist.x = luffy.x + 48 + luffy.width;
            shadowOAM[luffy.oamIndex + 5].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 6].attr1 = (1 << 14) | ((luffy.x + 52 + luffy.width) & 0x1FF) | (1 << 12);
            luffyFist.x = luffy.x + 56 + luffy.width;
            shadowOAM[luffy.oamIndex + 6].attr2 = (((9) * (32) + (0)) & 0x3FF);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    } else {
        if (luffy.punchingTime < 20) {
        shadowOAM[luffy.oamIndex + 1].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
        shadowOAM[luffy.oamIndex + 1].attr1 = (0 << 14) | ((luffy.x - 8) & 0x1FF);
        shadowOAM[luffy.oamIndex + 1].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 18) {
            shadowOAM[luffy.oamIndex + 2].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 2].attr1 = (0 << 14) | ((luffy.x - 12) & 0x1FF);
            luffyFist.x = luffy.x - 12;
            shadowOAM[luffy.oamIndex + 2].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 16) {
            shadowOAM[luffy.oamIndex + 3].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 3].attr1 = (0 << 14) | ((luffy.x - 16) & 0x1FF);
            luffyFist.x = luffy.x - 16;
            shadowOAM[luffy.oamIndex + 3].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 14) {
            shadowOAM[luffy.oamIndex + 4].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 4].attr1 = (0 << 14) | ((luffy.x - 20) & 0x1FF);
            luffyFist.x = luffy.x - 20;
            shadowOAM[luffy.oamIndex + 4].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 12) {
            shadowOAM[luffy.oamIndex + 5].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 5].attr1 = (0 << 14) | ((luffy.x - 24) & 0x1FF);
            luffyFist.x = luffy.x - 24;
            shadowOAM[luffy.oamIndex + 5].attr2 = (((9) * (32) + (2)) & 0x3FF);
        }
        if (luffy.punchingTime < 10) {
            shadowOAM[luffy.oamIndex + 6].attr0 = (0 << 14) | ((luffy.y + 16) & 0xFF);
            shadowOAM[luffy.oamIndex + 6].attr1 = (1 << 14) | ((luffy.x - 36) & 0x1FF);
            luffyFist.x = luffy.x - 28;
            shadowOAM[luffy.oamIndex + 6].attr2 = (((9) * (32) + (0)) & 0x3FF);
        }
        if (luffy.punchingTime < 0) {
            luffy.punchingTime = 22;
            luffy.punching = 0;
            luffy.timeUntilNextFrame = 1;
        }
    }

    if (punchCollision() & (luffyPunched == 1)) {
        luffyPunched = 0;
        playSoundEffect(LuffyPunchSound_data, LuffyPunchSound_length);
        kaidoHealth -= punchDamage;
    }

    if (kaidoHealth <= 0) {
        goToBetweenFight();
    }

    luffy.punchingTime--;
}

void luffyJumping() {
    shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
    shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
    if (luffy.direction == RIGHT) {
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
    }

    if (luffy.jumpingTime < 85 && luffy.jumpingTime > 70) {
        shadowOAM[luffy.oamIndex].attr2 = (((8) * (32) + (12)) & 0x3FF);
        luffy.y -= luffy.yVel * 2;
    }
    if (luffy.jumpingTime < 70 && luffy.jumpingTime > 35) {
        shadowOAM[luffy.oamIndex].attr0 = (1 << 14) | ((luffy.y) & 0xFF);
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        }
        shadowOAM[luffy.oamIndex].attr2 = (((8) * (32) + (16)) & 0x3FF);
        luffy.y -= luffy.yVel;
    }
    if (luffy.jumpingTime < 35 && luffy.jumpingTime > 0) {
        shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);
        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        }
        shadowOAM[luffy.oamIndex].attr2 = (((8) * (32) + (24)) & 0x3FF);
        if (luffy.y < 110) {
            luffy.y += luffy.yVel * 2;
        }

    }

    if (luffy.jumpingTime < 0) {
        luffy.jumpingTime = 85;
        luffy.jumping = 0;
        luffy.timeUntilNextFrame = 1;
    }

    luffy.jumpingTime--;
}

void gearFive() {
    ((u16*) 0x5000200)[8] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    ((u16*) 0x5000200)[12] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    punchDamage = 2;
    gearFifth = 1;
}

void groundChange() {
    ((SB*) 0x06000000)[28].tilemap[((14) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((15) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((16) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((17) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((18) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((19) * (32) + (tileTemp))] = (5 & 1023);
    ((SB*) 0x06000000)[28].tilemap[((20) * (32) + (tileTemp))] = (5 & 1023);
    if (groundFrames == 0) {
        groundChanging = 0;
        ((SB*) 0x06000000)[28].tilemap[((14) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((15) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((16) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((17) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((18) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((19) * (32) + (tileTemp))] = (0 & 1023);
        ((SB*) 0x06000000)[28].tilemap[((20) * (32) + (tileTemp))] = (0 & 1023);
    }
}


void initKaido() {
    kaido.x = -25;
    kaido.y = 100;
    kaido.frame = 0;
    kaido.height = 24;
    kaido.width = 58;
    kaido.isMoving = 0;
    kaido.oamIndex = 7;
    kaido.numFrames = 2;
    kaido.xVel = 1;
    kaido.attacking = 0;
    kaido.attackingTime = 20;
    kaido.timeUntilNextFrame = 30;
    kaido.direction = UP;

    kaidoHealth = 10;


    fireball.x = kaido.x + (kaido.width * 2) - 25;
    fireball.y = kaido.y + 25;
    fireball.width = 32;
    fireball.height = 16;
    fireball.oamIndex = 8;
    fireball.xVel = 1;
    fireball.timeUntilNextFrame = 10;
    fireball.frame = 0;
    fireball.numFrames = 2;
    fireball.timeUntilNextShot = 20;
}

void kaidoUpdate() {

    SHADOW_OAM_AFF[0].d = 1 << 7;
    SHADOW_OAM_AFF[0].a = 1 << 7;
    shadowOAM[kaido.oamIndex].attr0 = (0 << 14) | ((kaido.y) & 0xFF) | (3 << 8);
    shadowOAM[kaido.oamIndex].attr1 = (3 << 14) | ((kaido.x) & 0x1FF);
    shadowOAM[kaido.oamIndex].attr2 = (((16) * (32) + (kaido.frame * 8)) & 0x3FF) | (((1) & 0xF) << 12);
    if (kaido.timeUntilNextFrame == 0) {
        kaido.timeUntilNextFrame = 30;
        kaido.frame = (kaido.frame + 1) % kaido.numFrames;
    } else if (kaido.timeUntilNextFrame < 0) {
        kaido.timeUntilNextFrame = 30;
    }
    kaido.timeUntilNextFrame--;


    shadowOAM[kaidoWordOAMIndex].attr0 = (1 << 14) | ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex].attr1 = (0 << 14) | ((100) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex].attr2 = (((31) * (32) + (5)) & 0x3FF) | (((1) & 0xF) << 12);
    shadowOAM[kaidoWordOAMIndex + 1].attr0 = (1 << 14) | ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex + 1].attr1 = (0 << 14) | ((116) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex + 1].attr2 = (((31) * (32) + (7)) & 0x3FF) | (((1) & 0xF) << 12);
    shadowOAM[kaidoWordOAMIndex + 2].attr0 = ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex + 2].attr1 = (0 << 14) | ((132) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex + 2].attr2 = (((31) * (32) + (9)) & 0x3FF) | (((1) & 0xF) << 12);


    for (int i = 0; i < kaidoHealth; i++) {
        shadowOAM[kaido.oamIndex + 2 + i].attr0 = (0 << 14) | ((10) & 0xFF);
        shadowOAM[kaido.oamIndex + 2 + i].attr1 = (0 << 14) | ((80 + (i * 8)) & 0x1FF);
        shadowOAM[kaido.oamIndex + 2 + i].attr2 = (((31) * (32) + (11)) & 0x3FF) | (((1) & 0xF) << 12);
    }
    shadowOAM[22].attr0 = (0 << 14) | ((10) & 0xFF);
    shadowOAM[22].attr1 = (0 << 14) | ((72) & 0x1FF);
    shadowOAM[22].attr2 = (((31) * (32) + (10)) & 0x3FF) | (((1) & 0xF) << 12);
    for (int i = 0; i < 10; i++) {
        shadowOAM[23 + i].attr0 = (0 << 14) | ((10) & 0xFF);
        shadowOAM[23 + i].attr1 = (0 << 14) | ((80 + (i * 8)) & 0x1FF);
        shadowOAM[23 + i].attr2 = (((31) * (32) + (12)) & 0x3FF) | (((1) & 0xF) << 12);
    }
    shadowOAM[34].attr0 = (0 << 14) | ((10) & 0xFF);
    shadowOAM[34].attr1 = (0 << 14) | ((160) & 0x1FF);
    shadowOAM[34].attr2 = (((31) * (32) + (13)) & 0x3FF) | (((1) & 0xF) << 12);
}

void fireballUpdate() {
    if (fireball.shooting) {
        shootFireball();
    }

    if ((fireball.timeUntilNextFrame == 0)) {
        fireball.timeUntilNextFrame = 10;
        fireball.frame = (fireball.frame + 1) % fireball.numFrames;
    } else if (fireball.timeUntilNextFrame < 0) {
        fireball.timeUntilNextFrame = 10;
    }
    fireball.timeUntilNextFrame--;

    if (fireballCollision() && fireball.shooting) {
        fireball.shooting = 0;
        fireball.x = kaido.x + (kaido.width * 2) - 25;
        luffyLives--;
        *(u32*)0x400004C = (1 << 8) + (1 << 12);
        shadowOAM[luffy.oamIndex].attr0 |= (1 << 12);
        if (luffyLives == 0) {
            goToLose();
        }
    }
    if (fireball.timeUntilNextShot == 0) {
        fireball.shooting = 1;
        fireball.timeUntilNextShot = rand() % 80;
    } else if (fireball.timeUntilNextShot < 0) {
        fireball.timeUntilNextShot = rand() % 80;
    }
    if (!fireball.shooting) {
        fireball.timeUntilNextShot--;
    }

    if (fireball.x + fireball.width > ((tileTemp) * 8) && groundChanging == 1) {
        fireball.shooting = 0;
        fireball.x = kaido.x + kaido.width * 2 - 25;
    }
}

void shootFireball() {
    shadowOAM[fireball.oamIndex].attr0 = (1 << 14) | ((fireball.y) & 0xFF);
    shadowOAM[fireball.oamIndex].attr1 = (2 << 14) | ((fireball.x) & 0x1FF);
    shadowOAM[fireball.oamIndex].attr2 = (((fireball.frame * 2) * (32) + (28)) & 0x3FF) | (((1) & 0xF) << 12);
    if (fireball.x > 240 + fireball.width) {
        fireball.shooting = 0;
        fireball.x = kaido.x + (kaido.width * 2) - 25;
    } else {
        fireball.x += fireball.xVel;
    }
}

int fireballCollision() {
    return collision(fireball.x, fireball.y, fireball.width, fireball.height, luffy.x, luffy.y + 6, luffy.width, luffy.height);
}

int punchCollision() {
    return collision(kaido.x, kaido.y, kaido.width * 2, kaido.height * 2, luffyFist.x, luffyFist.y, luffyFist.width, luffyFist.height);
}







void luffyUpdate2() {
    luffy.isMoving = 0;
    if ((~(buttons) & ((1 << 5)))) {
        luffy.direction = LEFT;
        if (luffy.x > 0) {
            luffy.x -= luffy.xVel;
        }
        luffy.isMoving = 1;
    } else if ((~(buttons) & ((1 << 4)))) {
        luffy.direction = RIGHT;
        if (luffy.x < 240 - luffy.width) {
            luffy.x += luffy.xVel;
        }
        luffy.isMoving = 1;
    }

    if (luffy.jumping == 0) {

        shadowOAM[luffy.oamIndex].attr0 = (2 << 14) | ((luffy.y) & 0xFF);
        shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF);

        if (luffy.direction == RIGHT) {
            shadowOAM[luffy.oamIndex].attr1 = (3 << 14) | ((luffy.x) & 0x1FF) | (1 << 12);
        }

        if ((luffy.timeUntilNextFrame == 0) & (luffy.isMoving == 0)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % luffy.numFrames;
            shadowOAM[luffy.oamIndex].attr2 = luffy.frame * 4;
        } else if ((luffy.timeUntilNextFrame == 0) && (luffy.isMoving == 1)) {
            luffy.timeUntilNextFrame = 10;
            luffy.frame = (luffy.frame + 1) % 3;
            shadowOAM[luffy.oamIndex].attr2 = (((0) * (32) + ((luffy.frame * 4) + 16)) & 0x3FF);
        } else if (luffy.timeUntilNextFrame < 0) {
            luffy.timeUntilNextFrame = 10;
        }
    }

    if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0))))) {
        luffyLightning = 1;
        luffy.lightning = 1;
    }

    if (luffy.lightning) {
        for (int i = 0; i < 4; i++) {
            if (lightning[i].active == 0) {
                lightning[i].x = luffy.x;
                lightning[i].y = luffy.y;
                lightning[i].active = 1;
                lightning[i].direction = luffy.direction;
                luffyLightningThrow(&lightning[i]);
                break;
            }
        }

    }

    if ((!(~(oldButtons) & ((1 << 6))) && (~(buttons) & ((1 << 6))))) {
        luffy.jumping = 1;
        luffy.punching = 0;
    }

    if (luffy.jumping) {
        luffyJumping();
    }

    if ((!(~(oldButtons) & ((1 << 7))) && (~(buttons) & ((1 << 7)))) && luffy.jumping != 1 && gearFifth == 1 && groundChanging == 0) {
        groundChanging = 1;
        groundFrames = 45;
        tileTemp = (luffy.x / 8) - 2;
    }

    if (groundChanging == 1 && groundFrames > 0) {
        groundFrames--;
        groundChange();
    }


    for (int i = 0; i < luffyLives; i++) {
        shadowOAM[35 + i].attr0 = (0 << 14) | ((luffy.y - 10) & 0xFF);
        shadowOAM[35 + i].attr1 = (0 << 14) | ((luffy.x + 2 + (10 * i)) & 0x1FF);
        shadowOAM[35 + i].attr2 = (((31) * (32) + (14)) & 0x3FF);
    }

    luffy.timeUntilNextFrame--;
}


void initLightning() {
    for (int i = 0; i < 4; i++) {
        lightning[i].x = 0;
        lightning[i].y = 0;
        lightning[i].active = 0;
        lightning[i].height = 15;
        lightning[i].width = 8 * 5;
        lightning[i].oamIndex = 38 + i;
        lightning[i].direction = RIGHT;
    }
}


void luffyLightningThrow() {
    luffy.lightning = 0;
}

void lightningUpdate() {
    for (int i = 0; i < 4; i++) {
        if (lightning[i].active) {
            if (lightning[i].direction == LEFT) {
                lightning[i].x -= 2;
            } else if (lightning[i].direction == RIGHT) {
                lightning[i].x += 2;
            }

            if (lightning[i].x + lightning[i].width < 0) {
                lightning[i].active = 0;
            } else if (lightning[i].x > 240) {
                lightning[i].active = 0;
            }
            if (lightningCollision(&lightning[i])) {
                lightning[i].active = 0;
                kaidoHealth-= punchDamage;
            }
            shadowOAM[lightning[i].oamIndex].attr0 = (1 << 14) | ((lightning[i].y) & 0xFF);
            shadowOAM[lightning[i].oamIndex].attr1 = (3 << 14) | ((lightning[i].x) & 0x1FF);
            shadowOAM[lightning[i].oamIndex].attr2 = (((21) * (32) + (21)) & 0x3FF) | (((1) & 0xF) << 12);
        }
        if (lightning[i].active == 0) {
            shadowOAM[lightning[i].oamIndex].attr0 = (2 << 8);
        }
    }

    if (kaidoHealth <= 0) {
        goToWin();
    }
}

void kaidoUpdate2() {

    SHADOW_OAM_AFF[0].d = 1 << 7;
    SHADOW_OAM_AFF[0].a = 1 << 7;
    shadowOAM[kaido.oamIndex].attr0 = (0 << 14) | ((kaido.y) & 0xFF) | (3 << 8);
    shadowOAM[kaido.oamIndex].attr1 = (3 << 14) | ((kaido.x) & 0x1FF);
    shadowOAM[kaido.oamIndex].attr2 = (((16) * (32) + (kaido.frame * 8)) & 0x3FF) | (((1) & 0xF) << 12);
    if (kaido.timeUntilNextFrame == 0) {
        kaido.timeUntilNextFrame = 30;
        kaido.frame = (kaido.frame + 1) % kaido.numFrames;
    } else if (kaido.timeUntilNextFrame < 0) {
        kaido.timeUntilNextFrame = 30;
    }
    kaido.timeUntilNextFrame--;


    shadowOAM[kaidoWordOAMIndex].attr0 = (1 << 14) | ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex].attr1 = (0 << 14) | ((100) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex].attr2 = (((31) * (32) + (5)) & 0x3FF) | (((1) & 0xF) << 12);
    shadowOAM[kaidoWordOAMIndex + 1].attr0 = (1 << 14) | ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex + 1].attr1 = (0 << 14) | ((116) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex + 1].attr2 = (((31) * (32) + (7)) & 0x3FF) | (((1) & 0xF) << 12);
    shadowOAM[kaidoWordOAMIndex + 2].attr0 = ((2) & 0xFF);
    shadowOAM[kaidoWordOAMIndex + 2].attr1 = (0 << 14) | ((132) & 0x1FF);
    shadowOAM[kaidoWordOAMIndex + 2].attr2 = (((31) * (32) + (9)) & 0x3FF) | (((1) & 0xF) << 12);


    for (int i = 0; i < kaidoHealth; i++) {
        shadowOAM[kaido.oamIndex + 2 + i].attr0 = (0 << 14) | ((10) & 0xFF);
        shadowOAM[kaido.oamIndex + 2 + i].attr1 = (0 << 14) | ((80 + (i * 8)) & 0x1FF);
        shadowOAM[kaido.oamIndex + 2 + i].attr2 = (((31) * (32) + (11)) & 0x3FF) | (((1) & 0xF) << 12);
    }
    shadowOAM[22].attr0 = (0 << 14) | ((10) & 0xFF);
    shadowOAM[22].attr1 = (0 << 14) | ((72) & 0x1FF);
    shadowOAM[22].attr2 = (((31) * (32) + (10)) & 0x3FF) | (((1) & 0xF) << 12);
    for (int i = 0; i < 10; i++) {
        shadowOAM[23 + i].attr0 = (0 << 14) | ((10) & 0xFF);
        shadowOAM[23 + i].attr1 = (0 << 14) | ((80 + (i * 8)) & 0x1FF);
        shadowOAM[23 + i].attr2 = (((31) * (32) + (12)) & 0x3FF) | (((1) & 0xF) << 12);
    }
    shadowOAM[34].attr0 = (0 << 14) | ((10) & 0xFF);
    shadowOAM[34].attr1 = (0 << 14) | ((160) & 0x1FF);
    shadowOAM[34].attr2 = (((31) * (32) + (13)) & 0x3FF) | (((1) & 0xF) << 12);

    if (kaido.y <= 160 - (kaido.height * 2) && kaido.direction == DOWN) {
        kaido.y++;
    } else if (kaido.y >= 0 && kaido.direction == UP) {
        kaido.y--;
    }
    if (kaido.y == 160 - (kaido.height * 2)) {
        kaido.direction = UP;
    } else if (kaido.y == 0) {
        kaido.direction = DOWN;
    }

    if (timeUntilNextFireball == 0) {
        for (int i = 0; i < 5; i++) {
            if (fireballs[i].shooting == 0) {
                fireballs[i].x = kaido.x + (kaido.width * 2) - 25;
                fireballs[i].y = kaido.y;
                fireballs[i].shooting = 1;
                timeUntilNextFireball = rand() % 80 + 30;
                break;
            }
        }
    } else if (timeUntilNextFireball < 0) {
        timeUntilNextFireball = rand() % 80 + 30;
    }

    timeUntilNextFireball--;
}

void initFireball2() {
    for (int i = 0; i < 5; i++) {
        fireballs[i].shooting = 0;
        fireballs[i].frame = 0;
        fireballs[i].height = 16;
        fireballs[i].width = 32;
        fireballs[i].numFrames = 2;
        fireballs[i].oamIndex = 42 + i;
        fireballs[i].x = 0;
        fireballs[i].xVel = 1;
        fireballs[i].y = 0;
        fireballs[i].timeUntilNextFrame = 10;
        fireballs[i].timeUntilNextShot = 0;
    }
}

void fireballUpdate2() {
    for (int i = 0; i < 5; i++) {
        if (fireballs[i].shooting) {
            shootFireball2(&fireballs[i]);

            if (fireballs[i].timeUntilNextFrame == 0) {
                fireballs[i].timeUntilNextFrame = 10;
                fireballs[i].frame = (fireballs[i].frame + 1) & fireballs[i].numFrames;
            } else if (fireballs[i].timeUntilNextFrame < 0) {
                fireballs[i].timeUntilNextFrame = 10;
            }
            fireballs[i].timeUntilNextFrame--;

            if (fireballCollision2(&fireballs[i])) {
                fireballs[i].shooting = 0;
                fireballs[i].x = kaido.x;
                luffyLives--;
                if (luffyLives == 0) {
                    goToLose();
                }
            }
        } else {
            shadowOAM[fireballs[i].oamIndex].attr0 = (2 << 8);
        }
        if (fireballs[i].x + fireballs[i].width > ((tileTemp) * 8) && groundChanging == 1) {
            fireballs[i].shooting = 0;
            fireballs[i].x = kaido.x + kaido.width * 2 - 25;
        }
    }
}

void shootFireball2(FIREBALL *fireball) {
    shadowOAM[fireball->oamIndex].attr0 = (1 << 14) | ((fireball->y) & 0xFF);
    shadowOAM[fireball->oamIndex].attr1 = (2 << 14) | ((fireball->x) & 0x1FF);
    shadowOAM[fireball->oamIndex].attr2 = (((fireball->frame * 2) * (32) + (28)) & 0x3FF) | (((1) & 0xF) << 12);
    if (fireball->x > 240 + fireball->width) {
        fireball->shooting = 0;
    } else {
        fireball->x += fireball->xVel;
    }
}

int lightningCollision(LIGHTNING *lightning) {
    return collision(kaido.x, kaido.y, kaido.width * 2, kaido.height * 2, lightning->x, lightning->y + 9, lightning->width, lightning->height);
}

int fireballCollision2(FIREBALL *fireball) {
    return collision(fireball->x, fireball->y, fireball->width, fireball->height, luffy.x, luffy.y, luffy.width, luffy.height);
}
