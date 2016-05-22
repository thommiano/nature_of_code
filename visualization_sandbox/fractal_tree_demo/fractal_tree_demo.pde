float theta;
 
void setup() {
  size(800, 500);
}
 
void draw() {
  background(255);
  // Pick an angle according to the mouse location.
  theta = map(mouseY,0,height,0,PI/2);
 
  // The first branch starts at the bottom of the window.
  translate(width/2, height);
  stroke(0);
  branch(100);
}

void branch(float len) {
 
  line(0, 0, 0, -len);
  translate(0, -len);
 
  // Each branch’s length shrinks by two-thirds.
  len *= 0.75;
 
  if (len > 2) {
    pushMatrix();
    rotate(theta);
    // Subsequent calls to branch() include the length argument.
    branch(len);
    popMatrix();
 
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}