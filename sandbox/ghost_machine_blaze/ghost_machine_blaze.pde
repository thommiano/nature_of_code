float zoff;

void setup() {
 size(640,360);
 zoff = 0.0;
}

void draw() {
  
  loadPixels();
  
  float xoff = 0.0;
  
  for (int x = 0; x < width; x++) {
    
    float yoff = 0.1; // For every xoff, start yoff at 0.
    
    for (int y = 0; y < height; y++) {
      
      float red = map(noise(xoff),0,1,0,255);
      float blue = map(noise(yoff),0,1,0,255);
      float green = map(noise(zoff),0,1,0,255);
      
      float bright = map(noise(xoff,yoff,zoff),0,1,0,255); // Perlin noise brightness
      
      pixels[x+y*width] = color(red,bright,bright,blue); // what is multiplying by width doing here?
      
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  
  updatePixels();
  
  zoff += noise(0.5); // controls speed of changes for exposure
  
}