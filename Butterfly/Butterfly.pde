void setup() {
  size(600, 600);
  strokeWeight(3);
}

float s = 0;

void draw() {
  background(255);
  translate(width/2 , height/2);
  for (float a = -PI/2 ; a < PI/2 ; a += 0.1 ) {
    float x = s * cos(a);
    float y = s * sin(a);
    point(x, y);
  }
  s += 0.1;
}
