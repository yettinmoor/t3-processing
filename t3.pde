boolean gameStarted;
int buttonChosen;
int nPlayers;
int[] board = new int[9];
int curPlayer;
int mousePos;
int gameState; // -1 draw, 0 cont, 1-2 player win

void setup() {
  size(500, 500);
  stroke(0);
  textSize(20);
  textAlign(CENTER, CENTER);

  gameStarted = false;
  for (int i = 0; i < 9; i++) board[i] = 0;
  curPlayer = 1;
  gameState = 0;
}

void draw() {
  background(#222222);
  if (gameStarted)
    drawGame();
  else
    drawStart();
}

void mouseClicked() {
  if (gameStarted) {
    tryMove();
  } else if (buttonChosen != 0) {
    nPlayers = buttonChosen;
    gameStarted = true;
  }
}
