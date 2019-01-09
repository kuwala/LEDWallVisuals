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
 
 // Visulization Titles
 9*4 Panels
 576 * 128
 */

//int bars = 114; // 128 - 14 // 576 / 2 =
//float barMaxHeight = 32;
//float barWidth = 4;
//float[] scottGraph = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements

// * * * * * * * * * Labels * * * * * * * *
Label label1;
Label label2;
Label label3;

// * * * * * Progress * * * * *
Graph scottGraph;

//// Time in millis
//int timer = 0; // timer to keep track of cpu millis
//int scottMillsTime = 34000; // 34000 millis
//int elapsedTime = 0;
//int numberSegments = bars; // each bar in the graph is a segment
//int segmentTime = floor(scottMillsTime / bars);
//int partialSegmentTime = 0; // scottMillsTime 

// Toggle Controll Variables
boolean animationToggle = true;
boolean rotateScreen = true;
boolean barColorToggle = false;


void setup() {
  fullScreen();
  frameRate(60);
  colorMode(HSB,255);
  label1 = new Label();
  label1.turnOn();
  label2 = new Label();
  label3 = new Label();
  
  scottGraph = new Graph();

}
void draw() {
  //drawBackground();
  background(0);
  drawDebugInfo();
  
  // Move drawing origin to led Panel Start X Y locations
  // and rotate screen to allign with led Panels
  //translate(100, 100);
  if (rotateScreen) {
    rotate(HALF_PI); 
    translate(0, -128);
  }

  // * * * * * sections * * * * *
 //drawDebugSections();

  
 // * * * * * Labels * * * * *
  pushMatrix();
  // padding adjustment
  translate(0, 9);
  // move to section 1
  label1.draw();
  // move to section 2
  translate(192, 0);
  label1.draw();
  // move to section 3
  translate(192, 0);
  label1.draw();


  popMatrix();


  // Draw the Graph
  scottGraph.draw();

}
void mousePressed() {
  if(mouseX < 100) {
    exit();
  }
}

void keyPressed() {
  //background(127);
  if (key == 'r') {
    rotateScreen = !rotateScreen;
  }
  if (key == '1') {
    //elapsedTime = 0;
    //timer = millis();
  }
  if (key == '2') {
    animationToggle = !animationToggle;
  }
  if (key == '3') {
    barColorToggle = !barColorToggle;
  }
}
