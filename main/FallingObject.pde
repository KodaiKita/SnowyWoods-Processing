abstract class FallingObject {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  PVector force;
  
  float dragCoefficient;
  
  Gravity gravity;
  Wind wind;

  int size;

  float angle;
  float rotationVelocity;

  public FallingObject(float x, float y) {
    this.position = new PVector(x, y);
    this.angle = 0;
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass = 1;
    this.size = 10;
    this.force = new PVector(0, 0);
    this.rotationVelocity = 0;
    this.dragCoefficient = 0.07;
    this.gravity = new Gravity(0.5);
    this.wind = new Wind(0, 0);
    this.rotationVelocity = 0.1;
  }
  public FallingObject(float x, float y, int size, float angle, float rv, float vx, float vy, float wx, float wy) {
    this(x, y);
    this.size = size;
    this.angle = angle;
    this.rotationVelocity = rv;
    this.velocity = new PVector(vx, vy);
    this.wind = new Wind(wx, wy);
  }

  public void loop() {
    this.calcuate();
    this.draw();
  }
  private void calcuate() {
    
    this.angle = (this.angle + this.rotationVelocity);
    
    PVector gravityForce = gravity.getAcceleration().copy().mult(mass);
    
    // R = kv (k は比例定数)
    PVector dragForce = this.velocity.copy().mult(-this.dragCoefficient);
    
    PVector totalForce = gravityForce.copy().add(dragForce).add(this.wind.getForce());
    
    this.acceleration = totalForce.copy().div(mass);
    
    this.velocity.add(this.acceleration); 
    
    this.position.add(this.velocity);
  }
  public boolean isOutOfWindow(){
    float sizeMargin = (float)this.size/2.0f;
    float margin = width;
    return (this.position.x < -sizeMargin-margin || 
            width+sizeMargin+margin < this.position.x ||
            this.position.y < -sizeMargin-100 ||
            height+sizeMargin < this.position.y);
  }
  private void draw() {
    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(angle);
    
    drawShape();
    popMatrix();
  }
  
  abstract void drawShape();
}
