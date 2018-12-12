class Mover {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float mass = 12;
  
  float damping = 0.95;
  Mover(int x, int y) {
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
   
    
  }
  void update() {
    velocity.add(acceleration);
    velocity.mult(damping);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
    
  }
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  
}
