class ActivityWall {
  PGraphics graphics;
	int h;
	int w;
  int x;
  int y;
	int state; // 0 - debug, 1,2,3 - sections
  boolean rotated;

	ActivityWall(int _x, int _y){
    x = _x;
    y = _y;
    w = 128;
    h = 384;
    state = 0;
    rotated = false;
	}
	void draw() {
    pushMatrix();
    translate(x,y);
    if(rotated) {
      translate(100,300);
      rotate(HALF_PI);
    }
    fill(20);
    rect(0,0,w,h);

    if(state == 1) {
      fill(200);
      rect(0,0,w,h/3);
    } else if (state == 2) {
      fill(200);
      rect(0,h/3,w,h/3);
    } else if (state == 3) {
      fill(200);
      rect(0,(h/3)*2,w,h/3);
    } else if (state == 0) {

      fill(200);
      rect(0,0,w,h);
      pushMatrix();
      translate( w/2, h-120);
      rotate(HALF_PI*3);
      fill(250);
      textSize(32);
      text("ActivityWall",0,0);
      textSize(14);
      popMatrix();
    }
    fill(100);
    text("ActivityWall",16,416);
    popMatrix();
    // drawDebug();

	}
  void setState(int newState) {
    state = newState;
  }
  void drawDebug() {
    pushMatrix();
    translate(x,y);
    if(rotated) {
      translate(100,300);
      rotate(HALF_PI);
    }
    fill(200);
    rect(0,0,w,h);
    pushMatrix();
    translate( w/2, h-120);
    rotate(HALF_PI*3);
    fill(250);
    textSize(32);
    text("ActivityWall",0,0);
    textSize(14);
    popMatrix();
    fill(100);
    text("ActivityWall",16,416);
    popMatrix();
  }
  void toggleRotation() {
    rotated = ! rotated;
  }
}