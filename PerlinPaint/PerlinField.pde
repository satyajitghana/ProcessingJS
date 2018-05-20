class PerlinField {
  ArrayList <Particle> particles;
  int scale = 40;
  PVector flowField[];
  int rows, cols;  
  float forceMag = 3;
  
  PerlinField(int numberOfParticles) {
    particles = new ArrayList <Particle>();
    // comment out this if mouse is being used to add the particles
    for (int i = 0 ; i < numberOfParticles ; i++) particles.add(new Particle(new PVector(random(width), random(height))));
    cols = floor(width/scale) + 1;
    rows = floor(height/scale) + 1;
    println(rows, ' ', cols, '\n');
    flowField = new PVector[rows * cols];
    //println(flowField.length);
    for (int i = 0 ; i < flowField.length ; i++) {
      flowField[i] = new PVector(0, 0);
    }
  }
  
  float zoff = 0.01;
  float inc = 0.1;
  
  void update() {
    float yoff = 0;
    for (int x = 0 ; x < cols ; x++) {
      float xoff = 0;
      for (int y = 0 ; y < rows ; y++) {
        int index = y * cols + x;
        float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
        PVector v = PVector.fromAngle(angle);
        v.setMag(forceMag);
        flowField[index] = v;
        xoff += inc;
      }
      yoff += inc;
    }
    zoff += 0.01;
  }
  
  void showField() {
    for (int x = 0 ; x < cols ; x++) {
      for (int y = 0 ; y < rows ; y++) {
        int index = y * cols + x;
        pushMatrix();
        translate(x * scale, y * scale);
        rotate(flowField[index].heading());
        stroke(0, 100);
        strokeWeight(1);
        line(0, 0, scale, 0);
        popMatrix();
      }
    }
  }
  
  void show() {
    for (int i = 0 ; i < particles.size() - 1 ; i++) {
      particles.get(i).update();
      particles.get(i).show();
      particles.get(i).checkEdge();
      int index = floor(particles.get(i).pos.y/scale)*cols + floor(particles.get(i).pos.x/scale);
      try {
      particles.get(i).applyForce(flowField[index]);
      } catch(Exception e) { println(particles.get(i).pos.x, ' ', particles.get(i).pos.y, '\n'); }

      if (particles.get(i).isDead()) {
        particles.remove(i);
        // If dead don't add that particle
        particles.add(new Particle(new PVector(random(width), random(height))));
      }
    }
  }
}
