class Square {
  PGraphics graphics;
  int x, y, w, h;
  int state;
  int hue, sat, bri;
  int maxBrightness;
  int fadeInTime = 500;
  int onTime = 1500;
  int fadeOutTime = 1500;
  int timer;

  Square(int x_, int y_, int hue_, int sat_, int bri_){
    x = x_; y = y_; hue = hue_; sat = sat_; bri = bri_;
    w =128; h = 128;
    maxBrightness = bri_;
    timer = 0;
    state = 0; // idle
  }
  void update() {
    if(state == 0) { // idle

    } else if (state == 1) { // Fade in
      
     
      // calculate brightness
      int elapsedTime = millis() - timer;
      bri = round(map(elapsedTime, 0, fadeInTime, 0, maxBrightness));
      // draw square
      draw();

      if(millis() - timer > fadeInTime) {
        state =2;
        timer = millis();
      }
    } else if (state == 2) {  // Stay on
      draw();
      if(millis() - timer > onTime) {
        state = 3;
        timer = millis();
      }
    } else if (state == 3) { // Fade out

      int elapsedTime = millis() - timer;
      // dim brightness
      bri = round(map(elapsedTime, 0, fadeOutTime, maxBrightness, 0));
      // draw square
      draw();
      if(millis() - timer > onTime) {
        state = 0; // return to idle state
      }
    }

    
  }

  void trigger() {
    timer = millis();
    state = 1;
  }
  void setColor(int hue_, int sat_, int bri_) {
    hue = hue_;
    sat = sat_;
    bri = bri_;
    maxBrightness = bri_;
  }

  void draw() {
    // int w = 128, h = 384;
    fill(hue, sat, bri);
    // rect(0,(h/3)*2,w,h/3);
    rect(x, y, w, h);
  }

}