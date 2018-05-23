PGraphics canvas;

void setup() {
  size(600, 600);
  canvas = createGraphics(600, 600);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

float start = 0;
//time dimension
float yoff = 0;
float wing = 100;

void draw() {
  image(canvas, 0, 0);
  //background(68, 217, 230);
  float r;
  stroke(153, 17, 85, 100);
  fill(255, 29, 142);
  strokeWeight(1);
  translate(width/2 , height/2);
  rotate(PI/2);
  float da  = PI/100;
  float dx = 0.05;
  //start = random(0.1, 1);
  float xoff = start;
 
  float flap = map(sin(yoff), 0, 1, 0.3, 1);
 
  beginShape();
  for (float a = -PI/2 ; a <= PI/2 ; a += da ) {
    float n = noise(xoff, yoff);
    r = sin(2*a)*map(n, 0, 1, 100, 300);
    float x = r * cos(a);
    
    float y = flap * r * sin(a);
    xoff += dx;
    vertex(x, y);
  }
  //endShape();
  
  //xoff = start;
  //beginShape();
  for (float a = PI/2 ; a <= 3*PI/2 ; a += da ) {
    float n = noise(xoff, yoff);
    r = sin(2*a)*map(n, 0, 1, 100, 300);
    float x = r * cos(a);
    float y = flap * r * sin(a);
    xoff -= dx;
    vertex(x, y);
  }
  endShape();
  
  yoff += dx; 
  
  canvas.beginDraw();
  canvas.background(68, 217, 230);
  canvas.textSize(20);
  canvas.fill(0, 121, 191);
  canvas.text("Satyajit Ghana", 420, 550);
  canvas.endDraw();
}
