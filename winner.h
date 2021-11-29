
//{{BLOCK(winner)

//======================================================================
//
//	winner, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 147 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9408 + 2048 = 11968
//
//	Time-stamp: 2020-11-19, 17:38:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINNER_H
#define GRIT_WINNER_H

#define winnerTilesLen 9408
extern const unsigned short winnerTiles[4704];

#define winnerMapLen 2048
extern const unsigned short winnerMap[1024];

#define winnerPalLen 512
extern const unsigned short winnerPal[256];

#endif // GRIT_WINNER_H

//}}BLOCK(winner)
