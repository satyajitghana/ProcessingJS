/* @pjs preload="pp.jpg"; */

class Particle {
  PVector pos = new PVector(0, 0);
  PVector prev = new PVector(0, 0);
  //PVector vel = new PVector(random(-0.3, 0.3), random(-0.3, 0.3));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float size = random(3);
  float lifetime = random(500);
  float velLimit = 2;
  
  Particle(PVector pos) {
    this.pos = pos;
  }

  /*Particle newParticle(float x, float y) {
   return new Particle(new PVector(x, y));
   }*/

  void show() {
    //noStroke();
    //fill(200, 0, 100, lifetime);
    color c = img.get(int(pos.x), int(pos.y));
    //stroke(c, lifetime);
    //line(prev.x, prev.y, pos.x, pos.y);
    //fill(c, lifetime);
    //ellipse(pos.x, pos.y, size, size);
    float alpha = map(lifetime, 0, 500, 0, 200);
    perlinDraw.stroke(c, alpha);
    perlinDraw.line(prev.x, prev.y, pos.x, pos.y);
  }

  void update() {
    //acc = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    vel.add(acc);
    //prev = pos.copy();
    prev.x = pos.x;
    prev.y = pos.y;
    pos.add(vel);
    vel.limit(velLimit);
    acc.mult(0);
    lifetime--;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void checkEdge() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;    
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }

  boolean isDead() {
    if (lifetime < 0) return true;
    return false;
  }
}
