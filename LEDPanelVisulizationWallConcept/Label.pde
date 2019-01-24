class Label {
  color blueColor;
  color accentColor;
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
  
  Label(int _colorType) {
    colorType = _colorType;
    colorMode(HSB,255);
    blueColor = color(136, 249, 255); // blue
    accentColor = color(136,100,255);
    offColor = color(0);
    bgColor = color(0);

    yellowColor = color(39, 242, 255); // orange/yellow
    h = 26; // height
    w = 170 - 8; // width
    paddingLeft = 4;
    paddingTop = 32;
    
    state = 0; // 0 off 1 on
    
    graphics = createGraphics(w, h);
    graphics.beginDraw();
    graphics.noStroke();
    graphics.rectMode(CENTER);
    graphics.endDraw();
   
  }
  void update() {
   
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
  void draw() {
    if(state == 0) {
      // off state 
      
    } else if (state == 1) {
      // label is on
      // pulse effect
      graphics.beginDraw();
      if (colorType == 1) {
        graphics.fill(blueColor);
      } else if (colorType == 2) {
        graphics.fill(yellowColor);
      } else {
        graphics.fill(100);
      }
      graphics.rect(w/2, h/2, w, h);
      graphics.endDraw();
      pushMatrix();
      translate(paddingLeft, paddingTop);
      image(graphics,0,0);
      popMatrix();
    } else if (state == 2) {
      // debug state for alignment
      graphics.beginDraw();

      graphics.fill(100);
      graphics.rect(w/2, h/2, w, h);
      graphics.endDraw();
      pushMatrix();
      translate(paddingLeft, paddingTop);
      image(graphics,0,0);
      popMatrix();
    }
    
  }
}
