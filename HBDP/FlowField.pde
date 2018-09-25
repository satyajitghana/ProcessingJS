class FlowField {
  private float zoff, xoff, yoff;
  
  public PVector flowField[][];
  public static final float inc = 0.01;
  
  public FlowField(int scale) {
    flowField = new PVector[(width/scale) + 1][(height/scale) + 1];
    zoff = 0;
    xoff = 0;
    yoff = 0;
  }
  
  public void createField() { 
    for (int i = 0 ; i < flowField.length ; i++) {
      xoff = 0;
      for (int j = 0 ; j < flowField[0].length ; j++) {
        float angle = map(noise(xoff, yoff, zoff), 0, 1, -TWO_PI, TWO_PI);
        flowField[i][j] = PVector.fromAngle(angle);
        flowField[i][j].setMag(0.5);
        xoff += inc;
      }
    yoff += inc;
    }
    yoff = 0;
  }
  
  //public void createField() { 
  //  for (int i = 0 ; i < flowField.length ; i++) {
  //    xoff = 0;
  //    for (int j = 0 ; j < flowField[0].length ; j++) {
  //      flowField[i][j] = noise(xoff, yoff, zoff);
  //      xoff += inc;
  //    }
  //  yoff += inc;
  //  }
  //  yoff = 0;
  //}
  
  public void update() {
    zoff += 0.01;
  }
  
  @Override
  public String toString() {
    String s = "";
    for (PVector[] a : flowField) {
      for (PVector b : a) {
        s += Float.toString(b.x) + " " + Float.toString(b.y);
      }
      s += "\n";
    }
    return s;
  }
}
