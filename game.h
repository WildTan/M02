// Player Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int bulletTimer;
    int aniFrame;
	int rdel;
	int jumping;
} MARIO;
//goombas Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
	int aniFrame;
	int rdel;
	int jumping;
} GOOMBAS;
//fireball Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} FIREBALLS;
//Coin Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} COIN;
//Heart Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} HEART;
//prototypes
void initGame();
void updateGame();
void initMario();
void initObstacles();
void updateMario();
void updateHeart(HEART*);
void updateCoin(COIN *);
void updateGoombas(GOOMBAS *);
void updateFBS(FIREBALLS *);
void spawnObstacles();
//Game Variables
extern MARIO player;
extern COIN coin;
extern HEART heart;
extern GOOMBAS goombs[3];
extern FIREBALLS fballs[3];
extern int playerLives;
extern int winCounter;
extern int jumpTimer;
extern int livesUpdate;
extern int ground;
extern int hOff;
extern int vOff;



