class singleCube {
  //setting athe cube as a matrix
  PMatrix3D matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  color c;
  
  //Array of face objects for each side of the cube
  Face[] faces = new Face[6];
  
  singleCube(PMatrix3D position, int x, int y, int z) {
   this.matrix = position;
   this.x = x;
   this.y = y;
   this.z = z;
   c = color(255);
   
   //setting the colors for each side
   faces[0] = new Face(new PVector(0, 0, -1), color(6, 194, 88));
   faces[1] = new Face(new PVector(0, 0, 1), color(24, 123, 205));
   faces[2] = new Face(new PVector(0, 1, 0), color(245, 213, 71));
   faces[3] = new Face(new PVector(0, -1, 0), color(242, 243, 244));
   faces[4] = new Face(new PVector(1, 0, 0), color(245, 130, 22));
   faces[5] = new Face(new PVector(-1, 0, 0), color(153, 0, 0)); 
   
   //unseen faces are made black
   if(z > -1) {
     faces[0].c = color(0);  
   }
   if(z < 1) {
     faces[1].c = color(0);  
   }
   if(y < 1) {
     faces[2].c = color(0);
   }
   if(y > -1) {
     faces[3].c = color(0);  
   }
   if(x < 1) {
     faces[4].c = color(0);  
   }
   if(x > -1) {
     faces[5].c = color(0);  
   }
   
  }
  
  //animating each face turning
  void turnFacesZ(int dir) {
   for (Face f: faces) {
    f.turnZ(dir * HALF_PI); 
   }
  }
  
  void turnFacesY(int dir) {
   for (Face f: faces) {
    f.turnY(dir * HALF_PI); 
   }
  }
  
  void turnFacesX(int dir) {
   for (Face f: faces) {
    f.turnX(dir * HALF_PI); 
   }  
  }
  
  //updating the variables after each turn
  void update(int x, int y, int z) {
   matrix.reset(); 
   matrix.translate(x, y, z);
   this.x = x;
   this.y = y;
   this.z = z;
  }
  
  //showing the cube after each turn
  void show() {
   //fill(c);
   noFill();
   stroke(0);
   strokeWeight(0.1);
   pushMatrix();
   applyMatrix(matrix);
   box(1);
   for (Face f: faces) {
    f.show(); 
   }
   popMatrix();
  }
}
