/** 2-D Perlin Noise **/
float start = 0;
float inc = 0.01;
void setup() {
  background(100);
  size(600, 600, P2D);
}

void draw() {
  float yoff = start;
  loadPixels();
  for (int x = 0 ; x < width ; x++) {
    float xoff = 0;
    for (int y = 0; y < height ; y++) {
      int index = (y*width + x);
      //noiseDetail(16, 0.2);
      float r = noise(xoff, yoff) * 255;
      pixels[index] = color(r, r, r);
      xoff += inc;
    }
    yoff += inc;
  }
  start += inc;
  //println(pixels.length);
  updatePixels();
}


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
