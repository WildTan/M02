
//{{BLOCK(mainBG)

//======================================================================
//
//	mainBG, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 145 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9280 + 2048 = 11840
//
//	Time-stamp: 2020-11-20, 12:47:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINBG_H
#define GRIT_MAINBG_H

#define mainBGTilesLen 9280
extern const unsigned short mainBGTiles[4640];

#define mainBGMapLen 2048
extern const unsigned short mainBGMap[1024];

#define mainBGPalLen 512
extern const unsigned short mainBGPal[256];

#endif // GRIT_MAINBG_H

//}}BLOCK(mainBG)
