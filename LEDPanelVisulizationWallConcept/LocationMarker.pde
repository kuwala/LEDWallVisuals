class LocationMarker {
	int paddingLeft;
	int paddingTop;

	float minSize;
	float maxSize;
	float targetSize;
	float size;
	int frameCounter;
	int maxFrames;

  int w;
  int h;
	PGraphics graphics;

	LocationMarker(int _paddingLeft, int _paddingTop, int _w, int _h) {
    w = _w;
    h = _h;
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

	}
	void update() {
		frameCounter = (frameCounter +1 ) % maxFrames;
		size = easeOut( frameCounter, minSize, targetSize, maxFrames);
	}
  void setFrameCounter(int newFrames) {
    frameCounter = newFrames % maxFrames;
  }
	void draw() {
		graphics.beginDraw();
		//graphics.ellipseMode(CENTER);
    graphics.fill(20,100,255,10);
    // graphics.fill(0,0,0,2);
    graphics.noStroke();
    graphics.rect(0, 0, 64,64);
		graphics.translate(maxSize/2+3,maxSize/2+3);
    // graphics.translate(paddingLeft,paddingTop);
		graphics.fill(20,100,255,2);
    // graphics.fill(0,0,0,2);
		graphics.strokeWeight(1.5);
		graphics.stroke(0,255,200);
		graphics.ellipse(0,0,size,size);
        graphics.endDraw();

        pushMatrix();
        translate(paddingLeft, paddingTop);
        image(graphics,0,0);
        // fill(0,0,0,0);
        // strokeWeight(1);
        // stroke(255);
        // rect(0,0,64,64);
        popMatrix();
	}
	float easeOut( float t, float b, float c, float d) {
		// t: currentTime, b: start value
		// c: change in value, d: duration
		// time can be in frames or millis
		t = t / d;
		return -c * t*(t-2) + b;
	}
}