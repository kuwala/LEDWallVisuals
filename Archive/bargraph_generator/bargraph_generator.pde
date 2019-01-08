PImage img1;
PImage img2;
PImage img3;

int bars = 400;
float barMaxHeight = 237;
float barWidth = 2;

float[] graph = new float[bars];

void setup() {
  size(800,237);
  img1 = loadImage("Scott.png"); //800x237
  for(int i = 0; i < bars; i ++ ) {
    graph[i] = (float)i / (bars);
  }
}




void draw() {
  background(0);
  
  // load the 3 images
  // buttons 1,2,3 switch images
  // specify number of bars
  // draw a characture of the graph with the mouse
  // console prints an array compatible list of values
  image(img1, 0,0);
  
  translate(0,height);
  
  fill(0,0,0,160);
  for(int i = 0; i < bars; i++) {
    float h = graph[i] * barMaxHeight;
    rect(i*barWidth, -1*h, barWidth,h );
  }
  
}
void mouseDragged() {
  int i = floor(mouseX / barWidth);
  if(i < bars && i >= 0) { 
    float value = map(mouseY,height, 0, 0, 1);
    graph[i] = value;
    println(value);
  }
  
}

void keyPressed() {
  for(int i = 0; i < bars; i ++) {
    print(graph[i]);
    print(", ");
    
  }
}
