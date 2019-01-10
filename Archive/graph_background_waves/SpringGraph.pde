class SpringGraph {
	ArrayList<Spring> springs;
	int numberSprings;
	SpringGraph(float widthOfSpace,int _num) {
		springs = new ArrayList<Spring>();
		numberSprings = _num;
		int spaceBetween = (int)widthOfSpace / numberSprings;

		for (int i = 0; i < numberSprings; i++) {
			springs.add(new Spring(i*spaceBetween, 100, 10*i));
		}
	}
	void bump(int pos) {
		if(pos < numberSprings && pos >= 0) {
			springs.get(pos).flick();
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