float x = 10;
float y = 10;
float z = 10;
float dt;
float b = 1;

void setup() {
  size(640, 640, P3D);
}

void draw() {
  translate(width/2, height/2);
  scale(5);
  for (int i = 0 ; i < 1000 ; i++) {
  dt = 0.1f;
  float dx = (sin(y) - b * x) * dt;
  float dy = (sin(z) - b * y) * dt;
  float dz = (sin(x) - b * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  point(x, y, z);
}
}
