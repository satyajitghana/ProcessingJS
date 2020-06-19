/* @pjs preload="pp.jpg"; */

PerlinField pField;
PImage img;
PGraphics mouse;
PGraphics perlinDraw;

void setup() {
  img = loadImage("pp.jpg");
  size(img.width, img.height);
  background(255);
  pField = new PerlinField(1000);
  //mouse = createGraphics(640, 640);
  perlinDraw = createGraphics(img.width, img.height);
  perlinDraw.beginDraw();
  perlinDraw.background(255);
  perlinDraw.smooth();
  perlinDraw.endDraw();
}

void draw() {
  //background(255);
  //pField.show();
  //pField.update();
  //image(img, 0, 0);
  perlinDraw.beginDraw();
  pField.show();
  pField.update();
  perlinDraw.endDraw();
  image(perlinDraw, 0, 0);
  
  if (mousePressed) {
    //for (int i = 0 ; i < 10 ; i++)
    //pField.particles.add(new Particle(new PVector(random(mouseX - 5, mouseX + 5), random(mouseY - 5, mouseY + 5))));
  } 
  //pField.showField();
  //mouse.beginDraw();
  /*mouse.background(255);
  mouse.noStroke();
  mouse.fill(50, 0, 150, 20);
  mouse.ellipse(mouseX, mouseY, 20, 20);
  mouse.endDraw();*/
}
