
//{{BLOCK(loser)

//======================================================================
//
//	loser, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 215 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13760 + 2048 = 16320
//
//	Time-stamp: 2020-11-04, 19:50:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSER_H
#define GRIT_LOSER_H

#define loserTilesLen 13760
extern const unsigned short loserTiles[6880];

#define loserMapLen 2048
extern const unsigned short loserMap[1024];

#define loserPalLen 512
extern const unsigned short loserPal[256];

#endif // GRIT_LOSER_H

//}}BLOCK(loser)
