/** Perlin Noise Field**/

float inc = 0.1;
float scale = 50;
int rows, cols;

float zoff = 0;

Particle particles[] = new Particle[10000]; 
PVector flowField[];

void setup() {
  background(255);
  size(1280, 720, P2D);
  cols = floor(width/scale)+1;
  rows = floor(height/scale)+1;
  
  flowField = new PVector[rows * cols];
  for (int i = 0 ; i < flowField.length ; i++) {
    flowField[i] = new PVector();
  }
  //println(flowField.length);
  for (int i = 0; i < particles.length ; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  //background(200);
  float yoff = 0;
  for (int x = 0 ; x < cols ; x++) {
    float xoff = 0;
    for (int y = 0; y < rows ; y++) {
      int index = (y*cols + x);
      //noiseDetail(16, 0.6);
      //float r = noise(xoff, yoff) * 255;
      //fill(r);
      //noStroke();
      //rect(x*scale, y*scale, scale, scale);
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.2);
      flowField[index] = v;
      
      //pushMatrix();
      //translate(x * scale, y * scale);
      //rotate(v.heading());
      //stroke(0, 100);
      //strokeWeight(1);
      //line(0, 0, scale, 0);
      //popMatrix();
      
      xoff += inc;
    }
    
    yoff += inc;
    zoff += 0.0004;
  }
  
  for (Particle p : particles) {
    p.follow(flowField);
    p.update();
    p.show();
    p.edges();
    //println(p.pos.x, " ", p.pos.y, "\n");
  }
  
  //particles[0].update();
  //particles[0].show();
}

/** 2-D Perlin Noise **/
/*float start = 0;
float inc = 0.01;
void setup() {
  background(100);
  size(600, 600);
}

void draw() {
  float yoff = start;
  loadPixels();
  for (int x = 0 ; x < width ; x++) {
    float xoff = 0;
    for (int y = 0; y < height ; y++) {
      int index = (y*width + x);
      noiseDetail(16, 0.6);
      float r = noise(xoff, yoff) * 255;
      pixels[index] = color(r, r, r);
      xoff += inc;
    }
    yoff += inc;
  }
  start += inc;
  //println(pixels.length);
  updatePixels();
}*/


/** 1-D Perlin Noise **/

/*float vel = 0.01;
float start = 0;

void setup() {
  background(100);
  size(600, 600);
}

void draw() {
  //translate(0, height/2);
  background(100);
  beginShape();
  noFill();
  float xoff = start;
  start+=vel;
  for (float x = 0 ; x < width ; x++) {
    stroke(255);
    float y = noise(xoff)*height;
    vertex(x, y);
    xoff += vel;
  }
  endShape();
}*/
