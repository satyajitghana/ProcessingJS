class Drop {
  float x = random(width);
  float y = random(-1000, 500);
  float z = random(0, 20);
  float size = map(z, 0, 20, 2, 10);
  float yspeed = map(z, 0, 20, 1, 3);
  color c;
  PImage img;
  
  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0.05, 0.2);
    yspeed = yspeed + grav;
    if (y > height) {
      y = 0;
      yspeed = map(z, 0, 20, 1, 3);
    }
   
  }
  
  void show() {
    c = img.get(int(x), int(y));
    noStroke();
    fill(c);
    ellipse(x, y, size, size);
  }
  
  Drop(PImage image) {
    img = image;
  }
}
