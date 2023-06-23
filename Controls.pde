ArrayList<Move> extra = new ArrayList<Move>();

void keyPressed() {
  //starts scrambling once spacebar is pressed 
  if(key == ' ') {
    currentMove.start();
  }
   switch (key) {
   //for each case the letter is matched up with the move in the moves list
   //capital letters are clockwise turns and lower case are counter-clockwise
   case 'f':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[9];
      currentMove.start();
     }
     break;
   case 'F':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[8];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'b':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[10];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'B':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[11];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'u':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[3];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'U':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[2];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'd':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[0];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'D':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[1];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'l':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[6];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'L':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[7];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'r':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[5];
      currentMove.start();
     }
     solveMove.update();
     break;
   case 'R':
     currentMove.update();
     if(currentMove.finished()) {
      currentMove = moves[4];
      currentMove.start();
     }
     solveMove.update();
     break;
   //press s to solve
   case 's':
     if(currentMove.finished()) {
       solveMove.start();
     }
     break;
   }
}

void applyMove(char move) {
  switch (move) {
   case 'f':
     turnZ(1, 1);
     break;
   case 'F':
     turnZ(1, -1);
     break;
   case 'b':
     turnZ(-1, 1);
     break;
   case 'B':
     turnZ(-1, -1);
     break;
   case 'u':
     turnY(1, 1);
     break;
   case 'U':
     turnY(1, -1);
     break;
   case 'd':
     turnY(-1, 1);
     break;
   case 'D':
     turnY(-1, -1);
     break;
   case 'l':
     turnX(-1, 1);
     break;
   case 'L':
     turnX(-1, -1);
     break;
   case 'r':
     turnX(1, 1);
     break;
   case 'R':
     turnX(1, -1);
     break;
  } 
}
