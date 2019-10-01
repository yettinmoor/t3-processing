void drawStart() {
  getButtonChosen();

  fill((buttonChosen == 1) ? #030303 : #111111);
  rect(100, 100, 300, 100);
  fill((buttonChosen == 2) ? #030303 : #111111);
  rect(100, 300, 300, 100);

  fill(255);
  text("1 player", 250, 150);
  text("2 players", 250, 350);
}

void drawGame() {
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
      text("Player 1 wins!", 250, 30);
      break;
    case 2:
      fill(#cc4444);
      text("Player 2 wins!", 250, 30);
      break;
    case -1:
      fill(#aaaaaa);
      text("Draw! Shameful display!", 250, 30);
      break;
  }
}
