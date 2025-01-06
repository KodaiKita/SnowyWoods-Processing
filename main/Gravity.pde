class Gravity {
  PVector acceleration;
  Gravity(float g){
    this.acceleration = new PVector(0, g);
  }
  
  public PVector getAcceleration(){
    return this.acceleration;
  }
  
  
}
