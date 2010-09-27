class Ball {
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private int verticalLimit;

  public Ball(int x, int y, float x_speed, float y_speed, float gravity, int verticalLimit) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(x_speed, y_speed);
    this.acceleration = new PVector(0, gravity);
    this.verticalLimit = verticalLimit;
  }

  public void draw() {

    fill(50, 180, 50);
    stroke(50, 180, 50);

    point(position.x, position.y);
    velocity.add(acceleration);
    position.add(velocity);
    
    if(position.y >= verticalLimit) {
      float new_y = 0.0;
      new_y = new_y < 2 ? -2 : -(velocity.y)/2.0;
      velocity = new PVector(velocity.x, new_y); 
      position.add(velocity);
    }
  }
}

