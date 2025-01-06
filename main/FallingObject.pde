abstract class FallingObject {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  PVector force;
  
  // 抗力係数
  float dragCoefficient;
  
  Gravity gravity;

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
    this.rotationVelocity = 0.1;
  }
  public FallingObject(float x, float y, int size, float angle, float rv, float vx, float vy) {
    this(x, y);
    this.size = size;
    this.angle = angle;
    this.rotationVelocity = rv;
    this.velocity = new PVector(vx, vy);
  }

  public void loop() {
    this.calcuate();
    this.draw();
  }
  private void calcuate() {
    // 回転
    this.angle = (this.angle + this.rotationVelocity);
    
    // 重力
    PVector gravityForce = gravity.getAcceleration().copy().mult(mass);
    
    // 空気抵抗力の計算 R = kv (k は比例定数)
    PVector dragForce = this.velocity.copy().mult(-this.dragCoefficient);
    
    // 合力を計算
    PVector totalForce = gravityForce.copy().add(dragForce);
    
    // 合力が加速度を決める
    this.acceleration = totalForce.copy().div(mass);
      
    // 加速度が速度を変える
    this.velocity.add(this.acceleration); 
    
    // 速度が位置を変える
    this.position.add(this.velocity);
  }
  public boolean isOutOfWindow(){
    float margin = (float)this.size/2.0f;
    return (this.position.x < -margin || 
            width+margin < this.position.x ||
            this.position.y < -margin-100 ||
            height+margin < this.position.y);
  }
  private void draw() {
    pushMatrix();
    // 描画処理
    translate(this.position.x, this.position.y);
    rotate(angle);
    
    drawShape();
    popMatrix();
  }
  
  abstract void drawShape();
}
