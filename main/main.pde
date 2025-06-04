import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;

float windForceX = random(-1, 1);
List<Snow> Snows = new ArrayList<Snow>();
List<Tree> Trees = new ArrayList<Tree>();
PGraphics backgroundLayer;
Tree test2;
int frame = 0;

void setup() {
  size(1280, 720);
  
  frameRate(30);
  
  backgroundLayer = createGraphics(width, height);
  for(int i=0; i < 10; i++){
    float Length = random(80, 200);
    int posX = (int)random(0, width);
    float opacity = (float)(Length-80)/(float)(200-80)*128.0+128.0;

    Trees.add(new Tree((int)Length, posX, (int)opacity, backgroundLayer));
  }
  Trees.sort(Comparator.comparingInt(tree -> tree.length));
  
  
  backgroundLayer.beginDraw();
  for (Tree t: Trees) {
    t.drawTree();
  }
  backgroundLayer.endDraw();
}
void draw() {
  int repeatCnt = 1;
  int frameInterval = 3;
  if (frame%frameInterval == 0) {
    for (int i=0; i < repeatCnt; i++) {
      generateSnow();
    }
  }
  color c1 = color(232, 244, 252);
  color c2 = color(225, 227, 249);
  for (int y = 0; y < height; y++) {
    float t = map(y, 0, height, 0, 1);
    color c = lerpColor(c1, c2, t);
    stroke(c);
    line(0, y, width, y);
  }
  
  image(backgroundLayer, 0, 0);

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
