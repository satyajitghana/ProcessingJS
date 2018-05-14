class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage img;
  float radius = 4;  
  
  Particle(PVector l) {
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = l.copy();
    lifespan = 255.0;
  } 
  
  void run() {
    update();
    show();
  }
  
  void setImage(PImage img) {
    this.img = img;
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
    
    if (position.x > width-radius || position.x < radius) {
      velocity.x = -velocity.x;
    }
    
    if (position.y > height-radius || position.y < radius) {
      velocity.y = -velocity.y;
    }
  }
  
  void show() {
    noStroke();
    color c = img.get(int(position.x), int(position.y));
    fill(c, lifespan);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) return true;
    else return false;
  }
}
