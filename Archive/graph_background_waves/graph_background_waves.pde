boolean barColorToggle = false;
float[] scottGraph = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
int bars = 114;
Graph graph;
Spring spring;
SpringArray springArray;
SpringGraph springGraph;

int numberSprings = 40;
void setup() {
  fullScreen();
  colorMode(HSB,255);
  spring = new Spring(200,200, 20);
  graph = new Graph(bars, scottGraph);
  springArray = new SpringArray(width,numberSprings);
  springGraph = new SpringGraph(bars, scottGraph);
}

void draw() {
	background(0);
	fill(120);
	text("Left and Right click mouse to flick the springs.", 32,16);
	text("Rightclick - MouseX, selects spring, MouseY is flick force.",32,38);
	// graph.update();
 	// graph.draw();
 	// graph.drawSprings();
  // update Graph
  springArray.update();
  springArray.draw();
  springGraph.update();
  springGraph.drawSprings();
  fill(255,255,255);
  rect(0,0,16,16);
  
}

void mousePressed() {
  if(mouseX < 16 && mouseY < 16) {
    exit();
  } 
  if(mouseButton == LEFT) {
	int pos = (int)map(mouseX, 0, width, 0, numberSprings);
  	float force = map(mouseY, 0, height, 0,40);
  	// springGraph.flick2(pos,force);
  	springArray.flick(pos);
  } else if (mouseButton == RIGHT) {
  	int pos = (int)map(mouseX, 0, width, 0, numberSprings);
  	float force = map(mouseY, 0, height, 0,40);
  	springArray.flick2(pos,force);
  	// springGraph.flick(pos);
  }
  	
}
