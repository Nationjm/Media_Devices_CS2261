# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"






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
# 8 "main.c" 2
# 1 "analogSound.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 263 "analogSound.h"
enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(u8 r, u8 s, u8 b, u8 length, u8 steptime);
void playNoteWithDuration(NoteWithDuration *n, u8 duty);
void playChannel1(u16 note, u8 length, u8 sweepShift, u8 sweepTime, u8 sweepDir, u8 envStepTime, u8 envDir, u8 duty);
void playAnalogSound(u16 sound);
# 9 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
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




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
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
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

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

# 10 "main.c" 2



# 12 "main.c"
enum mode {SONG, CHANNEL1, CHANNEL3, DRUM, DEMO, NONE};
enum mode mode = SONG;
enum mode prevMode = NONE;

char* emptyRow = "                                        ";







NoteWithDuration song[] = {



  {NOTE_C4, 125},
  {NOTE_C4, 125},
  {NOTE_G4, 125},
  {NOTE_G4, 125},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_G4, 125},
  {REST, 125},
  {NOTE_F4, 125},
  {NOTE_F4, 125},
  {NOTE_E4, 125},
  {NOTE_E4, 125},
  {NOTE_D4, 125},
  {NOTE_D4, 125},
  {NOTE_C4, 125},
  {REST, 125},
  {NOTE_G4, 125},
  {NOTE_G4, 62},
  {NOTE_G4, 62},
  {NOTE_F4, 125},
  {NOTE_F4, 125},
  {NOTE_E4, 125},
  {NOTE_E4, 62},
  {NOTE_E4, 62},
  {NOTE_D4, 125},
  {REST, 125},
  {NOTE_G4, 125},
  {NOTE_G4, 62},
  {NOTE_G4, 62},
  {NOTE_F4, 62},
  {NOTE_F4, 62},
  {NOTE_F4, 62},
  {NOTE_F4, 62},
  {NOTE_E4, 125},
  {NOTE_E4, 62},
  {NOTE_E4, 62},
  {NOTE_D4, 125},
  {REST, 125},
  {NOTE_C4, 125},
  {NOTE_C4, 125},
  {NOTE_G4, 125},
  {NOTE_G4, 125},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_A4, 62},
  {NOTE_G4, 125},
  {REST, 125},
  {NOTE_F4, 125},
  {NOTE_F4, 125},
  {NOTE_E4, 125},
  {NOTE_E4, 125},
  {NOTE_D4, 125},
  {NOTE_D4, 125},
  {NOTE_C4, 125},
  {REST, 125}
};







int main(){
  u16 currentNote = 0;
  u32 songLength = sizeof(song) / sizeof(NoteWithDuration);

  (*(unsigned short *)0x04000000) = 3 | (1<<10);

  initSound();

  ((volatile u16*)0x04000090)[0] = 0x5476;
  ((volatile u16*)0x04000090)[1] = 0x1032;
  ((volatile u16*)0x04000090)[2] = 0xDCFE;
  ((volatile u16*)0x04000090)[3] = 0x98BA;
  ((volatile u16*)0x04000090)[4] = 0x5476;
  ((volatile u16*)0x04000090)[5] = 0x1032;
  ((volatile u16*)0x04000090)[6] = 0xdcfe;
  ((volatile u16*)0x04000090)[7] = 0x98ba;

  u8 songDuty = 2;



  u8 c1SweepShift = 0;
  u8 c1SweepDir = 0;
  u8 c1SweepTime = 0;
  u8 c1Length = 0;
  u8 c1Duty = 0;
  u8 c1EnvelopeStepTime = 0;
  u8 c1EnvelopeDir = 0;
  u16 c1Freq = 0;

  u8 drumR = 0;
  u8 drumS = 0;
  u8 drumB = 0;
  u8 drumLength = 0;
  u8 drumEnvelopeStepTime = 0;



  u32 count = 0;
  u32 duration = song[currentNote].duration;
  int playSong = 0;

  u16 tempo = 250;

  u16 color = ((31) | (0) << 5 | (31) << 10);
  u16 bgcolor = ((0) | (0) << 5 | (0) << 10);
  char printBuffer[41] = "";

  int effect = 0;

  while(1) {
    if ((!(~(oldButtons)&((1<<2))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<2))))) {
      mode = (mode + 1) % NONE;
      if (mode == CHANNEL3) mode++;
    }


    if (mode == DRUM) {
      if ((!(~(oldButtons)&((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))) drumEnvelopeStepTime = (drumEnvelopeStepTime + 1) & 7;

      if ((!(~(oldButtons)&((1<<8))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<8))))) drumLength = (drumLength + 1) & 0x3F;
      if ((!(~(oldButtons)&((1<<9))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<9))))) drumLength = (drumLength - 1) & 0x3F;

      if ((!(~(oldButtons)&((1<<6))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<6))))) drumR = (drumR + 1) & 7;
      if ((!(~(oldButtons)&((1<<7))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<7))))) drumR = (drumR - 1) & 7;

      if ((!(~(oldButtons)&((1<<4))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<4))))) drumS = (drumS + 1) & 15;
      if ((!(~(oldButtons)&((1<<5))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<5))))) drumS = (drumS - 1) & 15;

      if ((!(~(oldButtons)&((1<<1))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<1))))) drumB ^= 1;

      if ((!(~(oldButtons)&((1<<0))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<0))))) {
        playDrumSound(drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      }
    }


    if (mode == SONG || mode == DEMO){
      if ((!(~(oldButtons)&((1<<5))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<5))))) songDuty = (songDuty - 1) & 3;
      if ((!(~(oldButtons)&((1<<4))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<4))))) songDuty = (songDuty + 1) & 3;

      if ((!(~(oldButtons)&((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))){
        if (playSong){
          playSong = 0;
          currentNote = 0;
          duration = song[currentNote].duration;
        } else {
          playSong = 1;
        }
      }

      if (playSong && count >= duration*tempo/1000) {
        playNoteWithDuration(&song[currentNote], songDuty);
        duration = song[currentNote].duration;
        currentNote = (currentNote + 1) % songLength;
        count = 0;
      }
    }


    if (mode == CHANNEL1) {
      if ((!(~(oldButtons)&((1<<6))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<6))))) c1SweepShift = (c1SweepShift + 1) & 7;
      if ((!(~(oldButtons)&((1<<7))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<7))))) c1SweepTime = (c1SweepTime + 1) & 7;
      if ((!(~(oldButtons)&((1<<5))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<5))))) c1EnvelopeStepTime = (c1EnvelopeStepTime + 1) & 7;
      if ((!(~(oldButtons)&((1<<4))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<4))))) c1Duty = (c1Duty + 1) & 3;
      if ((!(~(oldButtons)&((1<<9))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<9))))) c1Length = (c1Length - 1) & 0x3F;
      if ((!(~(oldButtons)&((1<<8))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<8))))) c1Length = (c1Length + 1) & 0x3F;

      if ((!(~(oldButtons)&((1<<1))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<1))))) c1SweepDir ^= 1;
      if ((!(~(oldButtons)&((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))) c1EnvelopeDir ^= 1;

      if ((!(~(oldButtons)&((1<<0))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<0))))){
        if (song[currentNote].note != REST) {
          playChannel1(song[currentNote].note, c1Length, c1SweepShift, c1SweepTime, c1SweepDir, c1EnvelopeStepTime, c1EnvelopeDir, c1Duty);
        }
        currentNote = (currentNote + 1) % songLength;
      }
    }


    if (mode == CHANNEL3){
      if ((!(~(oldButtons)&((1<<6))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<6))))) {
        *(volatile u16*)0x04000074 = (1<<15) | 0x0563;
        *(volatile u16*)0x04000070 = (1 << 7);
        *(volatile u16*)0x04000072 = 1<<13 | 0xeb;
      } else if ((!(~(oldButtons)&((1<<7))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<7))))){
        *(volatile u16*)0x04000072 = 0;
      }
    }

    if (mode == DEMO){
      if ((!(~(oldButtons)&((1<<4))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<4))))) {
        playAnalogSound(effect);
        effect = (effect + 1) % 18;
      }

      if ((!(~(oldButtons)&((1<<0))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<0))))) {
        playDrumSound(drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      }
      if ((!(~(oldButtons)&((1<<9))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<9))))) {
        playChannel1(song[currentNote].note, c1Length, c1SweepShift, c1SweepTime, c1SweepDir, c1EnvelopeStepTime, c1EnvelopeDir, c1Duty);
      }
      if ((!(~(oldButtons)&((1<<8))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<8))))) {
        playNoteWithDuration(&song[currentNote], songDuty);
      }
    }


    oldButtons = (*(volatile unsigned short *)0x04000130);
    waitForVBlank();

    if (mode == SONG) {
      if (prevMode != SONG) {
        fillScreen(bgcolor);
        drawString(0, 0, "Song Mode", color);
        drawString(0, 8, "Press Start to Play/Pause Song.", color);
        drawString(0, 16, "D-Pad L/R: Adjust Duty", color);
        drawString(0, 40, "Count: ", color);

        prevMode = SONG;
      }
      sprintf(printBuffer, "Duty: %d", songDuty);
      drawStringWithBGColor(0, 24, printBuffer, color, bgcolor);
      sprintf(printBuffer, "%2d", count);
      drawStringWithBGColor(sizeof("Count: ")*6, 40, printBuffer, color, bgcolor);

      if (playSong) count++;
    }


    if (mode == CHANNEL1){
      if (prevMode != CHANNEL1) {
        fillScreen(bgcolor);
        drawString(0, 0, "CHANNEL1 Mode", color);
        drawString(0, 8, "A plays current note.", color);
        drawString(0, 16, "D-pad: Up Incr. SweepShift (SS)", color);
        drawString(0, 24, "D-pad: Down Incr. SweepTime (ST)", color);
        drawString(0, 32, "D-pad: Left Incr. EnvStepTime (EST)", color);
        drawString(0, 40, "D-pad: Right Incr. Duty (D)", color);
        drawString(0, 48, "L/R: Adjust Length (L)", color);
        drawString(0, 56, "B: Toggle Sweep Dir (S_DIR)", color);
        drawString(0, 64, "Start: Toggle Env Dir (E_DIR)", color);
        drawString(0, 80, "C1 Params (SS,ST,EST,D,L,S_DIR,E_DIR):", color);
        drawString(0, 96, "Next Note: ", color);
        prevMode = CHANNEL1;
      }
      sprintf(printBuffer, "%d,%d,%d,%d,%d,%d,%d     ", c1SweepShift, c1SweepTime, c1EnvelopeStepTime, c1Duty, c1Length, c1SweepDir, c1EnvelopeDir);
      drawStringWithBGColor(0, 88, printBuffer, color, bgcolor);
      sprintf(printBuffer, "%d", song[currentNote].note);
      drawStringWithBGColor(6*sizeof("Next Note: "), 96, printBuffer, color, bgcolor);
    }

    if (mode == CHANNEL3){
      if (prevMode != CHANNEL3) {
        fillScreen(bgcolor);
        drawString(0, 0, "CHANNEL3 Mode", color);
        drawString(0, 8, "Up/Down on D-Pad to start/stop waveform sound.", color);
        prevMode = CHANNEL3;
      }
    }


    if (mode == DRUM){
      if (prevMode != DRUM) {
        fillScreen(bgcolor);
        drawString(0, 0, "Channel4 (\"Drum\") Mode", color);
        drawString(0, 8, "A plays current drum params.", color);
        drawString(0, 16, "D-pad: Up/Down Adjust R", color);
        drawString(0, 24, "D-pad: Left/Right Adjust S", color);
        drawString(0, 32, "L/R: Adjust Length (L)", color);
        drawString(0, 40, "B: Toggle Bit Mode (B)", color);
        drawString(0, 48, "Start: Inc Envelope (E)", color);
        drawString(0, 74, "Drum Params (R,S,B,L,E): ", color);
        prevMode = DRUM;
      }
      sprintf(printBuffer, "%d,%2d,%d,%2d,%d", drumR, drumS, drumB, drumLength, drumEnvelopeStepTime);
      drawStringWithBGColor(sizeof("Drum Params (R,S,B,L,E): ")*6, 74, printBuffer, color, bgcolor);
    }


    if (mode == DEMO){
      if (prevMode != DEMO) {
        fillScreen(bgcolor);
        drawString(0, 0, "DEMO Mode", color);
        drawString(0, 8, "Start: toggle song", color);
        drawString(0, 16, "L/R: Play current C1 / C2", color);
        drawString(0, 24, "A: Play Current C4", color);

        drawString(0, 40, "D-RIGHT: Cycle through sound effects", color);
        prevMode = DEMO;
      }
      if (playSong) count++;
      sprintf(printBuffer, "Next Effect: %2d", effect);
      drawStringWithBGColor(0, 56, printBuffer, color, bgcolor);
    }
    drawStringWithBGColor(0, 150, "Press Select to cycle modes.", color, bgcolor);
  }
}
