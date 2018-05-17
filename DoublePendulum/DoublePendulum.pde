Pendulum pendulum1;
Pendulum pendulum2;

float g = 1.8;

float prevX = -1;
float prevY = -1;

float transX = 0;
float transY = 0;

float c = 0;

PGraphics canvas;

void setup() {
  size(800, 800);
  transX = width/2;
  transY = height/4+40;
  background(255);
  pendulum1 = new Pendulum();
  pendulum1.pivot = new PVector(0, 0);
  pendulum2 = new Pendulum();
  pendulum1.theta = PI/2;
  pendulum2.theta = PI/2;
  pendulum1.m = 20;
  pendulum2.m = 30;
  colorMode(HSB);
  canvas = createGraphics(800, 800);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  
  //background(255);
  image(canvas, 0, 0);
  translate(transX, transY);
  pendulum1.run();
  pendulum2.pivot = pendulum1.position;
  pendulum2.run();
  
  // Set the Pendulum's Acceleration
  pendulum1.aAcc = calcAcc1(pendulum1.m, pendulum2.m, pendulum1.theta, pendulum2.theta, pendulum1.threadLength, pendulum2.threadLength, pendulum1.aVel, pendulum2.aVel);
  pendulum2.aAcc = calcAcc2(pendulum1.m, pendulum2.m, pendulum1.theta, pendulum2.theta, pendulum1.threadLength, pendulum2.threadLength, pendulum1.aVel, pendulum2.aVel);
  
  
  pendulum1.update();
  pendulum2.update();
  
  canvas.beginDraw();
  canvas.translate(transX, transY);
  canvas.stroke(0);
  //canvas.strokeWeight(2);
  //canvas.beginShape();
  if (prevX != -1) {
    canvas.colorMode(HSB);
    canvas.stroke(c, 255, 255);
    canvas.line(prevX, prevY, pendulum2.position.x, pendulum2.position.y);
    //canvas.stroke(c, 255, 255);
    
    if(c > 255) c = 0;
  }
  //canvas.point(pendulum2.position.x, pendulum2.position.y);
  //canvas.endShape();
  canvas.endDraw();
  
  c += 0.1;
  
  prevX = pendulum2.position.x;
  prevY = pendulum2.position.y;
}

float calcAcc1(float m1, float m2, float a1, float a2, float r1, float r2, float v1, float v2) {
  float acc1 = 0;
  float num1 = -g*(2*m1+m2)*sin(a1);
  float num2 = -m2*g*sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2*(v2*v2*r2+v1*v1*r1*cos(a1-a2));
  float den = r1*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  acc1 = (num1+num2+num3)/den;
  return acc1;
}

float calcAcc2(float m1, float m2, float a1, float a2, float r1, float r2, float v1, float v2) {
  float acc2 = 0;
  float num1 = 2*sin(a1-a2);
  float num2 = v1*v1*r1*(m1+m2);
  float num3 = g*(m1+m2)*cos(a1);
  float num4 = v2*v2*r2*m2*cos(a1-a2);
  float den = r2*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  acc2 = (num1*(num2+num3+num4)) / den;
  return acc2;
}
