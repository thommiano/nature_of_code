
//-----------------------------------------//
// Plaid Lasers Vectors with Mouse Control //
//-----------------------------------------//

// This is a port of the plaid lasers sketch I did in the introduction section,
// this time using vectors. With this one I decided not to go with using pixArr
// since x and y are objects of pixels, and aren't declared. My current rule
// is to use vectors in place of what would otherwise have to be declared independently.

//PVector pixArr;
PVector offset;
PVector rgb;

void setup() {
  size(640,360);
  offset = new PVector(0,0,0);
  rgb = new PVector(0,0,0);
}

void draw() {
  
  //PVector mouse = new PVector(mouseX,mouseY);
  //PVector center = new PVector(width/2,height/2);
  //mouse.sub(center);
  
  //mouse.x.map = map(mouse,0,width,0,.99);
  
  loadPixels();
  
  offset.x = 0.0;
  
  for (int x = 0; x < width; x++) {
    
    offset.y = 0.0;
    
    for (int y = 0; y < height; y++) {
      
      rgb.x = map(noise(offset.x),0,1,0,255); // red
      rgb.y = map(noise(offset.y),0,1,0,255); // blue
      rgb.z = map(noise(offset.z),0,1,0,255); // green
      
      float bright = map(noise(rgb.x,rgb.y,rgb.z),0,1,0,255);
      
      pixels[x+y*width] = color(rgb.x,bright,bright,rgb.y); // The original sketch was like this
      
      offset.y += 0.1;
    }
    offset.x += 0.1;
  }
  
  updatePixels();
  
  offset.z += 0.01;
  
}