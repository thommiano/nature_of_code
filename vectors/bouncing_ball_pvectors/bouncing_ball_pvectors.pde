//------------------------------//
// Bouncing Ball with PVectors! //
//------------------------------//

// Instead of floats, we now just have two PVector variables
PVector location;
PVector velocity;

void setup() {
  size(640,360);
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw() {
  background (255); // If this were in the setup instead we would have ball trails
  
  location.add(velocity);
  
  // Make the ball change directions when it passes the edges of the canvas
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  stroke(0);
  fill(175);
  ellipse(location.x,location.y,16,16);
}