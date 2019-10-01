int[] board = new int[9];
int curPlayer;
int mousePos;
int gameState; // -1 draw, 0 cont, 1-2 player win

void setup() {
  size(500, 500);
  stroke(0);
  textSize(20);

  for (int i = 0; i < 9; i++) board[i] = 0;
  curPlayer = 1;
  gameState = 0;
}

void draw() {
  if (gameState == 0)
    getMousePos();
  else
    mousePos = -1;
  drawGrid();
  drawSyms();
  gameState = checkWin();

  switch (gameState) {
    case 1:
      fill(#4477bb);
      text("Player 1 wins!", 10, 30);
      break;
    case 2:
      fill(#cc4444);
      text("Player 2 wins!", 10, 30);
      break;
    case -1:
      fill(#aaaaaa);
      text("Draw! Shameful display!", 10, 30);
      break;
  }
}

void mouseClicked() {
  if (mousePos >= 0 && board[mousePos] == 0) {
    board[mousePos] = curPlayer;
    curPlayer = (curPlayer == 1) ? 2 : 1;
  }
}
