import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData metaData;
BeatDetect beat;

float r = 200;
float rad = 50;
float c = 0;
String title;
float pos = 0;
float vel = 1 ;
void setup() {
  minim = new Minim(this);
  //size(displayWidth, displayHeight);
  size(600, 600);
  player = minim.loadFile("Tareefan-Veere-Di-Wedding.mp3");
  metaData = player.getMetaData();
  title = metaData.title();
  beat = new BeatDetect();
  player.loop();
  background(255);
  fill(0, 102, 152);
  textSize(32);
  text("Satyajit Ghana", 0, 0);
  colorMode(HSB);
}

void draw() {
  background(255);
  beat.detect(player.mix);
  fill(0);
  //noStroke();
  translate(width/2, height/2);
  
  if (beat.isOnset())
    rad *= 1.1;
  else rad = 50;
  noStroke();
  ellipse(0, 0, rad*2, rad*2);
  
  for (int i = 0 ; i < player.bufferSize()-1; i++) {
    PVector p1 = new PVector();
    PVector p2 = new PVector();

    float angle = map(i, 0f, float(player.bufferSize()), 0f, TWO_PI);
    p1.x = r * cos(angle);
    p1.y = r * sin(angle);
    
    float hue = map(angle, 0, TWO_PI, 0, 255);
    float length = player.left.get(i)*100;
    
    p2.x = p1.x + length * cos(angle);
    p2.y = p1.y + length * sin(angle);
    stroke(hue, 255, 255);
    fill(hue, 0, 0);

    line(p1.x, p1.y, p2.x, p2.y);
  }
  fill(c, 255, 255); c += 1; if(c > 255) c = 0;
  textSize(20);
  text("Satyajit Ghana", 120, 260);
  fill(rad*c/50, 255, 255);
  //text(metaData.fileName(), pos, -260);
  text(metaData.fileName(), -160, -260);
  //pos += vel;
  //if (pos > (width/2-340)) vel = -1;
  //if (pos < -width/2) vel = 1;
  saveFrame("output/img####.png");
}
