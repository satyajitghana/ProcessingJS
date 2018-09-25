function Vehicle(x, y) {
  this.pos = createVector(random(width), random(height));
  this.target = createVector(x, y);
  this.vel = p5.Vector.random2D();
  this.acc = createVector();
  this.r = 6;
  this.maxspeed = 3;
  this.maxforce = 0.3;
  this.hue = random(255);
  this.xoff = 0;
  this.yoff = random(0, 255);
}

Vehicle.prototype.behaviour = function() {
  var arrive = this.arrive(this.target);
  this.applyForce(arrive);
  
  if (mouseIsPressed) {
    var mouse = createVector(mouseX, mouseY);
    var flee = this.flee(mouse);
    this.applyForce(flee);
  }
}

Vehicle.prototype.applyForce = function(f) {
  this.acc.add(f);
}

Vehicle.prototype.update = function() {
  this.pos.add(this.vel);
  this.vel.add(this.acc);
  this.acc.mult(0);
  this.xoff += 0.1;
  this.yoff += 0.1;
}

Vehicle.prototype.show = function() {
  var n = map(noise(this.xoff, this.yoff), 0, 1, 0, 255);
  fill(this.hue, n, 255);
  ellipse(this.pos.x, this.pos.y, this.r, this.r);
}

Vehicle.prototype.arrive = function(target) {
  var desired = p5.Vector.sub(target, this.pos);
  var dist = desired.mag();
  var speed = this.maxspeed;
  if (dist < 100) {
    speed = map(dist, 0, 100, 0, this.maxspeed);
  }
  desired.setMag(speed);
  var steer = p5.Vector.sub(desired, this.vel);
  steer.limit(this.maxforce);
  
  return steer;
}

Vehicle.prototype.flee = function(target) {
  var desired = p5.Vector.sub(target, this.pos);
  var dist = desired.mag();
  //if (dist < 50) {
    desired.setMag(2*this.maxspeed);
    desired.mult(-1);
  //}
  //else desired.mult(0);
  var steer = p5.Vector.sub(desired, this.vel);
  steer.limit(2*this.maxforce);
  
  return steer;
}
