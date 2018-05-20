PVector pos = new PVector(0, 0);
PVector prev = pos.copy();
PImage img;

void setup() {
  size(600, 600);
  //smooth();
  //strokeWeight(2);
  noStroke();
  //stroke(255, 0, 0);
  img = loadImage("spangled-cotina.jpg");
}

float s = 0;

void draw() {
  //translate(width/2, height);
  //background(255);
  for (float i = 0 ; i < 60 ; i+=0.01) {
    prev = pos.copy();
    pos.x = width/2 + s * (-pow(i,2) + 40*i + 1200)*sin((PI*i)/180);
    pos.y = height -s * (-pow(i,2) + 40*i + 1200)*cos((PI*i)/180);
    color c1 = img.get(int(pos.x), int(pos.y));
    color c2 = img.get(int(width/2-pos.x), int(pos.y));
    println(pos.x, ' ', pos.y, '\n');
    fill(c1);
    ellipse(pos.x, pos.y, 2, 2);
    fill(c2);
    ellipse(-pos.x, pos.y, 2, 2);
    s += 0.000001;
    if (s > 0.5) s = 0;
  }
}
