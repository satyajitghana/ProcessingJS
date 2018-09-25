int scale = 20;
int rows, cols;
int maxButterflies = 10;
FlowField flowField;
PImage img;
ParticleSys ps;
PGraphics but;
PGraphics flies;
ArrayList<Butterfly> butterflies = new ArrayList<Butterfly>();

void setup() {
  //size(800, 800, P2D);
  img = loadImage("pp.jpg");
  //fullScreen(P2D);
  //size(1280, 720, P2D);
  but = createGraphics(640, 640);
  flies = createGraphics(640, 640);
  size(640, 640, P2D);
  smooth(32);
  //colorMode(HSB);
  flowField = new FlowField(scale);
  ps = new ParticleSys(new PVector(width/2, height/2));
  ps.setImage(img);
}
void draw() {
  flies.beginDraw();
  but.beginDraw();
  flies.background(255);
  flowField.createField();
  while(butterflies.size() <= maxButterflies) butterflies.add(new Butterfly());
  // get the pos, find the vector at that pos, apply that force
  for(int i = 0 ; i < butterflies.size(); i++) {
    butterflies.get(i).checkEdge();
    int x = floor(butterflies.get(i).pos.x)/scale; int y = floor(butterflies.get(i).pos.y)/scale;
    butterflies.get(i).applyForce(flowField.flowField[x][y]);
    //butterflies.get(i).butterfly.rotate(map(flowField.flowField[x][y].mag(), 0, 0.5, -PI/256, PI/256));
    if (butterflies.get(i).lifespan < 0) {
      ps.addParticle(new PVector(butterflies.get(i).pos.x, butterflies.get(i).pos.y));
      butterflies.remove(i);
    }
  }
  updateShow();
  but.endDraw();
  flies.endDraw();
  
  image(flies, 0, 0);image(but, 0, 0);
}

void updateShow() {
  for(Butterfly b : butterflies) {
    b.update();
    b.show();
  }
  ps.run();
  flowField.update();
}

/*To View the flow field in vector*/
//void setup() {
  //size(1500, 900, P2D);
  //fullScreen(P2D);
  //noiseDetail(10);
  //println(height, " ", width);
  //loadPixels();
  //println(pixels.length);
  //smooth(8);
//  background(0);
//  colorMode(HSB);
//  flowField = new FlowField(scale);
//}
//void draw() {
//  flowField.createField();
//  for (int i = 0; i < flowField.flowField.length; i++) {
//    for (int j = 0; j < flowField.flowField[0].length ; j++) {
//      float angle = map(flowField.flowField[i][j], 0, 1, -TWO_PI, TWO_PI);
//      PVector ff = PVector.fromAngle(angle);
//      ff.setMag(scale);
//      pushMatrix();
//        translate(i*scale, j*scale);
//        float st = map(angle, -TWO_PI, TWO_PI, 0, 255);
//        stroke(st, 255, 255);
//        line(0, 0, ff.x, ff.y);
//      popMatrix();
//    }
//  }
//  flowField.update();
//}
