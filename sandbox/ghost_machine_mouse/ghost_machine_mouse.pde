float zoff;
float xoff;
float mouseXmap;
float mouseYmap;
 
void setup() {
 size(640,360);
 zoff = 0.0;
 xoff = 0.0;

}

void draw() {
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center); // This allows the line to follow the mouse 360*
  
  mouseXmap = map(mouseX,0,width,0,1);
  mouseYmap = map(mouseY,0,height,0,1);
  
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    
    float yoff = 0; // For every xoff, start yoff at 0.
    
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
  
  zoff += 0.01; // controls speed of changes for exposure
  
}