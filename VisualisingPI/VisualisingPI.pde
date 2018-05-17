import java.util.*;
import java.util.stream.*;

String[] pi;
int[] digits;
int index = 0;

void setup() {
  size(640, 640);
  background(0);
  pi = loadStrings("pi1000000.txt")[0].split("");
  digits = int(pi);
  noFill();
  stroke(255);
  translate(width/2, height/2);
  ellipse(0, 0, 400, 400);
}

void draw() {
  //background(0);
  
  translate(width/2, height/2);
  int currDigit = digits[index];
  int nextDigit = digits[index+1];
  index++;
  
  float a1 = map(currDigit, 0, 10, 0, TWO_PI);
  float a2 = map(nextDigit, 0, 10, 0, TWO_PI);
  
  float x1 = 200 * cos(a1);
  float y1 = 200 * sin(a1);
  float x2 = 200 * cos(a2);
  float y2 = 200 * sin(a2);
  stroke(255);
  line(x1, y1, x2, y2);
}
