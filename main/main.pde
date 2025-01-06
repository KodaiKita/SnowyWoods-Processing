import java.util.ArrayList;
import java.util.List;
FallingObject test;
Snow test2;
List<Snow> Snows = new ArrayList<Snow>();
int frame = 0;
void setup() {
  size(1280,720);
  test2 = new Snow(200, 100);
}
void draw() {
  if (frame%3 == 0) generateSnow();
  background(255);
  
  for (int i=0; i < Snows.size() ; i++) {
    Snows.get(i).loop();
    if (Snows.get(i).isOutOfWindow()) {
      Snows.remove(Snows.get(i));
    }
  }
  frame++;
}

void generateSnow(){
  float vectorSize = 1.0;
  float margin = PI/4.0;
  float theta = random(1.5*PI-margin, 1.5*PI+margin);
  float vx = vectorSize * cos(theta);
  float vy = vectorSize * sin(theta) * -1;
  println(vx + "  ||  " + vy);
  Snows.add(new Snow(random(0.0, width), random(-100, 0), (int)random(5, 50), random(0.0, 2*PI), random(-0.1, 0.1), vx, vy));
  //Snows.add(new Snow(random(0.0, width), random(-100, 0), (int)random(5, 50), 0, 0, vx, vy));
}

void removeItem(Snow s){
  this.Snows.remove(s);
}
