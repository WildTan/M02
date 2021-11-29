/*
Thank you for being such an understanding teacher during this hectic COVID semester <3
Hope you have a wonderful winter break
*/
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "GameFront.h"
#include "mainBG.h"
#include "pause.h"
#include "winner.h"
#include "loser.h"
#include "spriteMario.h"
#include "skybgg.h"
#include "sound.h"
#include "ThemeSong.h"
#include "instructions.h"

// Prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
//void goToWin();
//void win();
void goToLose();
void lose();
void instruct();
void goToInstruct();
// Shadow OAM
OBJ_ATTR shadowOAM[128];
// Button Variables
unsigned short buttons;
unsigned short oldButtons;
// Random Seed
int seed;
// Text Buffer
char buffer1[41];
char buffer2[41];
// States
enum
{
    START,
    GAME,
    PAUSE,
    INSTRUCTIONS,
    LOSE
};
int state;
int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case INSTRUCTIONS:
            instruct();
            break;
        case LOSE:
            lose();
            break;
        }
    }

}
// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE | BG1_ENABLE; // Bitwise OR MODE 0 & the BG(s) & SPRITE_ENABLE to use sprites

    buttons = BUTTONS;
    oldButtons = 0;
    setupSounds();
	setupInterrupts();
    goToStart();
}
// Sets up the start state
void goToStart() {
    initGame();
    DMANow(3, GameFrontPal, PALETTE, 256);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, GameFrontTiles, &CHARBLOCK[0], 19072);
    DMANow(3, GameFrontMap, &SCREENBLOCK[28], 1024);
    state = START;
    DMANow(3, spriteMarioPal, SPRITEPALETTE, 256);//DMA to load Sprites on to the Screen
    DMANow(3, spriteMarioTiles, &CHARBLOCK[4], 16384);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}

// Runs every frame of the start state
void start() {
    waitForVBlank();
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
    }
    else if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstruct();
    }
}
// Sets up the instruction state
void goToInstruct() {
    DMANow(3, instructionsPal, PALETTE, 256);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, instructionsTiles, &CHARBLOCK[0], 14560);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], 1024);
    state = INSTRUCTIONS;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}
// Runs every frame of the instructions state
void instruct() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}
// Sets up the game state
void goToGame() {
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, skybggPal, PALETTE, 256);
    DMANow(3, skybggTiles, &CHARBLOCK[0] ,7168);
    DMANow(3, skybggMap, &SCREENBLOCK[28], 1024);
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(14) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, mainBGTiles, &CHARBLOCK[1], 4640);
    DMANow(3, mainBGMap, &SCREENBLOCK[14], 1024);
    state = GAME;
    
    stopSound();
    playSoundA(ThemeSong_data, ThemeSong_length, 1);
}

// Runs every frame of the game state
void game() {
    updateGame();
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
/*
    else if(winCounter >= 5) {
        goToWin();
    }
*/
    if(playerLives <= 0) {
        goToLose();
    }
}
// Sets up the pause state
void goToPause() {
    hOff = 0;
    REG_BG0HOFF = hOff;
    DMANow(3, pausePal, PALETTE, 256);
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(14) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, pauseTiles, &CHARBLOCK[1], 5088);
    DMANow(3, pauseMap, &SCREENBLOCK[14], 1024);
    state = PAUSE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}

// Runs every frame of the pause state
void pause() {
    stopSound();
    // Lock the framerate to 60 fps
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    }
    else if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
// Sets up the lose state
void goToLose() {
    hOff = 0;
    REG_BG0HOFF = hOff;
    DMANow(3, loserPal, PALETTE, 256);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, loserTiles, &CHARBLOCK[0], 6880);
    DMANow(3, loserMap, &SCREENBLOCK[28], 1024);
    state = LOSE;
    stopSound();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}

// Runs every frame of the lose state
void lose() {
    // Lock the framerate to 60 fps
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}
/* took out the win state
// Sets up the win state
void goToWin() {
    hOff = 0;
    REG_BG0HOFF = hOff;
    DMANow(3, winnerPal, PALETTE, 256);
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(17) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, winnerTiles, &CHARBLOCK[1], 4704);
    DMANow(3, winnerMap, &SCREENBLOCK[17], 1024);
    state = WIN;
    stopSound();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}

// Runs every frame of the win state
void win() {
    // Lock the framerate to 60 fps
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}
*/