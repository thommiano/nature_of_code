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

SoundFile[] file;

// Define the number of samples 
int numsounds = 5;

// Create an array of values which represent the octaves. 1.0 is playback at normal speed, 0.5 is half and 
// therefore one octave down. 2.0 is double so one octave up.
float[] octave = {0.25, 0.5, 1.0, 2.0, 4.0};

// The playSound array is defining how many samples will be played at each trigger event
int[] playSound = {1,1,1,1,1};

// The trigger is an integer number in milliseconds so we can schedule new events in the draw loop
//int trigger;

//----------------------------------------//
//----------------------------------------//
// Setup
///

void setup() {
  size(1000,800, P3D);
  background(0);
  frameRate(125);
  //colorMode(HSB);
  
  // Create an array of empty soundfiles
  file = new SoundFile[numsounds];
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif 
  // it is easy to iterate through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, (i+1) + ".aif");
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
  //draw_i += 1;
  //background(0);
  
  // Calculate the delta
  float dt = 0.01; // NOT 1. 1 will rapidly tends towards infinity.
  float dx = (s * (y - x)) * dt;
  float dy = (x * (p - z) - y) * dt;
  float dz = (x * y - b * z) * dt;
  
  //if (draw_i == 1) {
  //  float dx_init = dx;
  //}
  
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
  
  //for (int i = 0; i < numsounds; i++){      
  //  // Check which indexes are 1 and 0.
  //  if (x > 8){
  //    float rate;
  //    // Choose a random index of the octave array
  //    rate = octave[int(0.5)];
  //    // Play the soundfile from the array with the respective rate and loop set to false
  //    file[i].play(rate, 1.0);
  //  }
  
      if ((x > 8.5) & (y > 8.5)){
        float rate;
        // Choose a random index of the octave array
        //rate = octave[int(0.5)];
        // Play the soundfile from the array with the respective rate and loop set to false
        //file[0].play();
        file[3].play();
      }
      
      if (y < -10){
        float rate;
        // Choose a random index of the octave array
        //rate = octave[int(0.5)];
        // Play the soundfile from the array with the respective rate and loop set to false
        file[0].play();
        //file[3].play();
      }
      
      if ((x < -14)){
        float rate;
        // Choose a random index of the octave array
        //rate = octave[int(0.5)];
        // Play the soundfile from the array with the respective rate and loop set to false
        file[1].play();
      }
      
      if ((x < -17)){
        float rate;
        // Choose a random index of the octave array
        //rate = octave[int(0.5)];
        // Play the soundfile from the array with the respective rate and loop set to false
        file[2].play();
      }
    
    // Renew the indexes of playSound so that at the next event the order is different and randomized.
    //playSound[i] = int(random(0,2));
  //}
}