class Epicenter {
  int x, y;
  float angle, rate;
  int lifeTime;// in update cycles
  int radius;
  Epicenter(int x_, int y_, int radius_, int lifeTime_) {
    x = x_;
    y = y_;
    lifeTime = lifeTime_;
    radius = radius_;
    angle = 0;
    rate = 0.01;
    
  }
  void update() {
    // update and draw
    if(lifeTime >0) {
      ellipseMode(CENTER);
      noFill();
      stroke(255,0,0);
      float radius = sin(angle) * baseRadius;
      angle += rate;
      ellipse(x,y, radius, radius);
      lifeTime --;
    } 
    
  } // end update
  boolean isFinished() {
    if(lifeTime < 1) {
      return true;
    } else { 
      return false; 
    }
  }
  
}
