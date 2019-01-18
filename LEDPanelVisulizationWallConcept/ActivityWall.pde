class ActivityWall {
  PGraphics graphics;
	int h;
	int w;
  int x;
  int y;
	int state;
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