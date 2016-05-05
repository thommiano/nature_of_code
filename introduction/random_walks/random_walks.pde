class Walker {
  // This is a cookie cutter
  
  float x;
  float y;
  
  // Constructor of cookie. Initialize starting location (x,y)
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  // ---------------------- //
  // Defining functionality
  // ---------------------- //
  
  // Allow the object to display itself
  void display() {
    stroke(5);
    point(x,y);
  }
  
  // Direct the object to take a step
  void step() {
    float r = random(1);
    if (r < 0.4) {
      x++;
    } else if (r < 0.6) {
      x--;
    } else if (r < 0.8) {
      y++;
    } else {
      y--;
    }
  }
}

// Assuming we are looking to model a single random walk,
// we declare one global variable of type Walker
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