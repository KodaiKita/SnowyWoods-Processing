class Snow extends FallingObject {
  public Snow(float x, float y) {
    super(x, y);
  }
  public Snow(float x, float y, int size, float angle, float rv, float vx, float vy, float wx, float wy) {
    super(x, y, size, angle, rv, vx, vy, wx, wy);
  }

  void drawShape() {
    int radius = size;
    PVector pos = new PVector(0, 0);

    PVector[] vertices = getTriangleVertices((int)pos.x, (int)pos.y, radius);

    PVector P = vertices[1];
    //PVector P = new PVector(100, 160);

    PVector Q = vertices[2];
    //PVector Q = new PVector(400, 160);

    PVector R = vertices[0];
    //PVector R = new PVector(250, 420);

    //strokeWeight(10);
    //stroke(255, 0, 0 );
    //point(P.x, P.y);
    //stroke(0, 255, 0 );
    //point(Q.x, Q.y);
    //stroke(0, 0, 255);
    //point(R.x, R.y);
    //strokeWeight(1);

    fill(255, 255, 255, 220);
    //stroke(0, 130, 255);
    noStroke();
    int step;
    if (size > 40) {
      step = 5;
    }else if(size > 30){
      step = 4;
    }else if(size > 20){
      step = 3;
    }else{
      step = 2;
    }

    beginShape();
    drawKoch(P, Q, 5);
    drawKoch(Q, R, 5);
    drawKoch(R, P, 5);
    endShape(CLOSE);
  }

  void drawKoch(PVector a, PVector b, int n) {
    if (n == 0) {
      vertex(a.x, a.y);
      vertex(b.x, b.y);
      return;
    }

    PVector c = PVector.lerp(a, b, 1.0 / 3.0);
    PVector d = PVector.lerp(a, b, 2.0 / 3.0);

    PVector dir = PVector.sub(b, a);
    dir.mult(1.0 / 3.0);
    dir.rotate(-PI / 3.0);
    PVector e = PVector.add(c, dir);

    drawKoch(a, c, n - 1);
    drawKoch(c, e, n - 1);
    drawKoch(e, d, n - 1);
    drawKoch(d, b, n - 1);
  }

  PVector[] getTriangleVertices(int cx, int cy, int radius) {
    PVector[] vertices = new PVector[3];
    float angle = PI / 2;

    for (int i = 0; i < 3; i++) {
      float vx = cx + cos(angle + 2*PI / 3 * i) * radius;
      float vy = cy + sin(angle + 2*PI / 3 * i) * radius;
      vertices[i] = new PVector(vx, vy);
    }

    return vertices;
  }
}
