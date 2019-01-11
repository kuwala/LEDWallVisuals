class MapWall {
	int paddingLeft ;
	int paddingTop;

	float minSize = 1;
	float maxSize = 64;
	float targetSize = maxSize;
	float size = minSize;
	int frameCounter = 0;
	int maxFrames = 200;

	PGraphics graphics;

	MapWall(int _paddingLeft, int _paddingTop) {
	  // 128*64
	  // Panels 1*2
	  graphics	= createGraphics(132,132);
	  paddingLeft = _paddingLeft;
	  paddingTop = _paddingTop;

	}
	void update() {
		frameCounter = (frameCounter +1 ) % maxFrames;
		size = easeOut( frameCounter, minSize, targetSize, maxFrames);
	}
	void draw() {
		graphics.beginDraw();
		//graphics.ellipseMode(CENTER);
		graphics.translate(maxSize/2+3,maxSize/2+3);
		graphics.fill(20,100,255,10);
		graphics.strokeWeight(2);
		graphics.stroke(0,255,200);
		graphics.ellipse(0,0,size,size);
        graphics.endDraw();

        pushMatrix();
        translate(paddingLeft, paddingTop);
        image(graphics,0,0);
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