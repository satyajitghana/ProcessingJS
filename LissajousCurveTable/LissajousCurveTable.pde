float angle = 0;
int w = 80;
int cols;
int rows;

Curve[][] curves;

void setup() {
  size(1200, 800, P2D);
  // fullScreen(P2D);
    
  cols = width / w - 1;
  rows = height / w - 1;

  curves = new Curve[rows][cols];
  
  for (int j = 0 ; j < rows ; j++) {
    for (int i = 0 ; i < cols; i++) {
      curves[j][i] = new Curve();
    }
  }
}

void draw() {
  background(0);
  float d = w - 0.2*w;
  float r = d/2;

  for (int i = 0 ; i < cols ; i++) {
    float cx = w + i * w + w / 2;
    float cy = w / 2;
    
    strokeWeight(2);
    stroke(255);
    ellipse(cx, cy, d, d);
    
    float x = r * cos(angle*(i+1) - HALF_PI);
    float y = r * sin(angle*(i+1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(cx + x, 0, cx + x, height);
    
    for (int j = 0 ; j < rows ; j++) {
      curves[j][i].setX(cx + x);
    }
    
  }
  
  for (int j = 0 ; j < rows ; j++) {
    float cx = w / 2;
    float cy = w + j * w + w / 2;
    
    strokeWeight(2);
    stroke(255);
    ellipse(cx, cy, d, d);
    
    float x = r * cos(angle*(j+1) - HALF_PI);
    float y = r * sin(angle*(j+1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy + y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(0, cy + y, width, cy +y);
    
    for (int i = 0 ; i < cols ; i++) {
      curves[j][i].setY(cy + y);
    }
  }
  
  for (int j = 0 ; j < rows ; j++) {
    for (int i = 0 ; i < cols; i++) {
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }
  
  angle -= 0.01;
  
  if (angle < -TWO_PI) {
    for (int j = 0 ; j < rows ; j++) {
      for (int i = 0 ; i < cols; i++) {
        curves[j][i].reset();
      }
    }
    angle = 0;
  }
  
}
