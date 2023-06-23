import peasy.*;

//use mouse as camera
PeasyCam cam;

//setting up cube and cube turn speed
float speed = 0.2; 
int dimension = 3;
singleCube[] cube = new singleCube[dimension * dimension * dimension];

//all moves
Move[] moves = new Move[] {
  new Move(0, 1, 0, 1),
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1),
  new Move(0, -1, 0, -1),
  new Move(1, 0, 0, 1),
  new Move(1, 0, 0, -1),
  new Move(-1, 0, 0, 1),
  new Move(-1, 0, 0, -1),
  new Move(0, 0, 1, 1),
  new Move(0, 0, 1, -1),
  new Move(0, 0, -1, 1),
  new Move(0, 0, -1, -1)
};

//array list for the scramble
ArrayList<Move> scramble = new ArrayList<Move>();
ArrayList<Move> solve = new ArrayList<Move>();
int count = 0;
int solveCount = 0;
boolean started = false;

Move currentMove;
Move solveMove;

//setting up cube and camera distance
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 375);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(450);
  int index = 0;
  for(int x = -1; x <= 1; x++) {
    for(int y = -1; y <= 1; y++) {
      for(int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new singleCube(matrix, x, y, z);
        index++;
      }
    }
  }
  
  //making sure moves aren't undone in scramble
  int b = int(random(moves.length));
  Move m = moves[b];
  scramble.add(m);
  for(int i = 0; i < 19; i++) {
    b = int(random(moves.length));
    m = moves[b]; 
    if(m.x != 0) {
      if(m.x == scramble.get(scramble.size() - 1).x && -m.dir == scramble.get(scramble.size() - 1).dir) {
        i--;    
      }
      else {
        scramble.add(m);  
      }
    }
    else if(m.y != 0) {
      if(m.y == scramble.get(scramble.size() - 1).y && -m.dir == scramble.get(scramble.size() - 1).dir) {
        i--;    
      }
      else {
        scramble.add(m);  
      }
    }
    else if(m.z != 0) {
      if(m.z == scramble.get(scramble.size() - 1).z && -m.dir == scramble.get(scramble.size() - 1).dir) {
        i--;    
      }
      else {
        scramble.add(m);  
      }
    }
    else{
      scramble.add(m); 
    } 
  } 
  
  currentMove = scramble.get(count);

  //solve algorithm
  for(int i = scramble.size() - 1; i >= 0; i--) {
    Move undo = scramble.get(i).copy();
    undo.reverse();
    solve.add(undo);
  }
  
  solveMove = solve.get(solveCount);

  
}

//updates the cubes face after every turn 
void turnX(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    singleCube mini = cube[i];
    if(mini.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(mini.y, mini.z);
      mini.update(mini.x, round(matrix.m02), round(matrix.m12));
      mini.turnFacesX(dir);
    }
  }
}

void turnY(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    singleCube mini = cube[i];
    if(mini.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(mini.x, mini.z);
      mini.update(round(matrix.m02), mini.y, round(matrix.m12));
      mini.turnFacesY(dir);
    }
  }
}

void turnZ(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    singleCube mini = cube[i];
    if(mini.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(mini.x, mini.y);
      mini.update(round(matrix.m02), round(matrix.m12), round(mini.z));
      mini.turnFacesZ(dir);
    }
  }
}

//background and cube placement.
void draw() {
  background(71);
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);
  
  //tracks most recent move
  solveMove.update();
  currentMove.update();
  
  if(currentMove.finished() && count < scramble.size() - 1) {
    count++;  
    currentMove = scramble.get(count);
    currentMove.start();
   }
   else if(solveMove.finished() && solveCount < solve.size() - 1) {
    solveCount++;
    solveMove = solve.get(solveCount);
    solveMove.start();
  }
  //prints cube onto page along with any updates(turns)
  //Also since solve algorithm will overlap animations it switches between the 2 overlapped cubes depending on whether currentMove or solveMove is animating
  scale(50);
  if(solveMove.animating) {
      for(int i = 0; i < cube.length; i++) {
      push();
      if(abs(cube[i].z) > 0 && cube[i].z == solveMove.z) {
        rotateZ(solveMove.angle);
      }
      else if(abs(cube[i].x) > 0 && cube[i].x == solveMove.x) {
        rotateX(solveMove.angle);
      }
      else if(abs(cube[i].y) > 0 && cube[i].y == solveMove.y) {
        rotateY(-solveMove.angle);  
      }
      cube[i].show();
      pop();
    }  
  }
  else {
    for(int i = 0; i < cube.length; i++) {
      push();
      if(abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
        rotateZ(currentMove.angle);
      }
      else if(abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
        rotateX(currentMove.angle);
      }
      else if(abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
        rotateY(-currentMove.angle);  
      }
      cube[i].show();
      pop();
    }
  }
}
