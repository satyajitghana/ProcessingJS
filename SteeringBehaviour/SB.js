var font;
var vehicles = [];

function preload() {
  font = loadFont('PTM55FT.ttf');
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  setup();
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 255, 255, 255);
  background(50);
  noStroke();

  //Font Stuff
  fill(255);
  textFont(font);
  textSize(width*0.4);
  
  var points = font.textToPoints("10", width*0.2, height*0.7);
  
  for (var i = 0 ; i < points.length; i++) {
    var pt = points[i];
    var vehicle = new Vehicle(pt.x, pt.y);
    vehicles.push(vehicle);
  }
}

function draw() {
  background(50);
  for (var i = 0 ; i < vehicles.length ; i++) {
    vehicles[i].behaviour();  
    vehicles[i].update();
    vehicles[i].show();
  }
}
