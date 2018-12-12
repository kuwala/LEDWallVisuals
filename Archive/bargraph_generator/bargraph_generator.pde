void setup() {
  size(800,300);
}

void draw() {
  translate(0,300);
  int bars = 32;
  float[] graph = new float[bars];
  for(int i = 0; i < bars; i ++ ) {
    graph[i] = (float)i / (bars);
    //println(graph[i]);
  }
  float barMaxHeight = 32;
  float barWidth = 16;
  for(int i = 0; i < bars; i++) {
    float h = graph[i] * barMaxHeight;
    rect(i*barWidth, -1*h, barWidth,h );
  }
  
}
