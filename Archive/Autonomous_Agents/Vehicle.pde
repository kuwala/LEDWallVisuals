class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;

  float maxSpeed;
  float maxForce;
  Vehicle (float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 3.0;
    maxSpeed = 4;
    maxForce = 0.1;
  }
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {


    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxSpeed); 

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  void flee(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);

    PVector flee = PVector.sub(desired, velocity);
    flee.limit(maxForce);
    applyForce(flee);


  }
  void display() {
    // draws a triangle pointing towards
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex( 0,-r*2);
    vertex(-r, r*2);
    vertex( r, r*2);
    endShape(CLOSE);
    popMatrix();

  }
}
