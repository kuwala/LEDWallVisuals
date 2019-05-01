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
  void drawLabel(color col) {
    graphics.beginDraw();
    graphics.fill(col);
    graphics.rect(w/2, h/2, w, h);
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
    } else if (state == 3) {
      //fade in
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
    } else if (state == 4) {
      //fade in
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
    }
    
  }
}
