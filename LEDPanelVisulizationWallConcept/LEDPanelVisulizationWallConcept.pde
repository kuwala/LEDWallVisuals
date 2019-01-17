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

int scottBars = 126; // 128 - 14 // 512 pixels wide area

float[] scottData = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements

float[] northRidgeData = {};

int tohokuBars = 128;
float[] tohokuData = {0.016877636, 0.012658228, 0.025316456, 0.029535865, 0.029535865, 0.029535865, 0.029535865, 0.042194095, 0.05907173, 0.07172996, 0.08438819, 0.07594936, 0.101265825, 0.10970464, 0.15611814, 0.21097046, 0.29535866, 0.37974682, 0.51054853, 0.56540084, 0.5864979, 0.60337555, 0.51476794, 0.3586498, 0.31223628, 0.28691983, 0.33333334, 0.33755276, 0.21518987, 0.19409283, 0.19831224, 0.24472573, 0.2616034, 0.20675105, 0.16033755, 0.1392405, 0.101265825, 0.09282701, 0.10970464, 0.16033755, 0.20675105, 0.21097046, 0.19409283, 0.16455697, 0.16033755, 0.17721519, 0.31223628, 0.45147678, 0.47679326, 0.56540084, 0.6118143, 0.6455696, 0.6624473, 0.67932487, 0.8565401, 0.8649789, 0.8101266, 0.6835443, 0.6075949, 0.32489452, 0.278481, 0.30379745, 0.34599155, 0.3628692, 0.38396624, 0.38396624, 0.32489452, 0.23628692, 0.27004218, 0.30379745, 0.3206751, 0.33333334, 0.34177214, 0.32911393, 0.30801687, 0.25738397, 0.31223628, 0.32489452, 0.32489452, 0.31223628, 0.21518987, 0.18987341, 0.1814346, 0.16877638, 0.14767933, 0.12236287, 0.11392405, 0.10970464, 0.10548523, 0.11392405, 0.14345992, 0.15189873, 0.16033755, 0.16877638, 0.16033755, 0.16033755, 0.15611814, 0.15189873, 0.14767933, 0.1308017, 0.10548523, 0.088607594, 0.07594936, 0.07172996, 0.07172996, 0.07172996, 0.07172996, 0.07594936, 0.088607594, 0.101265825, 0.11814346, 0.12236287, 0.12236287, 0.11392405, 0.10970464, 0.10970464, 0.10970464, 0.09704641, 0.09704641, 0.09704641, 0.088607594, 0.080168776, 0.07172996, 0.06329114, 0.05907173, 0.050632913, 0.03797468, 0.03797468};

int scottTime = 34000; // 34 seconds - in millis

int state = 1; // 0 - attractor, 1, 2, 3. quakes

// * * * * * * * * * Labels * * * * * * * *
Label label1;
Label label2;
Label label3;
                                                        
// * * * * * Progress * * * * *
SpringGraph scottGraph;


// * * * * * MapWall * * * * *
MapWall mapWall;
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
  label2.turnDebug();
  label3 = new Label();
  label3.turnDebug();
  
  scottGraph = new SpringGraph(scottBars, scottData, scottTime);
  mapWall = new MapWall(800,100);

}
void draw() {
  
  
  /* * * * * UPDATES * * * * */
  mapWall.update();

  /* * * * * DRAWS * * * * * */
  //drawBackground();
  background(0);
  drawDebugInfo();
  
  /* * * * * * * * * * * * * * * * * * * * * */ 
  /* * * * * VISULIZATIONS WALL * * * * * * */
  /* * * * * * * * * * * * * * * * * * * * */ 
  // Move drawing origin to led Panel Start X Y locations
  // and rotate screen to allign with led Panels
  // translate(100, 100);
  pushMatrix();
  if (rotateScreen) {
    // rotate upside down 
    //rotate side ways
    translate(512,0);
    rotate(HALF_PI*3); 
    translate(-512,-512);
  }
  // * * * * * sections * * * * *
  // drawDebugSections();

  
  // * * * * * Labels * * * * *
  if(state==0) {
    //attract
  } else if (state==1) {
    //scott
    scottGraph.update();
    label1.turnOn();
    label2.turnDebug();
    label3.turnDebug();
  } else if (state == 2) {
    // north ridge
    label1.turnDebug();
    label2.turnOn();
    label3.turnDebug();
  } else if (state == 3) {
    // tohoku
    label1.turnDebug();
    label2.turnDebug();
    label3.turnOn();
  }
  pushMatrix();
  translate(1, 9); // move to section 1
  label1.draw();
  translate(170, 0); // move to section 2
  label2.draw();
  translate(170, 0); // move to section 3
  label3.draw();
  popMatrix();

  // * * * * * Graph * * * * *
  if(state== 1) {
  scottGraph.draw();
  }
  popMatrix();

  // * * * * * MapWall * * * * *
  mapWall.draw();


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

  if (key == '0') {
    state = 0;
  }
  if (key == '1') {
    state = 1;
    scottGraph.reset();
  }
  if (key == '2') {
    state = 2;
  }
  if (key == '3') {
    state = 3;
  }
}
