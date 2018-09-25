PShape img;

void setup() {
  size(800, 800);
  img = loadShape("balloon.svg");
  img.scale(0.5);
  //background(183, 250, 240);
  background(255);
  smooth();
}

void draw() {
  shape(img, 400, 400);
}
