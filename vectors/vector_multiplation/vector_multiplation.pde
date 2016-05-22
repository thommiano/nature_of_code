void setup() {
  size(640,360);
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center); // This allows the line to follow the mouse 360*
  
  mouse.mult(0.5);
  
  translate(width/2,height/2); // This moves the line origin to the center
  line(0,0,mouse.x,mouse.y);
  
}