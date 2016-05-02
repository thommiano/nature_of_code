void setup() {
 size(640,360);
}

void draw() {
  
  loadPixels();
 
 // Notes: Setting xoff,yoff to random(0.1) will give overall patterns
 
 float xoff = 0.0;
 //float zoff = random(1);
 
 for (int x = 0; x < width; x++) {
  float yoff = 0.0; // For every xoff, start yoff at 0.
  
  for (int y = 0; y < height; y++) {
    
    
    //float bright = random(255); // a random brightness
    float bright = map(noise(xoff,yoff),0,1,0,255); // Perlin noise brightness
    pixels[x+y*width] = color(bright); // what is multiplying by width doing here?

    yoff += 0.1;
  }
  xoff += 0.1;
 }
 updatePixels();


 
 //for (int x = 0; x < width; x++) {

 // for (int y = 0; y < height; y++) {
 //   float bright = random(255); // a random brightness
 //   pixels[x+y*width] = color(bright);
 // }
 //}
 //updatePixels();


}