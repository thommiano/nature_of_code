//---------------//
// Lorenz System //
//---------------//

// This is an exercise from Daniel Shiffman's coding challenge:
// "The Lorenz Attractor in Processing"
// URL: https://www.youtube.com/watch?v=f0lkz2gSsIk&feature=youtu.be

// Reference:
// wikipedia/Lorenz_system
// https://en.wikipedia.org/wiki/Lorenz_system

//
///

import processing.sound.*;

float x = 0.01;
float y = 0;
float z = 0;

// System constants
float s = 10.0; // sigma
float p = 28.0; // rho
float b = 8.0/3.0; // beta

//ArrayList<PVector> points = new ArrayList<PVector>(); // java syntax

int draw_i = 0;
float dx_init;

//----------------------------------------//
// Sound
///

SinOsc[] sineWaves; // Array of sines
float[] sineFreq; // Array of frequencies
int numSines = 3; // Number of oscillators to use

//----------------------------------------//
//----------------------------------------//
// Setup
///

void setup() {
  size(1000,800, P3D);
  background(0);
  frameRate(125);
  //colorMode(HSB);
  
  // Sound
  sineWaves = new SinOsc[numSines]; // Initialize the oscillators
  sineFreq = new float[numSines]; // Initialize array for Frequencies

  for (int i = 0; i < numSines; i++) {
    // Calculate the amplitude for each oscillator
    float sineVolume = (1.0 / numSines) / (i + 1);
    // Create the oscillators
    sineWaves[i] = new SinOsc(this);
    // Start Oscillators
    sineWaves[i].play();
    // Set the amplitudes for all oscillators
    sineWaves[i].amp(sineVolume);
  }
}

//----------------------------------------//
//----------------------------------------//
// Draw
///

void draw() {
  
  //if (draw_i == 0) {
  //  delay(15000);
  //}
  draw_i += 1;
  //background(0);
  
  // Calculate the delta
  float dt = 0.01; // NOT 1. 1 will rapidly tends towards infinity.
  float dx = (s * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;
  
  if (draw_i == 1) {
    float dx_init = dx;
  }
  
  // Update with delta
  x = x + dx;
  y = y + dy;
  z = z + dz;

  translate(width/2-50, height/2-50); //translate to the center of the screen
  scale(6);
  noFill();
  
  strokeWeight(.25);
  
  stroke(180,75,240,100);
  point(x,y,z);
  
  stroke(240,180,75,100);
  point(z,x,y);
  
  stroke(75,240,180,100);
  point(y,z,x);

  println(x,y,z);
  
  //float yoffset = map(mouseY, 0, height, 0, 1000);
  float x_pitch = map(abs(x), 0, 20, 220, 440);
  float y_pitch = map(abs(y), 0, 20, 40, 220);
  float z_pitch = map(abs(z), 0, 20, 220, 440);
  
  for (int i = 0; i < numSines; i++) { 
    sineFreq[i] = x_pitch + y_pitch + z_pitch * i;
    sineWaves[i].freq(sineFreq[i]);
  }
}