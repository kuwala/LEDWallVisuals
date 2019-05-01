class ActivityWall {
  // PGraphics graphics;
	int h;
	int w;
  int x;
  int y;
  int state; // 0 - off, 1 - Scott, 2 - Tohoku, 3 - NorthRidge. quakes
  boolean rotated;

  color blueColor;
  color yellowColor;
  color orangeColor;

  int timer;
  int scottStartTime;
  int scottStartTime2;
  int tohokuStartTime;
  int tohokuStartTime2;
  int northRidgeStartTime;
  int northRidgeStartTime2;
  int animationState; // light sec 1 , 2 ,3 
  int delayBetween;

  Square leftSquare = new Square(0,256, 127,127,127);
  Square middleSquare = new Square(0,128, 127,127,127);
  Square rightSquare = new Square(0,0, 127,127,127);

	ActivityWall(int _x, int _y){
    x = _x;
    y = _y;
    w = 128;
    h = 384;
    state = 0; // 0 - idle, 1 - animating
    animationState = 0; // 0 - wait for first timer, 1 - draw, wait for next timer
    rotated = false;

    blueColor = color(136, 249, 170); // blue
    yellowColor = color(39, 242, 170); // yellow
    orangeColor = color(24, 240, 255); // orange


    timer = 0;
    scottStartTime = 62000;
    scottStartTime2 = 67000;
    northRidgeStartTime = 42000;
    northRidgeStartTime2 = 48000;
    tohokuStartTime = 40000;
    tohokuStartTime2 = 50000;
    delayBetween = 1000;
	}
	void draw() {
    pushMatrix();
    translate(x,y);
    if(rotated) {
      translate(100,300);
      rotate(HALF_PI);
    }
    fill(20);
    //rect(0,0,w,h);
    leftSquare.update();
    middleSquare.update();
    rightSquare.update();

    if (state == 0) {
      // idle
    } else if(state == 1) {
      // scott mills
      leftSquare.setColor(24,240,170);
      middleSquare.setColor(24,240,170);
      rightSquare.setColor(24,240,170);
      if(animationState == 0) {
        // wait till start time
        if(millis() - timer > scottStartTime) {
          animationState = 1;
          // trigger left square
          leftSquare.trigger();
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > scottStartTime + delayBetween) {
          animationState = 2;
          middleSquare.trigger();
        }
        //drawOne(orangeColor);
        
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > scottStartTime + delayBetween*2) {
          animationState = 3;
          rightSquare.trigger();
        }
        //drawTwo(orangeColor);
      } else if(animationState == 3) {
        // section 3
        if(millis() - timer > scottStartTime + delayBetween*3) {
          animationState = 4;
          
        }
        //drawThree(orangeColor);
      } else if (animationState == 4) {
        // section 1 again
        if (millis() - timer > scottStartTime2) {
          animationState = 5;
          leftSquare.trigger(); 
        }
      } else if (animationState == 5) {
        if (millis() - timer > scottStartTime2 + delayBetween) {
          animationState = 6;
          middleSquare.trigger(); 
        }
      } else if (animationState == 6) {
        if (millis() - timer > scottStartTime2 + delayBetween*2) {
          animationState = 7;
          rightSquare.trigger(); 
        } 
      } else if (animationState == 7) {
        // section 3
        if (millis() - timer > scottStartTime2 + delayBetween*3) {
          animationState = 0;
          state = 0;
        }  
      }

    } else if (state == 3) {
      // tohoku
      // skip japanese activitiy wall light ups
      state = 0;
      leftSquare.setColor(39,242,170); // blue
      middleSquare.setColor(39,242,170); // blue
      rightSquare.setColor(39,242,170); // blue
      if(animationState == 0) {
        // wait till start time
        if(millis() - timer > tohokuStartTime) {
          animationState = 1;
          leftSquare.trigger();
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > tohokuStartTime + delayBetween) {
          animationState = 2;
          middleSquare.trigger();
        }
        //drawOne(yellowColor);
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > tohokuStartTime + delayBetween*2) {
          animationState = 3;
          rightSquare.trigger();
        }
        // drawTwo(yellowColor);
      } else if(animationState == 3) {
        // section 3
        if(millis() - timer > tohokuStartTime + delayBetween*3) {
          animationState = 4;
          //state = 0;
        }
        // drawThree(yellowColor);
      } else if(animationState == 4) {
        // wait till start time
        if(millis() - timer > tohokuStartTime2) {
          animationState = 5;
          leftSquare.trigger();
        }
      } else if(animationState == 5) {
        // section 1
        if(millis() - timer > tohokuStartTime2 + delayBetween) {
          animationState = 6;
          middleSquare.trigger();
        }
        // drawOne(yellowColor);
      } else if(animationState == 6) {
        // section 2
        if(millis() - timer > tohokuStartTime2 + delayBetween*2) {
          animationState = 7;
          rightSquare.trigger();
        }
        // drawTwo(yellowColor);
      } else if(animationState == 7) {
        // section 3
        if(millis() - timer > tohokuStartTime2 + delayBetween*3) {
          animationState = 0;
          state = 0;
        }
        // drawThree(yellowColor);
      }


    } else if (state == 2) {
      // Los Angeles
        leftSquare.setColor(136, 249, 170); // blue
        middleSquare.setColor(136, 249, 170); // blue
        rightSquare.setColor(136, 249, 170); // blue
        if(animationState == 0) {
        // wait till start time
        if(millis() - timer > northRidgeStartTime) {
          animationState = 1;
          leftSquare.trigger();
        }
      } else if(animationState == 1) {
        // section 1
        if(millis() - timer > northRidgeStartTime + delayBetween) {
          animationState = 2;
          middleSquare.trigger();
        }
        // drawOne(blueColor);
      } else if(animationState == 2) {
        // section 2
        if(millis() - timer > northRidgeStartTime + delayBetween*2) {
          animationState = 3;
          rightSquare.trigger();
        }
      } else if(animationState == 3) {
        
        if(millis() - timer > northRidgeStartTime + delayBetween*3) {
          animationState = 4;
          
        }
      } else if (animationState == 4) {
        if(millis() - timer > northRidgeStartTime2) {
          animationState = 5;
          leftSquare.trigger();
        }
      } else if (animationState == 5 ) {
        if(millis() - timer > northRidgeStartTime2 + delayBetween) {
          animationState = 6;
          middleSquare.trigger();
        }
      }else if (animationState == 6) {
        if(millis() - timer > northRidgeStartTime2 + delayBetween*2) {
          animationState = 7;
          rightSquare.trigger();
        }
      }else if (animationState == 7 ) {
        if(millis() - timer > northRidgeStartTime2 + delayBetween*3) {
          animationState = 0;
          state = 0;
        }
      }
    }   else if (state == 4) {
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
  void drawOne(int col) {
    fill(col);
    rect(0,(h/3)*2,w,h/3);
  }
  void drawTwo(int col) {
    fill(col);
    rect(0,h/3,w,h/3);
    rect(0,(h/3)*2,w,h/3);
  }
  void drawThree(int col) {
    fill(col);
    rect(0,0,w,h/3);
    rect(0,h/3,w,h/3);
    rect(0,(h/3)*2,w,h/3);
  }

}
