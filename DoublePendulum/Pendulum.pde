class Pendulum {
  PVector pivot;
  PVector position;
  float threadLength;
  float aAcc;
  float aVel;
  float gravity;
  float theta;
  float m;
  
  Pendulum() {
    pivot = new PVector(0, 0);
    threadLength = 160;
    position = new PVector(0, threadLength);
    theta = 0;
  }
  void run() {
    position.x = pivot.x + threadLength * sin(theta);
    position.y = pivot.y + threadLength * cos(theta);
    line(pivot.x, pivot.y, position.x, position.y);
    //println('[',pivot.x, pivot.y, position.x, position.y, ']');
    fill(0);
    ellipse(position.x, position.y, 16, 16);
  }
  
  void update() {
    aVel += aAcc;
    theta += aVel;
  }
}
