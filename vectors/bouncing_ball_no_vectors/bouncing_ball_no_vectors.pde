//-------------------------------//
// Bouncing ball with no vectors //
//-------------------------------//

// We will set a ball in motion by changing an ellipse's intitial x and y position
// by some fixed rate xspeed and yspeed. We will keep the ball constrained to our display
// canvas by making its xspeed or yspeed negative if its x or y exceeds the 
// width or height, respectively.

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

void setup() {
  size(640,360);
  background(255);
}

void draw() {
  background(255);
  
  // Move the ball according to its speed
  x = x + xspeed;
  y = y + yspeed;
  
  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}