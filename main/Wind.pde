class Wind {
  private PVector force;
  
  public Wind(float fx, float fy){
    this.force = new PVector(fx, fy);
  }
  
  public PVector getForce(){
    return force;
  }
}
