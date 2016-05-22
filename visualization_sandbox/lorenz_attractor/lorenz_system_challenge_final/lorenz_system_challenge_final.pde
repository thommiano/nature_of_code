import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

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

ArrayList<PVector> points = new ArrayList<PVector>(); // java syntax

PeasyCam cam;

void setup() {
  size(800,600, P3D);
  //background(0);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  
  // Calculate the delta
  float dt = 0.01; // NOT 1. 1 will rapidly tends towards infinity.
  float dx = (s * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;
  
  // Update with delta
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));

  //translate(width/2, height/2); //translate to the center of the screen
  scale(5);
  stroke(255);
  noFill();
  
  
  float hu = 0;
  beginShape();
  // java enhanced loop
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x,v.y,v.z);
    
    PVector offset = PVector.random3D();
    offset.mult(0.1);
    
    //float offset = noise(0.1);
    //v.mult(offset);
    
    hu += 0.1;
    if (hu>255) {
      hu = 0;
    }
  }
  endShape();

  //println(x,y,z);
}