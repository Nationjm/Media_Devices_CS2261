
//{{BLOCK(Level1Bitmap)

//======================================================================
//
//	Level1Bitmap, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ bitmap not compressed
//	Total size: 512 + 65536 = 66048
//
//	Time-stamp: 2023-10-29, 20:04:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL1BITMAP_H
#define GRIT_LEVEL1BITMAP_H

#define Level1BitmapBitmapLen 65536
extern const unsigned short Level1BitmapBitmap[32768];

#define Level1BitmapPalLen 512
extern const unsigned short Level1BitmapPal[256];

#endif // GRIT_LEVEL1BITMAP_H

//}}BLOCK(Level1Bitmap)
