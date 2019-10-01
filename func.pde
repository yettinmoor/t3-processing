// Return index of tile (0-8) mouse hovers on
// or -1 if mouse off-screen
void getMousePos() {
  mousePos = (mouseX * mouseY == 0) ? -1 : 3*((3*mouseY)/height) + (3*mouseX)/width;
}

void drawGrid() {
  background(#222222);

  // Mouse highlight
  fill(#151515);
  if (mousePos >= 0 && board[mousePos] == 0) {
    rect(width*(mousePos%3)/3, height*(mousePos/3)/3, width/3, height/3);
  }

  // Grid
  int padding = 6;
  fill(#eeeeee);
  rect(0, height/3 - .5*padding, width, padding);
  rect(0, 2*height/3 - .5*padding, width, padding);
  rect(width/3 - .5*padding, 0, padding, height);
  rect(2*width/3 - .5*padding, 0, padding, height);
}

void drawSyms() {
  int symRadius = min(width, height)/10;
  float px, py;
  for (int i = 0; i < 9; i++) {
    if (board[i] == 0) continue;
    px = width  * ((float)(i%3)/3 + 1/6f);
    py = height * ((float)(i/3)/3 + 1/6f);
    fill((board[i] == 1) ? #4477bb : #cc4444);
    ellipse(px, py, symRadius, symRadius);
  }
}

int checkWin() {
  for (int i = 0; i < 3; i++) {
    if (board[i] == 0)
      continue;
    if (board[3*i] == board[3*i+1] && board[i] == board[3*i+2])
      return board[i]; // row
    if (board[i] == board[i+3] && board[i] == board[i+6])
      return board[i]; // col
    if (board[i] == board[4] && board[i] == board[8-i])
      return board[i]; // diag
  }

  boolean draw = true;
  for (int i : board)
    if (i == 0) draw = false;

  return draw ? -1 : 0;
}
