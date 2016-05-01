import java.util.Random;

Random generator;

void setup() {
  size(640,360);
  generator = new Random();
}

void draw() {
  float num = (float) generator.nextGaussian(); // nextGaussian returns a double
  
  float sd = 60;
  float mean = 320;
  
  float x = sd * num + mean;
  
  float red = (float) generator.nextGaussian();
  float red_mean = 127.5;
  float red_sd = 30;
  float r = red * red_sd + red_mean;
  
  //noStroke();
  stroke(200,200,r,10);
  fill(r,200,200,10);
  ellipse(x,180,16,16);
}