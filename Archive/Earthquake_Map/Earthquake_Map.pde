PShape usaMap;
float angle = 0;
float rate = 0.01;
int baseRadius = 200;

long time = 0;
long timeStep = 1000;

ArrayList<Epicenter> epicenters = new ArrayList<Epicenter>();

void setup() {
  size(1200,800);
  usaMap = loadShape("usa_map2.svg");
}

void draw() {
  background(127);
  shape(usaMap, 100,100, 959, 593);
  // draw a circle
  ellipseMode(CENTER);
  noFill();
  stroke(255,0,0);
  float radius = sin(angle) * baseRadius;
  angle += rate;
  //ellipse(mouseX,mouseY, radius, radius);
  
  if(millis() - time > timeStep) {
    //create new epicenter
    epicenters.add(new Epicenter(floor(random(400)),floor(random(400)), 100, 60));
    time = millis();
  }
  for(int i = 0; i < epicenters.size(); i++) {
    Epicenter e = epicenters.get(i);
    
    e.update();
    if(e.isFinished()) {
      epicenters.remove(i);
    }
  }
  
  
}

void mouseClicked() {
      epicenters.add(new Epicenter(floor(100+random(1100)),floor(random(800)), 100, 120));

}
