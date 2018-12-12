// Seismograph
int num_segments = 64;
IntList line_heights = new IntList();
float angle = 0;
float rate = 0.4;
float dampen = 1;
float dampen_rate = 0.01;
//Mover mov = new Mover(width/2,height/2);
Mover mov = new Mover(200,200);

void setup() {
  size(800,800);
  // array of line points
  // draw line segment
  // shift line segment down
  for(int i = 0; i < num_segments; i ++ ) {
    //line_heights.append((int)random(200));
    line_heights.append(0);
    
  }
  
}

void draw() {
  background(127);
  int x = 200;
  int y = 100;
  strokeWeight(1);
  int segment_width = 6;
  for(int i = 0; i < num_segments-1; i ++ ) {
    line(x + segment_width * i, y + line_heights.get(i), x + segment_width * (i+1), y + line_heights.get(i+1));
    
  }
  line_heights.remove(0);
  angle = angle + rate;
  int h = (int) (sin(angle)*100*dampen);
  if(dampen < 0) {
    dampen = 1;
    //dampen_rate = 0;
  }
  dampen-= dampen_rate;
  line_heights.append(h);
  mov.update();
  
  mov.display();
}
void mouseClicked() {
  mov.applyForce(new PVector(random(300)-150,random(300)-150)); 
}
