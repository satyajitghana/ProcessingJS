var font;
var vehicles = [];

function preload() {
  font = loadFont('Inconsolata-Bold.ttf');
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
  textSize(width*0.15);
  
  var points = font.textToPoints("HAPPYBIRTHDAY", width*0.02, height*0.4);
  var points2 = font.textToPoints('RISHIKA', width*0.23, height*0.8)
  
  for (var i = 0 ; i < points.length; i++) {
    var pt = points[i];
    var vehicle = new Vehicle(pt.x, pt.y);
    vehicles.push(vehicle);
  }
  for (var i = 0 ; i < points2.length; i++) {
    var pt = points2[i];
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
