// * * * * Progress Bar * * * *
// Grows in size over a set time. 30s
// 3 different times for the progress bars
// The bar represents the Earthquake Acceleration

// * * * * Lightup Spots * * * *
// Of the Earthquake Locations(3)
// Pulse the shape
// Gets Bigger and Slower

// Light up background for Title Labels
// Possibly stationary.
// Get Resolution of Sections
/*
Panels Size: 64*32 each


1x2

// Story Titles
9*4 Panels
576 * 128

*/

float[] scottGraph = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
color spot1Color = color(255,100,0);
color label1Color = color(100,255,0);
color progress1Color = color(0,100,255);

int state = 0; // 0 - Scott Mills, 1 - LA, 2 - Tokyo
float progress = 0;
void setup() {
  fullScreen();
  
}
void draw() {
  // Temporary Move screen into place
  translate(100,100);

  // Draw Title Section
  // BG
  fill(0);
  rect(0,0,192,128);
  fill(20);
  rect(192,0,192,128);
  fill(0);
  rect(384,0,192,128);

  // Labels 1, 2, 3
  pushMatrix();
  fill(255);
  rect( 4,32, 192 - 8,32);

  fill(127);
  translate(192,0);
  rect( 4,32, 192 - 8,32);
  fill (127);
  translate(192,0);
  rect( 4,32, 192 - 8,32);
  
  popMatrix();
  
  // Draw Progress Bar
  fill(127);
  rect(4, 64 + 4, (64 * 9) - 8, 64 - 8);
  // Create a shape with data points
  // Animate the shape on Over time.
  int bars = 32;
  float[] graph = new float[bars];
  for(int i = 0; i < bars; i ++ ) {
    graph[i] = (float)i / (bars);
    //println(graph[i]);
  }
  
  fill(255);
  //noStroke();
  //translate to the buttom right corner of the progress bargraph
  translate(0,128);
  float barMaxHeight = 32;
  float barWidth = 16;
  for(int i = 0; i < bars; i++) {
    float h = graph[i] * barMaxHeight;
    rect(i*barWidth, -1*h, barWidth,h );
  }
  
  // Draw Location Dot
  
  
  
}
void mousePressed() {
  exit();
}
