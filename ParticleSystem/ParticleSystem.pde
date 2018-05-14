ParticleSys ps;

void setup() {
  size(640, 320);
  ps = new ParticleSys(new PVector(width/2, 50));
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
}
