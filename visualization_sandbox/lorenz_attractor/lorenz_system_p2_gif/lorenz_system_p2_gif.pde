//import gifAnimation.*;

//---------------//
// Lorenz System //
//---------------//

// This is an exercise from Daniel Shiffman's coding challenge:
// "The Lorenz Attractor in Processing"
// URL: https://www.youtube.com/watch?v=f0lkz2gSsIk&feature=youtu.be

// Reference:
// wikipedia/Lorenz_system
// https://en.wikipedia.org/wiki/Lorenz_system

float x = 0.01;
float y = 0;
float z = 0;

// System constants
float s = 10.0; // sigma
float p = 28.0; // rho
float b = 8.0/3.0; // beta

//ArrayList<PVector> points = new ArrayList<PVector>(); // java syntax

//GifMaker gifExport;

void setup() {
  size(1000,800, P3D);
  background(0);
  frameRate(150);
  //colorMode(HSB);
  
//  gifExport = new GifMaker(this, "lorenz.gif");
//  gifExport.setRepeat(0); // make it an "endless" animation
//  gifExport.setTransparent(0,0,0); //black is transparent
}

void draw() {
  //background(0);
  
  // Calculate the delta
  float dt = 0.01; // NOT 1. 1 will rapidly tends towards infinity.
  float dx = (s * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;
  
  // Update with delta
  x = x + dx;
  y = y + dy;
  z = z + dz;

  translate(width/2-50, height/2-50); //translate to the center of the screen
  scale(6);
  noFill();
  
  strokeWeight(1.5);
  
  stroke(180,75,240,220);
  point(x,y,z);
  
  stroke(240,180,75,220);
  point(z,x,y);
  
  stroke(75,240,180,220);
  point(y,z,x);

//  gifExport.setDelay(1);
//  gifExport.addFrame();
}

//void mousePressed() {
//  gifExport.finish();
//}
