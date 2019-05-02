class LocationMarker {
	int paddingLeft;
	int paddingTop;

  int centerAdjustX;
  int centerAdjustY;

	float minSize;
	float maxSize;
	float targetSize;
	float size;
	int frameCounter;
	int maxFrames;
  int hue, sat, bri;

  int w;
  int h;
	PGraphics graphics;
  String title;
  int state;

	LocationMarker(int _paddingLeft, int _paddingTop, int _w, int _h, String _title) {
    w = _w;
    h = _h;
    hue = 0; sat = 0; bri = 255;
    minSize = 1;
    maxSize = _h - 6;
    targetSize = maxSize;
    size = minSize;
    frameCounter = 0;
    maxFrames = 200;
	  // 128*64
	  // Panels 1*2
	  graphics	= createGraphics(w,h);
	  paddingLeft = _paddingLeft;
	  paddingTop = _paddingTop;
    centerAdjustX = 0;
    centerAdjustY = 0;
    title = _title;
    state = 0; // -1 is debug

	}
	void update() {
		frameCounter = (frameCounter +1 ) % maxFrames;
		size = easeOut( frameCounter, minSize, targetSize, maxFrames);
	}
  void setFrameCounter(int newFrames) {
    frameCounter = newFrames % maxFrames;
  }
  void setCenterAdjust(int ax, int ay) {
    centerAdjustX = ax;
    centerAdjustY = ay;
  }
	void draw() {
		graphics.beginDraw();
    graphics.colorMode(HSB);
		graphics.ellipseMode(CENTER);
    graphics.fill(0,0,0,2);
    graphics.noStroke();
    graphics.rect(0, 0, 64,64);
    // EDIT HERE to change vingetting
    graphics.pushMatrix();
		graphics.translate(maxSize/2+3,maxSize/2+3);
    graphics.translate(centerAdjustX, centerAdjustY);
    // graphics.translate(paddingLeft,paddingTop);

    graphics.fill(0,0,0,2);
		graphics.strokeWeight(1.5);
    graphics.stroke(hue,sat,bri);
		graphics.ellipse(0,0,size,size);
    graphics.popMatrix();
    if(state == -1) {
      graphics.fill(255);
      graphics.ellipseMode(CORNER);
      graphics.text(title,0,10); // drawtitle
    }
    graphics.endDraw();

    pushMatrix();
    translate(paddingLeft, paddingTop);
    image(graphics,0,0);
    
    popMatrix();
	}
  void setColor(int hue_, int sat_, int bri_) {
    hue = hue_; sat = sat_; bri = bri_;
    
  }
  void reset() {
    graphics.beginDraw();
    graphics.fill(0);
    graphics.noStroke();
    graphics.rect(0,0,graphics.width,graphics.height);
    graphics.fill(0,0,0,2);
    graphics.endDraw();
    frameCounter = 0;
  }
  void setState(int _state) {
    state = _state;
  }
  int getState() {
    return state;
  }
	float easeOut( float t, float b, float c, float d) {
		// t: currentTime, b: start value
		// c: change in value, d: duration
		// time can be in frames or millis
		t = t / d;
		return -c * t*(t-2) + b;
	}
}
