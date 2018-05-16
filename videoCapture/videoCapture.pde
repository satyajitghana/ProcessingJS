import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
  background(0);
}

void mousePressed() {
  //video.read();
  //saveFrame("/capture/image####.png");
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  //background(0);
  //image(video, 0, 0);
  for (int i = 0; i < 10000; i++) { 
    float x = random(width);
    float y = random(height);
    color c = video.get(int(x), int(y));
    fill(c);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}
