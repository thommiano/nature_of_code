class Walker {
  // This is a cookie cutter
  
  float x;
  float y;
  int color_y_map;
  
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
    
    stroke(255,255,255,50);
    //point(x,y);
    fill(170,y,205,80);
    ellipse(x,y,5,5);
    
    //stroke(170,y,x,80);
    //line(x,y,x+5,y+5);
    //line(width/2,height/2,x,y);
  }
  
  float montecarlo() {
    while(true) {
      
      float r1 = random(1);
      float probability = pow(r1,2); // value between 0 and 1
      
      float r2 = random(1);
      if (r2 < probability) {
        return r1;
      }
    }
  }
  
  void step() {
      
    //float stepsize = random(0,10); // A uniform distrubution of step changes
    float stepsize = montecarlo();
    
    float stepx = random(-stepsize,stepsize);
    float stepy = random(-stepsize,stepsize);
    
    x += stepx;
    y += stepy;

    //color_y_map = (int(y) / int(640)) * 255;
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