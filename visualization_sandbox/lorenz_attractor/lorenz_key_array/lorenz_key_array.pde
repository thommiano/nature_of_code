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

// Maximum Values: 21.496574 29.482346 54.179253
// Minimum Values: -18.84638 -24.680065 0.0

//-----------------//
// Dependencies
///

import processing.sound.*;

//-----------------//
// Lorenz
///

float x = 0.01;
float y = 0;
float z = 0;

// System constants
float s = 10.0; // sigma
float p = 28.0; // rho
float b = 8.0/3.0; // beta

//-----------------//
// Visualization
///

// We are using pixel location to track the point
int cols = width;
int rows = height;

// Declare 2D array
int[][] screenArray = new int[cols][rows];

// We're creating an array list that will store pvectors, {<x,y,z>, . . . , <xn,yn,zn>}
ArrayList<PVector> pointsArray = new ArrayList<PVector>(); // java syntax

// We're creating independent arrays to keep track of all x, y, and z values.
// We're doing this in addition to the pointsArray because with this we can easily calculate
// the max x, y, and z, without having to loop through the points array.

FloatList xArray;
FloatList yArray;
FloatList zArray;

float right;
float left;
float top;
float bottom;

//-----------------//
// Sound
///

// Frequency
//

SinOsc[] sineWaves; // Array of sines
float[] sineFreq; // Array of frequencies
int numSines = 2; // Number of oscillators to use

// Tone
//

SoundFile[] file; // Load file
int numsounds = 5; // Define the number of samples

int xTone;
int yTone;
int xTonePrior;
int yTonePrior;

//----------------------------------------//
//----------------------------------------//
// Setup
///

void setup() {
  size(1000,800, P3D);
  background(0);
  frameRate(125);
  //colorMode(HSB);
  
  //-----------------//
  // Sound
  ///
  
  // Frequency
  //
  
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
  
  // Tone
  //
  
  // Create an array of empty soundfiles
  file = new SoundFile[numsounds];
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif 
  // it is easy to iterate through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
  
  xTonePrior = numsounds + 1;
  yTonePrior = numsounds + 1;
  
  //-----------------//
  // Visualization
  ///
  
  xArray = new FloatList();
  yArray = new FloatList();
  zArray = new FloatList();
  
  left = -(width/2);
  right = (width/2);
  top = (height/2);
  bottom = (height/2);
  
}

//----------------------------------------//
//----------------------------------------//
// Draw
///

void draw() {
  
  //-----------------//
  // Lorenz
  ///

  // Calculate the delta
  float dt = 0.01; // NOT 1. 1 will rapidly tends towards infinity.
  float dx = (s * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;
  
  // Update with delta
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  // Store values in array
  pointsArray.add(new PVector(x,y,z));
  
  // Store values in our independent arrays
  xArray.append(x);
  yArray.append(y);
  zArray.append(z);

  //-----------------//
  // Visualization
  ///
    
  // Move the origin of the visualization to the center of the screen
  translate(width/2, height/2);
  scale(5); // n*100% increasing dimension of shape
  noFill();
  
  strokeWeight(.25);
  
  for (PVector v: pointsArray) {
    stroke(180,75,240,100);
    point(v.x,v.y,v.z);
    
    //stroke(240,180,75,100);
    //point(z,x,y);
    
    //stroke(75,240,180,100);
    //point(y,z,x);

  }
  
  //-----------------//
  // Sound
  ///

  float x_pos = map(xArray.get(xArray.size() - 1), -19, 22, 0, width);
  float y_pos = map(yArray.get(yArray.size() - 1), -25, 30, 0, height);
  
  // Frequency
  //
  
  // Map point positions to frequency ranges
  //float x_pitch = map(x_pos, 0, width, 440, 660);
  //float y_pitch = map(y_pos, 0, width, 220, 30);
  
  //for (int i = 0; i < numSines; i++) { 
  //  sineFreq[i] = x_pitch + y_pitch * i;
  //  sineWaves[i].freq(sineFreq[i]);
  //}
  
  // Tone
  //
  
  xTone = int(map(x_pos, 0, width, 0, 5));
  yTone = int(map(y_pos, 0, height, 0, 4));
  
  file[xTone].play();
  
  //if (xTone != xTonePrior) {
  //  file[xTone].play();
  //}
  
  //if (yTone != yTonePrior) {
  //  file[yTone].play();
  //}

  //xTonePrior = xTone;
  //yTonePrior = yTone;

  //println(xArray.min(), yArray.min(), zArray.min());
}



/////-------------------------------------------------------/////
// Notes to self:
// 
// 1. You can store your xTones and yTones in an array. By keeping a history of tones you might
//    be able to use them for something like reverb. But then you have to ask yourself, what additional
//    value is it providing you since you're already storying xArray and yArray. I supposed you 
//    wouldn't want to run the map function again. But as you're writing this you're pretty tired . . .


// 2. Every n values in array (e.g, 10 values in xArray), look at current value and play
//    sound based on its location.

// To Do
//
// 1. You need to figure out how to deal with the resonance created by multiple sound files. Part of that 
//    is figuring out how often to actually play a new file, which might also include stopping other files.

// Useful code
//

//float hu = 0;
//beginShape();
//// java enhanced loop
//for (PVector v : points_array) {
//  stroke(hu, 255, 255);
//  vertex(v.x,v.y,v.z);
  
//  hu += 0.1;
//  if (hu>255) {
//    hu = 0;
//  }
//}
//endShape();