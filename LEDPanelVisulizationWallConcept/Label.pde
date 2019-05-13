class Label {
  color blueColor;
  color orangeColor;
  color bgColor;
  color yellowColor;
  color offColor;
  PGraphics graphics;
  
  // height, width
  int h;
  int w;
  int paddingLeft;
  int paddingTop;
  
  int state;
  int colorType;
  int fadeFrames;
  int maxFadeFrames;

  int shortAdjustment;
  boolean shortened;
  
  Label(int _colorType) {
    colorType = _colorType;
    colorMode(HSB,255);
    blueColor = color(136, 249, 255); // blue
    yellowColor = color(39, 242, 255); // orange/yellow
    orangeColor = color(24, 240, 255);
    offColor = color(0);
    bgColor = color(0);

    h = 26; // height
    w = 170 - 8; // width
    paddingLeft = 4;
    paddingTop = 32;
    shortAdjustment = 20;
    shortened = false;
    
    state = 0; // 0 off 1 on
    fadeFrames = 0;
    maxFadeFrames = 120;
    
    graphics = createGraphics(w, h);
    graphics.beginDraw();
    graphics.noStroke();
    graphics.rectMode(CENTER);
    graphics.endDraw();
   
  }
  void update() {
   
  }
  void fadeIn() {
    fadeFrames = 0;
    state = 3;
  }
  void fadeOut() {
    fadeFrames = 0;
    state = 4;
  }
  void turnOn() {
    state = 1;
  }
  void turnOff() {
    state = 0; 
  }
  void turnDebug() {
    state = 2; 
  }
  void attractorFadeIn() {
    state = 5;
    fadeFrames = 0;
  }
  void attractorFadeOut() {
    state = 6;
    fadeFrames = 0;
  }
  void attractorOn() {
    // colored border
    state = 7;
    fadeFrames = 0;
  }

  void drawLabel(color col) {
    graphics.beginDraw();
    graphics.fill(col);
 
    if(colorType == 1) {
      graphics.rect(w/2, h/2, w-20, h);
    } else if (colorType == 2) {
      graphics.rect(w/2, h/2, w, h);
    } else if (colorType == 3) {
      graphics.rect(w/2+10, h/2, w-20, h);
    }
    graphics.endDraw();
    pushMatrix();
    translate(paddingLeft, paddingTop);
    image(graphics,0,0);
    popMatrix(); 
  }

  void drawLabelOutline(color col) {
    graphics.beginDraw();
    graphics.fill(col);
 
    if(colorType == 1) {
      graphics.rect(w/2, h/2, w-20, h);
      graphics.fill(0);
      graphics.rect(w/2, h/2, w-30 , h-10);
    } else if (colorType == 2) {
      graphics.rect(w/2, h/2, w, h);
      graphics.fill(0);
      graphics.rect(w/2, h/2, w-10, h-10);
    } else if (colorType == 3) {
      graphics.rect(w/2+10, h/2, w-20, h);
      graphics.fill(0);
      graphics.rect(w/2+10, h/2, w-20-10, h-10);
    }
    graphics.endDraw();
    pushMatrix();
    translate(paddingLeft, paddingTop);
    image(graphics,0,0);
    popMatrix(); 
  }
  void draw() {
    if(state == 0) {
      // off state 
    } else if (state == 1) {
      // on state
      color col = color(100);
      if (colorType == 1) {
        col = orangeColor;
      } else if (colorType == 2) {
        col = blueColor;
      } else if (colorType == 3) {
        col = yellowColor;

      }

      drawLabel(col);
      
    } else if (state == 2) {
      // debug state
      drawLabel(color(100));
    } else if (state == 3) { //fade in label
      
      color fadeColor = 100;
      if(fadeFrames >= maxFadeFrames) {
        state = 1; 
      }
      float brightness = map(fadeFrames, 0, maxFadeFrames, 0, 255);
      if (colorType == 1) {
        fadeColor =  color(24, 240, brightness); // orange
      } else if (colorType == 2) {
        fadeColor = color(136, 249, brightness); // blue
      } else if (colorType == 3) {
        fadeColor = color(39, 242, brightness); // yellow
      }
      drawLabel(fadeColor);
      fadeFrames++;
    } else if (state == 4) {//fade out label
      
      color fadeColor = 100;
      if(fadeFrames >= maxFadeFrames) {
        state = 0; 
      }
      float brightness = map(fadeFrames, maxFadeFrames,0, 0, 255);
      if (colorType == 1) {
        fadeColor =  color(24, 240, brightness); // orange
      } else if (colorType == 2) {
        fadeColor = color(136, 249, brightness); // blue
      } else if (colorType == 3) {
        fadeColor = color(39, 242, brightness); // yellow
      }
      drawLabel(fadeColor);
      fadeFrames++;
    } else if (state == 5) {
      //fade in attractor
      color fadeColor = 100;
      
      float brightness = map(fadeFrames,0, maxFadeFrames, 0, 100);
      if (colorType == 1) {
        fadeColor =  color(24, 240, brightness); // orange
      } else if (colorType == 2) {
        fadeColor = color(136, 249, brightness); // blue
      } else if (colorType == 3) {
        fadeColor = color(39, 242, brightness); // yellow
      }
      drawLabelOutline(fadeColor);
      fadeFrames++;
      if(fadeFrames >= maxFadeFrames - 1) {
        state = 7; // outline state
        fadeFrames = 0;
      }
    } else if (state == 6) {
      //fade out attractor
      color fadeColor = 100;
      
      float brightness = map(fadeFrames, maxFadeFrames,0, 0, 100);
      if (colorType == 1) {
        fadeColor =  color(24, 240, brightness); // orange
      } else if (colorType == 2) {
        fadeColor = color(136, 249, brightness); // blue
      } else if (colorType == 3) {
        fadeColor = color(39, 242, brightness); // yellow
      }
      drawLabelOutline(fadeColor);
      fadeFrames++;
      if(fadeFrames >= maxFadeFrames - 1) {
        state = 0;
        fadeFrames = 0; 
      }
      
    } else if (state == 7) {
      color col = color(100);
      if (colorType == 1) {
        col = orangeColor;
      } else if (colorType == 2) {
        col = blueColor;
      } else if (colorType == 3) {
        col = yellowColor;
      }

      drawLabelOutline(col);
    }
    
  }
}
