import java.util.ArrayList;
import java.util.List;
FallingObject test;
Snow test2;
float windForceX = random(-1, 1);
List<Snow> Snows = new ArrayList<Snow>();
int frame = 0;

void setup() {
  size(1280, 720);
  test2 = new Snow(200, 100);
}
void draw() {
  int repeatCnt = 1;
  int frameInterval = 1;
  if (frame%frameInterval == 0) {
    for (int i=0; i < repeatCnt; i++) {
      generateSnow();
    }
  }
  background(255);

  for (int i=0; i < Snows.size(); i++) {
    Snows.get(i).loop();
    if (Snows.get(i).isOutOfWindow()) {
      Snows.remove(Snows.get(i));
    }
  }
  frame++;
}

void generateSnow() {
  float vectorSize = 1.0;
  float marginAngle = PI/4.0;
  float theta = random(1.5*PI-marginAngle, 1.5*PI+marginAngle);
  float vx = vectorSize * cos(theta);
  float vy = vectorSize * sin(theta) * -1;

  float margin = width;
  Snow newSnow = new Snow(random(0.0-margin, width+margin), random(-100, 0), (int)random(5, 50), random(0.0, 2*PI), random(-0.1, 0.1), vx, vy, windForceX, 0.0);
  Snows.add(newSnow);
  //Snows.add(new Snow(random(0.0, width), random(-100, 0), (int)random(5, 50), 0, 0, vx, vy));
}

void removeItem(Snow s) {
  this.Snows.remove(s);
}
