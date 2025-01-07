class Snow extends FallingObject{
  public Snow(float x, float y){
    super(x, y);
  }
  public Snow(float x, float y, int size, float angle, float rv, float vx, float vy, float wx, float wy) {
    super(x, y, size, angle, rv, vx, vy, wx, wy);
  }
  
  void drawShape(){
    rectMode(CENTER);
    rect(0, 0, this.size, this.size);
  }
}
