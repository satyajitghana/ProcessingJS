/* @pjs preload=spangled-cotina.jpg*/

PImage cat;

void setup() {
	size(1280, 720);
  cat = loadImage("spangled-cotina.jpg");
  background(0);
  smooth();
}

void draw() {
  //background(0);
  for (int i = 0 ; i < 500 ; i++) {
    float size = map(mouseX, 0, width, 2, 18);
    float x = random(width);
    float y = random(height);
    color c = cat.get(int(x), int(y));
    fill(c);
    noStroke();
    ellipse(x, y, size, size);
  }
}
