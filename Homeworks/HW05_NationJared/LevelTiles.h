
//{{BLOCK(LevelTiles)

//======================================================================
//
//	LevelTiles, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2023-10-29, 18:28:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVELTILES_H
#define GRIT_LEVELTILES_H

#define LevelTilesTilesLen 32768
extern const unsigned short LevelTilesTiles[16384];

#define LevelTilesMapLen 2048
extern const unsigned short LevelTilesMap[1024];

#define LevelTilesPalLen 512
extern const unsigned short LevelTilesPal[256];

#endif // GRIT_LEVELTILES_H

//}}BLOCK(LevelTiles)
