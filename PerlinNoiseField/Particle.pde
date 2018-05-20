class Particle {
  PVector pos = new PVector(random(width), random(height));
  //PVector vel = new PVector(random(-0.3, 0.3), random(-0.3, 0.3));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector prev = pos.copy();
  float maxVel = 2;
  
  void update() {
    vel.add(acc);
    vel.limit(maxVel);
    prev = pos.copy();
    pos.add(vel);
    acc.mult(0);
    //acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void show() {
    stroke(0, 1);
    strokeWeight(1);
    //point(pos.x, pos.y);
    line(pos.x, pos.y, prev.x, prev.y);
  }
  
  void edges() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
  
  void follow(PVector[] flowField) {
    int x = floor(pos.x / scale);
    int y = floor(pos.y / scale);
    int index = y * cols + x;
    /*if (index >= 400) {
      //println(pos.x, pos.y, x, y);
      //ellipse(pos.x, pos.y, 100, 100);
    }
    else {*/
    PVector force = flowField[index];
    applyForce(force);
    //}
  }
}
