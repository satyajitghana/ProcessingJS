ArrayList<PVector> seeds;

PVector current;
int prev;

int curr = 0;
float percent = 0.5;
int n = 5;

void setup() {
  size(1000, 1000, P2D);
    
  // fullScreen(P2D);
    
  seeds = new ArrayList<PVector>();  
    
  for (int i = 0 ; i < n ; i++) {
    float theta = i * (TWO_PI / n);
    PVector toAdd = PVector.fromAngle(theta);
    toAdd.mult(width*0.3);
    toAdd.add(width/2, height/2);
    seeds.add(toAdd);
  }
  
  reset();
  
}

void reset() {
  background(0);
  strokeWeight(8);
  stroke(234, 32, 39, 200);
  current = new PVector(random(width), random(height));
  for (PVector p : seeds) {
    point(p.x, p.y);
  }
}

void draw() {
  
  for (int i = 0 ; i < 1000 ; i++) {
    strokeWeight(1);
    
    int next = floor(random(seeds.size()));
    
    if (next != prev) {
      current.lerp(seeds.get(next), percent);
      point(current.x, current.y);
    }
    
    prev = next;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    n++;
  } else {
    n--;    
  }
  setup();
}

void keyPressed() {
  if (key == 'n') {
    n++;
    setup();
  } else if (key == 'p') {
    n--;
    setup();
  }
}
