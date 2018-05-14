PImage img;
ParticleSys ps;
boolean recording = false;
boolean start = false;

void setup() {
  size(1280, 720);
  img = loadImage("spangled-cotina.jpg");
  background(0);
  smooth();
  ps = new ParticleSys(new PVector(width/2, height/2));
  ps.setImage(img);
}

void draw() {
  //background(0);
  //image(img, 0, 0);
  if (keyPressed) {
    if (key == 'r') {
      start = true;
    }
  }
  if (start) {
    float x = random(width);
    float y = random(height);
    ps.addParticle(new PVector(x, y));
    ps.run();
  }
  if (recording) {
    saveFrame("output/bird####.png");
  }
}
