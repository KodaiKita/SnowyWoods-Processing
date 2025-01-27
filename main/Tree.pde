class Tree {
  PGraphics layer;
  int length;
  int positionX;
  int opacity;
  int Weight;

  public Tree(int length, int positionX, int opacity, PGraphics layer) {
    this.length = length;
    this.positionX = positionX;
    this.opacity = opacity;
    this.Weight = (int)( (float)length * random(0.08, 0.12));
    this.layer = layer;
  }

  public void drawTree() {
    layer.stroke(0, 0, 0, this.opacity);
    layer.resetMatrix();
    layer.translate(positionX, height);
    branch(length, 17, Weight, 0);
  }

  void branch(float length, int n, float w, int depth) {
    layer.strokeWeight(w);
    if (depth > 11) return;
    layer.line(0, 0, 0, -length);
    layer.translate(0, -length);

    length *= random(0.6, 0.8);

    if (n > 0 && length > 0.01) {

      layer.pushMatrix();
      layer.rotate(PI/9);
      branch(length, n - 1, w*pow(0.91, depth), depth+1);
      layer.popMatrix();

      layer.pushMatrix();
      layer.rotate(-PI / 9);
      branch(length, n - 1, w*pow(0.91, depth), depth+1);
      layer.popMatrix();
    }
  }
}
