
//{{BLOCK(LoseState)

//======================================================================
//
//	LoseState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 8 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 256 + 2048 = 2816
//
//	Time-stamp: 2023-10-30, 22:06:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESTATE_H
#define GRIT_LOSESTATE_H

#define LoseStateTilesLen 256
extern const unsigned short LoseStateTiles[128];

#define LoseStateMapLen 2048
extern const unsigned short LoseStateMap[1024];

#define LoseStatePalLen 512
extern const unsigned short LoseStatePal[256];

#endif // GRIT_LOSESTATE_H

//}}BLOCK(LoseState)
