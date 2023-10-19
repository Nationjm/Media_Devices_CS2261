
//{{BLOCK(block)

//======================================================================
//
//	block, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 7 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 224 + 2048 = 2784
//
//	Time-stamp: 2023-10-19, 17:21:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLOCK_H
#define GRIT_BLOCK_H

#define blockTilesLen 224
extern const unsigned short blockTiles[112];

#define blockMapLen 2048
extern const unsigned short blockMap[1024];

#define blockPalLen 512
extern const unsigned short blockPal[256];

#endif // GRIT_BLOCK_H

//}}BLOCK(block)
