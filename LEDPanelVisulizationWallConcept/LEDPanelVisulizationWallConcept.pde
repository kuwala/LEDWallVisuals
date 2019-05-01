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

int masterState = 0; // 0 - attractor, 1, 2, 3. quakes

// * * * * * LED Panel section walls * * * * *
MapWall mapWall;
ActivityWall activityWall;
VisualizationWall visualizationWall;

// Toggle Controll Variables
Orchestrator orchestrator;
boolean rotateScreen = true;

int timer
;


void setup() {
  // Processing sketch Spans multiple displays
  // PC is plugged into VGA (display 3)
  // Sender cards are on (display 1 | 2) duplicated/mirrored
  // All 3 are set to 1024x768 resolution
  fullScreen(SPAN);
  //fullScreen();
  frameRate(60);
  colorMode(HSB,255);
  
  mapWall = new MapWall(800,100);
  activityWall = new ActivityWall(400,0);
  visualizationWall = new VisualizationWall();

  // orchestrator = new Orchestrator();

}
void draw() {
  //visualizationWall.draw();
  //activityWall.draw();
  //mapWall.draw();
  //translate(1024,0);
  background(0);
  //fill(0);
  //rect(0,0,1024,768);
  //// drawBackground(); 
  visualizationWall.draw();
  activityWall.draw();
  mapWall.draw();
  drawDebugInfo();
  copy(0,0,1024,768,1024,0,1024,768);

 
  
  
  
} // end of main draw() 
void drawLabels() {

}
void mousePressed() {
  if(mouseX < 100) {
    exit();
  }
}

void keyPressed() {
  //background(127);
  timer = millis();
  if (key == 'r') {
    visualizationWall.toggleRotation();
    activityWall.toggleRotation();
  }

  if (key == '0') {
    // stop everything
    masterState = 0;
    visualizationWall.setState(0);
    mapWall.setState(0);
  }
  if (key == '1') {
    // Scott Mills
    masterState = 1;
    visualizationWall.setState(1);
    mapWall.setState(1);
    activityWall.setState(1);
  }
  if (key == '2') {
    // Tohoku
    masterState = 2;
    visualizationWall.setState(2);
    mapWall.setState(2);
    activityWall.setState(2);
  }
  if (key == '3') {
    // North Ridge
    masterState = 3;
    visualizationWall.setState(3);
    mapWall.setState(3);
    activityWall.setState(3);
  }
  if (key == '4') {
    // turn on all mapwall panel
    masterState = 4;
    mapWall.setState(4);
  }
  if (key == 'd') {
    // North Ridge
    mapWall.toggleDebug();
  }


  // activity wall controls
  if (key == '6') {
    activityWall.setState(0);
  }
  if (key == '7') {
    activityWall.setState(1);
  }
  if (key == '8') {
    activityWall.setState(2);
  }
  if (key == '9') {
    activityWall.setState(3);
  }

}
