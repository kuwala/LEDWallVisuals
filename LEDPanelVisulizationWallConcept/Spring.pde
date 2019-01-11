/* Spring class for calculating a spring using Hook's Law
change formula in update function to adjust springyness effect
*/
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
	void flick(float force) {
		flickForce += force;
	}
	void setH(float _h) {
		h = _h;
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