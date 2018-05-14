PImage img;
ParticleSys ps;
void setup() {
  size(1280, 720);
  img = loadImage("ss.jpg");
  background(0);
  smooth();
  ps = new ParticleSys(new PVector(width/2, height/2));
  ps.setImage(img);
}

void draw() {
  //image(img, 0, 0);
  float x = random(width);
  float y = random(height);
  ps.addParticle(new PVector(x, y));
  ps.run();
}
