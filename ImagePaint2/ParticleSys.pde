class ParticleSys {
  ArrayList <Particle> particles;
  PVector origin;
  PImage img;
  int currentParticles = 0;
  int maxParticles = 10000;
  ParticleSys(PVector position) {
    origin = position.copy();
    particles = new ArrayList <Particle>();
    
  }
  
  void setImage(PImage img) {
    this.img = img;
  }
  
  void addParticle(PVector location) {
    if (currentParticles < maxParticles) {
      particles.add(new Particle(location));
      currentParticles++;
    }
  }
   
  void run() {
    for (int i = particles.size()-1 ; i > 0 ; i--) {
      Particle p = particles.get(i);
      p.setImage(img);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
        currentParticles--;
      }
    }
  }
}
