class Move {
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;
  
  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }
  
  //starting the move animation 
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }
  
  //to make a copy of a move
  Move copy() {
    return new Move(x, y, z, dir);  
  }
  
  //to reverse the direction of a move
  void reverse() {
    dir *= -1;  
  }
  
  boolean finished() {
   return finished; 
  }
  
  //Insantaneously updating the minicubes position after each turn
  void update() {
    if(animating) {
      angle += dir * speed;
      if(abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        if(abs(z) > 0) {
          turnZ(z, dir);
        }
        else if(abs(x) > 0) {
          turnX(x, dir); 
        }
        else if(abs(y) > 0) {
          turnY(y, dir); 
        }
      }
    }
  }
  
}
