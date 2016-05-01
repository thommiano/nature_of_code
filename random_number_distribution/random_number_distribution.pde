int [] randomCounts; // An array to keep track of how often random numbers are picked

void setup() {
  size (640,240);
  randomCounts = new int[20]; // number of possible values in array (i.e., length)
}

void draw() {
  background (255);
  
  int index = int(random(randomCounts.length)); // Pick a random number
  randomCounts[index]++; // increment
  
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  
  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);
  }
}