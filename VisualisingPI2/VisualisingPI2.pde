import java.util.*;
import java.util.stream.*;

String[] pi;
int[] digits;
int index = 0;
int[] counts = new int[10];
void setup() {
  size(640, 640);
  background(255);
  pi = loadStrings("pi1000000.txt")[0].split("");
  digits = int(pi);
  //printArray(digits);
}

void draw() {
  translate(width/2, height/2);
  int currDigit = digits[index];
  index++;
  counts[currDigit]++;
  float w = width / counts.length;
  for (int i = 0 ; i < counts.length ; i++) {
    float a = map(i, 0, counts.length, 0, TWO_PI);
    float x = 200 * cos(a);
    float y = 200 * sin(a);
    float d = counts[i];
    ellipse(x, y, d, d);
  }
}
