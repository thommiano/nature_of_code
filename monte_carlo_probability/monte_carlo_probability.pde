float montecarlo() {
  // We do this “forever” until we find a qualifying random value.
  while (true) {
    // Pick a random value.
    float r1 = random(0, width);
    // Assign a probability.
    float probability = r1;
    // Pick a second random value.
    float r2 = random(1, width);

    //[full] Does it qualify?  If so, we’re done!
    if (r2 < probability) {
      return r1;
    }
  }
}

class Walker {
    
  float x;
  float y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    //noStroke();
    stroke(255);
    fill(155,200,200,10);
    ellipse(x,y,32,32);
    //stroke(0);
    //point(x,y);
  }
  
  //void step() {
  //  x = y - montecarlo();
  //  y = x + montecarlo();
  //}
  
    void step() {
    x = montecarlo();
    y = montecarlo();
  }
  
}

Walker w;

void setup() {
  size(640,360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}