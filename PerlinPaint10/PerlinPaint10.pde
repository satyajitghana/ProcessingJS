/* @pjs preload="10_1920x1080.jpg"; */

PerlinField pField;
PImage img;
PGraphics mouse;
PGraphics perlinDraw;

void setup() {
  size(1920, 1080, P2D);
  background(255);
  img = loadImage("10_1920x1080.jpg");
  pField = new PerlinField(5000);
  //mouse = createGraphics(640, 640);
  //perlinDraw = createGraphics(img.width, img.height);
  perlinDraw = createGraphics(1920, 1080);
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
  //saveFrame("output/10-######");
}
