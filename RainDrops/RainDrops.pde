PImage cat;

Drop[] drops = new Drop[4000];
Drop[] drops2 = new Drop[4000];
Drop[] drops3 = new Drop[4000];
void setup() {
  size(640, 640);
  cat = loadImage("pp.jpg");
  for (int i = 0 ; i < drops.length ; i++) {
    drops[i] = new Drop(cat);
    drops2[i] = new Drop(cat);
    drops3[i] = new Drop(cat);
  }
}

void draw() {
  background(230, 230, 250);
  smooth();
  for (int i = 0 ; i < drops.length ; i++) {
    drops[i].fall();
    drops[i].show();
    drops2[i].fall();
    drops2[i].show();
    drops3[i].fall();
    drops3[i].show();
  }
}
