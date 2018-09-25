class Butterfly {
  public PVector pos;
  PVector prevPos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  public PShape butterfly;
  float lifespan = random(400, 800);
  float wings = random(40, 48);
  float angle = -PI/2;
  color c;
  color[] colors = {#3498db, #2ecc71, #9b59b6, #f1c40f, #e67e22, #e74c3c, #d35400, #FD7272, #B33771, #EA2027, #EE5A24, #1289A7};
  public Butterfly() {
    butterfly = loadShape("butterfly.svg");
    //butterfly.setFill(color(255, 0, 0));
    pos = new PVector(random(width), random(height));
    prevPos = pos.copy();
    //c = color(random(255), random(255), random(255));
    c = colors[floor(random(colors.length))];  
  }
  
  public void checkEdge() {
    if (pos.x > width) {pos.x = 0; prevPos.x = 0;}
    if (pos.x < 0) {pos.x = width; prevPos.x = width;}
    if (pos.y > height) {pos.y = 0; prevPos.y = 0;}
    if (pos.y < 0) {pos.y = height; prevPos.y = height;}
  }
  
  public void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.limit(2  );
    lifespan -= random(0, 5);
    angle += random(0, 0.1);
    if (angle > PI/2) angle = -PI/2;
  }
  
  public void applyForce(PVector f) {
    acc.add(f);
  }
  
  public void show() {
    //line(prevPos.x, prevPos.y, pos.x, pos.y);
    //prevPos = pos.copy();
    //fill(c);
    //ellipse(pos.x, pos.y, 5, 5);
    butterfly.setFill(c);
    //butterfly.setFill(color(255, 0 ,0));
    //butterfly.rotate(0.01);
    flies.shape(butterfly, pos.x, pos.y, (2+wings*cos(angle))*0.6, (50)*0.6);
  }
}
