class MapWall {
	int paddingLeft = 100;
	int paddingTop = 100;

	float minSize = 1;
	float maxSize = 64;
	float targetSize = maxSize;
	float size = minSize;
	int frameCounter = 0;
	int maxFrames = 200;
	MapWall() {
	  // 128*64
	  // Panels 1*2

	}
	void update() {
		frameCounter = (frameCounter +1 ) % maxFrames;
		size = easeOut( frameCounter, minSize, targetSize, maxFrames);
	}
	void draw() {
		translate(paddingLeft,paddingTop);
		fill(20,100,255,10);
		strokeWeight(2);
		stroke(0,255,200);
		ellipse(0,0,size,size);

	}
	float easeOut( float t, float b, float c, float d) {
		// t: currentTime, b: start value
		// c: change in value, d: duration
		// time can be in frames or millis
		t = t / d;
		return -c * t*(t-2) + b;
	}
}