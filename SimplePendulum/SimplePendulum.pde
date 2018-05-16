Pendulum p;

void setup() {
  size(640, 480);
  background(255);
  p = new Pendulum();
}

void draw() {
  background(255);
  translate(width/2, height/4);
  p.update();
  p.draw();
}
