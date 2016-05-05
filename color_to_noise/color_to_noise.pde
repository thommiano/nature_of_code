import processing.sound.*;

// Instantiate oscillator and envelope
TriOsc triOsc;
Env env;

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 0.4;
float sustainLevel = 0.1;
float releaseTime = 0.01;

// This is an octave in MIDI notes.
int[] midiSequence = {
  60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
};

// Set the duration between the notes
int duration = 200;
// Set the note trigger
int trigger = 0;

// An index to count up the notes
int note = 0;

void setup() {
  size(640,360);
  background(255);
  
  // Create triangle wave and envelope
  triOsc = new TriOsc(this);
  env = new Env(this);
}

void draw() {
  
  // If value of trigger is equal to the computer clock and if not all 
  // notes have been played yet, the next note gets triggered.
  if ((millis() > trigger) && (note<midiSequence.length)) {
    
    // midiToFreq transforms the MIDI value into a frequency in Hz whcih we use
    // to control the triangle oscillator with an amplitude of 0.8
    triOsc.play(midiToFreq(midiSequence[note]), 0.8);
    
    // The envelope gets triggered with the oscillator as input and the times and
    // levels we defined earlier
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    
    // Create the new trigger according to predefined durations and speed
    trigger = millis() + duration;
    
    // Advance by one note in the midiSequence;
    note++;
    
    // Loop the sequence
    if (note == 12) {
      note = 0;
    }
  }
}

// This function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}

//float zoff;

//void setup() {
// size(640,360);
// zoff = 0.0;
//}

//void draw() {
  
//  loadPixels();
  
//  float xoff = 0.0;
  
//  for (int x = 0; x < width; x++) {
    
//    float yoff = 0.0; // For every xoff, start yoff at 0.
    
//    for (int y = 0; y < height; y++) {
      
//      float red = map(noise(xoff),0,1,0,255);
//      float blue = map(noise(yoff),0,1,0,255);
//      float green = map(noise(zoff),0,1,0,255);
      
//      float bright = map(noise(xoff,yoff,zoff),0,1,0,255); // Perlin noise brightness
      
//      pixels[x+y*width] = color(red,green,blue); // what is multiplying by width doing here?
      
//      yoff += 0.1;
//    }
//    xoff += 0.1;
//  }
  
//  updatePixels();
  
//  zoff += 0.01;
  
//}