class SpringArray {
	ArrayList<Spring> springs;
	int numberSprings;
	SpringArray(float widthOfSpace,int _num) {
		springs = new ArrayList<Spring>();
		numberSprings = _num;
		int spaceBetween = (int)widthOfSpace / numberSprings;

		for (int i = 0; i < numberSprings; i++) {
			springs.add(new Spring(i*spaceBetween, 100, 10*i));
		}
	}
	void flick(int pos) {
		if(pos < numberSprings && pos >= 0) {
			springs.get(pos).flick();


		}
	}
	void flick2(int pos, float force) {
		if(pos < numberSprings && pos >=0) {
			springs.get(pos).flick2(force);
		}
	}
	void update() {
		for (Spring i : springs) {
			i.update();
		}
	}
	void draw() {
		for (int i = 0; i < springs.size(); ++i) {
			springs.get(i).draw();
			
		}
	}

}