#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "sound.h"
#include "jumpingSound.h"

// Variables
HEART heart;
COIN coin;
MARIO player;
GOOMBAS goombs[3];
FIREBALLS fballs[3];
int playerLives;
int winCounter;
int gameTimer1;
int gameTimer2;
int gameTimer3;
int livesUpdate;
// game variables
int jumpTimer;
int ground;
//vertical and horizontal offsets
int hOff;
int vOff;
// gravity stuff
#define GRAVITY 50
#define JUMPPOWER 4500
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)
// Initialize the game
void initGame() {
    hOff = 0;
    vOff = 90;
    ground = (118);
    jumpTimer = 0;
	initMario();
    initObstacles();
    // Initialize the starting number of lives the player has
	playerLives = 3;
    winCounter = 0;
}

//Initialize the player
void initMario() {
	player.row = 119;
	player.col = 8;
	player.height = 16;
	player.width = 16;
    player.aniFrame = 0;
    player.rdel = 0;
    player.jumping = 0;
    winCounter = 0;
    livesUpdate = 0;
}

// Initialize the goombas and fireballs and coin and heart
void initObstacles() {
	for (int i = 0; i < 3; i++) {
		goombs[i].row = 119;
		goombs[i].col = 200 + rand()  % 125 ;
        goombs[i].height = 16;
		goombs[i].width = 32;
        goombs[i].active = 1;
        goombs[i].aniFrame = 0;
        goombs[i].rdel = 0;
        goombs[i].jumping = 0;
	}
    for (int i = 0; i < 3; i++) {
        if(i % 2 == 0) {
            fballs[i].row = rand() % 85;
		    fballs[i].col = 225;
            fballs[i].height = 4;
		    fballs[i].width = 4;
            fballs[i].active = 0;
        }
        else {
            fballs[i].row = rand() % 85;
		    fballs[i].col = 225;
            fballs[i].height = 2;
		    fballs[i].width = 2;
            fballs[i].active = 0;
        }
    }
    coin.row = rand() % 85;
	coin.col = 225;
    coin.height = 4;
	coin.width = 4;
    coin.active = 0;
    heart.row = rand() % 90;
	heart.col = 220;
    heart.height = 6;
	heart.width = 6;
    heart.active = 0;
}
// Updates the game each frame
void updateGame() {
    if (hOff > 200) {
        hOff = 0;
    }
    else
    {
        hOff++;
    }
    REG_BG0HOFF = hOff / 2;
	updateMario();
    spawnObstacles();
    //show player sprite SHIFTDOWN(player.row)
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniFrame * 2, 0);
    //show coin sprite
    updateCoin(&coin);
    shadowOAM[1].attr0 = coin.row | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[1].attr1 = coin.col | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 2);
    //show heart sprite
    updateHeart(&heart);
    shadowOAM[2].attr0 = heart.row | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[2].attr1 = heart.col | ATTR1_SMALL;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 2);
    //show lives remaining on the screen
    shadowOAM[3].attr0 = 140 | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_WIDE;
    shadowOAM[3].attr1 = 0 | ATTR1_LARGE;
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 4);
    //show lives remaining on the screen
    shadowOAM[4].attr0 = 138 | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[4].attr1 = 43 | ATTR1_SMALL;
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(livesUpdate * 2, 10);
	// Update all the Goombas
	for (int i = 0; i < 3; i++) {
        if (goombs[i].active == 1) {
            updateGoombas(&goombs[i]);
            shadowOAM[5+i].attr0 = goombs[i].row | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
            shadowOAM[5+i].attr1 = goombs[i].col | ATTR1_SMALL;
            shadowOAM[5+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(goombs[i].aniFrame * 2,2);
        }
    }
    //update all the fire balls
	for (int i = 0; i < 3; i++) {
        if (fballs[i].active == 1) {
            updateFBS(&fballs[i]);
            shadowOAM[11+i].attr0 = fballs[i].row | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
            shadowOAM[11+i].attr1 = fballs[i].col | ATTR1_SMALL;
            shadowOAM[11+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6,2);
        }
    }
    DMANow(3, shadowOAM, OAM, 128*4);
    
}
//Handles every frame actions of the player
void updateMario() {
    //keep track of player lives
    if (playerLives == 1) {
        livesUpdate = 0;
    }
    else if (playerLives == 2) {
        livesUpdate = 1;
    }
    else if (playerLives == 3) {
        livesUpdate = 2;
    }
    else if (playerLives == 4) {
        livesUpdate = 3;
    }
    else if (playerLives == 5) {
        livesUpdate = 4;
    }
    else if (playerLives == 6) {
        livesUpdate = 5;
    }
    player.jumping = 0;
    //UP MOVEMENT
    if(BUTTON_PRESSED(BUTTON_UP) && player.jumping == 0) {
        if (player.row < 18) {
            player.row = 19;
        }
        player.jumping = 1;
        player.rdel = 1;
        playSoundB(jumpingSound_data, jumpingSound_length, 0); //plays Mario Jumping sound effect
        player.row -= 18;
        //Changes frame animation of the player
        player.aniFrame++;
        if (player.aniFrame > 2) {
            player.aniFrame = 0;
        }
        
    }
    //Gravity controls
    if (player.row < ground) {
        player.rdel += SHIFTDOWN(GRAVITY);
    }
    else
    {
        player.rdel = 0;
        player.jumping = 0;
    }
    player.row += player.rdel;

// this is my cheat for the game. Gain an additional 3 lives when you need it by pressing the right button
    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        playerLives += 3;
        //cap on maximum number of lives. You can only have up to 6 total lives throughout the whole game.
        if (playerLives > 6) {
            playerLives = 6;
        }
    }

/* i took out downward and sideways movement!! Tried to make the game more like Flappy Bird
    //DOWNWARD MOVEMENT
    if(BUTTON_HELD(BUTTON_DOWN)) {
        player.row += 1;
        if(player.row > 135 - player.height) { //check bottom boundary
            player.row = 135 - player.height;
        }
    }

    //MOVE RIGHT
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.col += 1;
        if(player.col > 239 - player.width) { //check right border bound
            player.col = 239 - player.width;
        }
    }

    //MOVE LEFT
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player.col -= 1;
        if (player.col < 1) { //check left border bound
            player.col = 1;
        }
    }
*/
}
//Handle every-frame actions of the Goombas
void updateGoombas(GOOMBAS* a) {
    a->col -= 1;//Moves goombas left from the right side of the screen
//Conditions to make the goombas jump up and down
    if (a->row == 90) {
        a->jumping = 0;
    }
    if (a->row == 119) {
        a->jumping = 1;        
    }
    if (a->jumping == 1) {
        a->row -= 1;
        a->aniFrame++;
    }
    else
    {
        a->row += 1;
    }
//looping animation for the goombas
    if (a->aniFrame > 2) {
        a->aniFrame = 0;
    }
    //a->row -= 1;// Makes goombas jump
    //checks collision with gooombas and mario
    if (collision(player.col - 3, player.row, player.width, player.height, a->col, a->row, a->width, a->height)) {
        playerLives--;
        a->col = 150 + rand() % 60;
    }
    //returns goombas to right side after hitting the left boundary
    if (a->col < 0) {
        a->active = 0;
        a->col = 150 + rand() % 60;
    }
}
//Handle every-frame actions of the fireballs
void updateFBS(FIREBALLS* b) {
    b->col -= 1;//Moves fire balls left from the right side of the screen
    //returns fire balls to right side after hitting the left boundary
    if (collision(player.col - 7, player.row - 7, player.width, player.height, b->col, b->row, b->width, b->height)) {
        playerLives--;
        b->col = 237;
        b->row = rand() % 99;
    }
    if (b->col < 0) {
        b->active = 0;
        b->col = 237;
        b->row = rand() % 107;
    }
}
//Handle every-frame actions of the coin
void updateCoin(COIN* c) {
    c->col -= 2;// moves the coin right to left
    if (collision(player.col - 6, player.row - 6, player.width, player.height, c->col, c->row, c->width, c->height)) {
        winCounter++;
        c->col = 237;
        c->row = rand() % 90;
    }
    if (c->col < 0) {
        c->active = 0;
        c->col = 237;
        c->row = rand() % 93;
    }
}
//Handle every-frame actions of the heart
void updateHeart(HEART* c) {
    c->col -= 2;// moves the coin right to left
    if (collision(player.col - 6, player.row - 6, player.width, player.height, c->col, c->row, c->width, c->height)) {
        playerLives++;
        c->col = 237;
        c->row = rand() % 90;
    }
    if (c->col < 0) {
        c->active = 0;
        c->col = 237;
        c->row = rand() % 94;
    }  
}
//spawn goombas, fireballs, and coin right side of the screen
void spawnObstacles() {
	for (int i = 0; i < 3; i++) {
		if (gameTimer1 >= 10 && goombs[i].active == 0 ) {//spawn next available unerased car
			goombs[i].active = 1;
			gameTimer1 = 0;//reset timer
			break;
		}
    }
    for (int i = 0; i < 4; i++) {
		if (gameTimer2 >= 20 && fballs[i].active == 0 ) {//spawn next available unerased fire ball
			fballs[i].active = 1;
			gameTimer2 = 0;//reset timer
			break;
		}
    }
    if (gameTimer3 >= 120 && heart.active == 0) {
        heart.active = 1;
        gameTimer3 = 0;
    }
	gameTimer1++;
    gameTimer2++;
    gameTimer3++;
}

