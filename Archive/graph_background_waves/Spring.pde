class Spring {
	PVector position;
    float velocity;
    float flickForce;
    float acceleration;
    float targetHeight;
    float w; // width
    float h; // height
    float argetHeight;
    
	Spring(float _x, float _y, float _h) {
		position = new PVector(_x, _y);
		targetHeight = _h;
		h = _h;
		w = 4;
		velocity = 0;
		acceleration = 0;
	}
	void flick2(float force) {
		flickForce += force;
	}
	void flick() {
		h = targetHeight *1.5;
	}
	void update() {
		float x = h - targetHeight;
	    //spring structure
	    float dampenning = 0.015*velocity;
	    float k = 0.0025;
	    float springForce = -k * x -dampenning;
	    
	    acceleration = springForce + flickForce;
	    flickForce = 0; // applied one time
	    velocity += acceleration;
	    h += velocity;
	}
	float getH() {
		return h;
	}
	void draw() {
		pushMatrix();
		translate(position.x, position.y);
		fill(200,0,220);
		rect(0,0,w,h);
		ellipse(w/2,h,10,10);
		popMatrix();
	}

}