class Face {
 PVector normal;
 color c;
 
 //Each face is built using matrices
 Face(PVector normal, color c) {
  this.normal = normal;
  this.c = c;
 }
 
 //the math behind updating the position of each minicube once turned in the x,y,z direction
 void turnX(float angle) {
   PVector v2 = new PVector();
   v2.y = round(normal.y * cos(angle) - normal.z * sin(angle));
   v2.z = round(normal.y * sin(angle) + normal.z * cos(angle));
   v2.x = round(normal.x);
   normal = v2;   
 } 
 
 void turnY(float angle) {
   PVector v2 = new PVector();
   v2.x = round(normal.x * cos(angle) - normal.z * sin(angle));
   v2.z = round(normal.x * sin(angle) + normal.z * cos(angle));
   v2.y = round(normal.y);
   normal = v2;   
 } 
 
 void turnZ(float angle) {
   PVector v2 = new PVector();
   v2.x = round(normal.x * cos(angle) - normal.y * sin(angle));
   v2.y = round(normal.x * sin(angle) + normal.y * cos(angle));
   v2.z = round(normal.z);
   normal = v2;
 }
 
 void show() {
   //showing what happens for each turn 
   pushMatrix();
   fill(c);
   noStroke();
   rectMode(CENTER);
   translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
   if(abs(normal.y) > 0) {
    rotateX(HALF_PI);
   } 
   else if(abs(normal.x) > 0) {
     rotateY(HALF_PI); 
   }
   else if(abs(normal.z) > 0) {
     rotateZ(HALF_PI);  
   }
   square(0, 0, 1);
   popMatrix();
 }
}