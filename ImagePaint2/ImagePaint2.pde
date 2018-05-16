PImage img;
ParticleSys ps;
boolean recording = false;
boolean start = false;

void setup() {
  //size(1280, 720);
  img = loadImage("pp.jpg");
  //img.resize(325, 500);
  size(640, 640);
  surface.setResizable(true);
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
  if (mousePressed == true) {
    //float x = random(width);
    //float y = random(height);
    float x = mouseX;
    float y = mouseY;
    ps.addParticle(new PVector(x, y));
    //ps.run();
  }
  ps.run();
  if (recording) {
    saveFrame("output/bird####.png");
  }
}
