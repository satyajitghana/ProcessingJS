PerlinField pField;
PImage img;
PGraphics mouse;
void setup() {
  size(640, 640);
  background(255);
  pField = new PerlinField(1000);
  img = loadImage("pp.jpg");
  mouse = createGraphics(640, 640);
}

void draw() {
  //background(255);
  image(mouse, 0, 0);
  pField.show();
  pField.update();
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
