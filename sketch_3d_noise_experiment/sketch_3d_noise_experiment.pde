float zoff;
float xoff;

void setup() {
  frameRate(120);
  size(640,360);
  //fullScreen();
  zoff = 0.0;
  xoff = 0.0;
}

void draw() {
  
  loadPixels();
  
  //float xoff = 0.0;
  
  for (int x = 0; x < width; x++) {
    
    float yoff = 0.0; // For every xoff, start yoff at 0.
    
    for (int y = 0; y < height; y++) {
      
      float red = map(noise(xoff),0,1,0,255);
      float blue = map(noise(yoff),0,1,0,255);
      float green = map(noise(zoff),0,1,0,255);
      
      float bright = map(noise(xoff,yoff,zoff),0,1,0,255);
      
      pixels[x+y*width] = color(blue,red,bright,green);
      
      yoff += 0.01; 
    }
    xoff += 0.01;
  }
  
  updatePixels();
  
  zoff += 0.1;
  
}