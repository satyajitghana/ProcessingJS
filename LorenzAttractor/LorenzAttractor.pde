float rho = 28f;
float sigma = 10f;
float beta = 8.f/3;

float x = 10;
float y = 10;
float z = 10;

ArrayList <PVector> points = new ArrayList <PVector>();

void setup() {
  size(640, 640, P3D);
  colorMode(HSB);
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  scale(5);
  //for (int i = 0 ; i < 100 ; i++) {
  float dt = 0.01;
  float dx = (sigma * (y - x)) * dt;
  float dy = (x * (rho - z) - y) * dt;
  float dz = (x * y - beta * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  //stroke(0);
  points.add(new PVector(x, y, z));
  noFill();
  beginShape();
  float hue = 0;
  for (PVector v : points) {
    vertex(v.x, v.y, v.z);
    stroke(hue, 255, 255);
    hue += 0.1;
    if (hue > 255) hue = 0;
  }
  endShape();
  //}
  //println(x, y, z);
  //point(x, y, z);
  
}
