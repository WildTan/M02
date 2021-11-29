
//{{BLOCK(GameFront)

//======================================================================
//
//	GameFront, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 596 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 38144 + 2048 = 40704
//
//	Time-stamp: 2020-11-14, 21:54:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEFRONT_H
#define GRIT_GAMEFRONT_H

#define GameFrontTilesLen 38144
extern const unsigned short GameFrontTiles[19072];

#define GameFrontMapLen 2048
extern const unsigned short GameFrontMap[1024];

#define GameFrontPalLen 512
extern const unsigned short GameFrontPal[256];

#endif // GRIT_GAMEFRONT_H

//}}BLOCK(GameFront)
