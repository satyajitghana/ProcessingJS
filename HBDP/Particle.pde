class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage img;
  float z = random(0, 20);
  float radius = map(z, 0, 20, 1, 3);
  
  Particle(PVector location) {
    //float accVal = 0.1;
    float accVal = map(z, 0, 20, 0.02,0.05);
    acceleration = new PVector(random(-accVal, accVal), random(-accVal, accVal));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = new PVector(location.x, location.y);
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
    //lifespan -= 1.0;
    lifespan -= 1.0;
    radius -=0.02;
    if (radius < 0) {
      radius = 0;
      lifespan = -1;
    }
    if (position.x > width-radius || position.x < radius) {
      velocity.x = -velocity.x;
    }
    
    if (position.y > height-radius || position.y < radius) {
      velocity.y = -velocity.y;
    }
  }
  
  void show() {
    but.noStroke();
    color c = img.get(int(position.x), int(position.y));
    but.fill(c, lifespan);
    but.ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) return true;
    else return false;
  }
}
