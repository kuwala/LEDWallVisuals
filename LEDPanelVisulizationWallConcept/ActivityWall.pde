class ActivityWall {
  PGraphics graphics;
	int h;
	int w;
  int x;
  int y;
  int state; // 0 - off, 1 - Scott, 2 - Tohoku, 3 - NorthRidge. quakes
  boolean rotated;

  color blueColor;
  color yellowColor;
  color greenColor;

  int timer;
  int scottStartTime;
  int tohokuStartTime1;
  int tohokuStartTime2;
  int northRidgeStartTime;
  int animationState; // light sec 1 , 2 ,3 
  int delayBetween;

	ActivityWall(int _x, int _y){
    x = _x;
    y = _y;
    w = 128;
    h = 384;
    state = 0;
    animationState = 0;
    rotated = false;

    blueColor = color(136, 249, 255); // blue
    yellowColor = color(39, 242, 255); // orange/yellow
    greenColor = color(136,100,255);

    timer = 0;
    scottStartTime = 20000;
    northRidgeStartTime = 15000;
    tohokuStartTime1 = 30000;
    tohokuStartTime2 = 50000;
    delayBetween = 2000;
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

    if (state == 0) {
      // idle
    } else if(state == 1) {
      // scott mills
      if(animationState == 0) {
        // wait till start time
        if(millis() - timer > scottStartTime) {
          animationState = 1;
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > scottStartTime + delayBetween) {
          animationState = 2;
        }
        fill(blueColor);
        rect(0,0,w,h/3);
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > scottStartTime + delayBetween*2) {
          animationState = 3;
        }
        fill(200);
        fill(blueColor);
        rect(0,0,w,h/3);
        rect(0,h/3,w,h/3);
      } else if(animationState == 3) {
        // section 3
        if(millis() - timer > scottStartTime + delayBetween*3) {
          animationState = 0;
          state = 0;
        }
        fill(blueColor);
        rect(0,0,w,h/3);
        rect(0,h/3,w,h/3);
        rect(0,(h/3)*2,w,h/3);
      }

    } else if (state == 2) {
      // tohoku
      if(animationState == 0) {
        // wait till start time
        if(millis() - timer > tohokuStartTime1) {
          animationState = 1;
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > tohokuStartTime1 + delayBetween) {
          animationState = 2;
        }
        fill(blueColor);
        rect(0,0,w,h/3);
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > tohokuStartTime1 + delayBetween*2) {
          animationState = 3;
        }
        fill(blueColor);
        rect(0,h/3,w,h/3);
      } else if(animationState == 3) {
        // section 3
        if(millis() - timer > tohokuStartTime1 + delayBetween*3) {
          animationState = 0;
          state = 0;
        }
        fill(blueColor);
        rect(0,(h/3)*2,w,h/3);
      }
    } else if (state == 3) {
      if(animationState == 0) {
        // wait till start time
        if(millis() - timer > northRidgeStartTime) {
          animationState = 1;
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > northRidgeStartTime + delayBetween) {
          animationState = 2;
        }
        fill(greenColor);
        rect(0,0,w,h/3);
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > northRidgeStartTime + delayBetween*2) {
          animationState = 3;
        }
        fill(200);
        fill(greenColor);
        rect(0,h/3,w,h/3);
      } else if(animationState == 3) {
        // section 3
        if(millis() - timer > northRidgeStartTime + delayBetween*3) {
          animationState = 0;
          state = 0;
        }
        fill(greenColor);
        rect(0,(h/3)*2,w,h/3);
      }
    } else if (state == 4) {
      // debug 
      fill(60);
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
    animationState = 0;
    timer = millis();
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