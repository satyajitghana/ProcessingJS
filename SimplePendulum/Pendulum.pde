float gravity = 0.01;

class Pendulum {
  PVector pivot;
  float threadLength;
  float sphereRadius;
  
  float angle;
  float acc;
  float vel;
  
  Pendulum() {
    angle = PI/2;
    pivot = new PVector(0, 0);
    acc = 0.05;
    threadLength = height/2;
    sphereRadius = 25;
  }
  
  void update() {
    acc = -sqrt(gravity / threadLength) * sin(angle);
    //acc = -pow(vel, 2) * threadLength *sin(angle);
    //acc = (-gravity / threadLength) * sin(angle);
    vel += acc;
    angle += vel;
  }
  
  void draw() {
    float x = sin(angle) * threadLength;
    float y = cos(angle) * threadLength;
    
    //noStroke();
    fill(0);
    ellipse(x, y, sphereRadius * 2, sphereRadius * 2);
    ellipse(pivot.x, pivot.y, 6, 6);
    line(pivot.x, pivot.y, x, y);
  }
}
