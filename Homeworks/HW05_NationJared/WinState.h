
//{{BLOCK(WinState)

//======================================================================
//
//	WinState, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 12 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 384 + 2048 = 2944
//
//	Time-stamp: 2023-10-30, 22:05:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSTATE_H
#define GRIT_WINSTATE_H

#define WinStateTilesLen 384
extern const unsigned short WinStateTiles[192];

#define WinStateMapLen 2048
extern const unsigned short WinStateMap[1024];

#define WinStatePalLen 512
extern const unsigned short WinStatePal[256];

#endif // GRIT_WINSTATE_H

//}}BLOCK(WinState)
