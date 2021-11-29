
//{{BLOCK(skybgg)

//======================================================================
//
//	skybgg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 224 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14336 + 2048 = 16896
//
//	Time-stamp: 2020-11-20, 12:50:56
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKYBGG_H
#define GRIT_SKYBGG_H

#define skybggTilesLen 14336
extern const unsigned short skybggTiles[7168];

#define skybggMapLen 2048
extern const unsigned short skybggMap[1024];

#define skybggPalLen 512
extern const unsigned short skybggPal[256];

#endif // GRIT_SKYBGG_H

//}}BLOCK(skybgg)
