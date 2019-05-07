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
boolean rotateScreen = true;

int timer;

import processing.serial.*;
Serial myPort;
int inByte;


void setup() {
  // Processing sketch Spans multiple displays
  // PC is plugged into VGA (display 3)
  // Sender cards are on (display 1 | 2) duplicated/mirrored
  // All 3 are set to 1024x768 resolution
  fullScreen(SPAN);
  // fullScreen();
  // size(1024, 768);
  frameRate(60);
  colorMode(HSB,255);
  
  mapWall = new MapWall(800,100);
  activityWall = new ActivityWall(400,0);
  visualizationWall = new VisualizationWall();

  printArray(Serial.list());
  int comPortIndex = 0;
  if(Serial.list().length >= comPortIndex+1)  {
      myPort = new Serial(this, Serial.list()[0], 115200);
      print("Connecting to Serial on: ");
      println(Serial.list()[comPortIndex]);
  } else {
    println("Com port error. Check Serial.list() and comPortIndex in LEDPanelVisulizationWallCacept.pde.");
    exit();
  }
  // start in attractor mode();
  mapWall.setState(4); // set to attractor

}
void draw() {
  
  background(0);
  //fill(0);
  //rect(0,0,1024,768);
  //// drawBackground(); 
  visualizationWall.draw();
  activityWall.draw();
  mapWall.draw();
  drawDebugInfo();
  //mouse debugger
  // fill(200);
  // rect(mouseX, mouseY, 20,20);

  copy(0,0,1024,768,1024,0,1024,768);

  // Serial
  while (myPort.available() > 0) {
    inByte = (char)myPort.read();
    //println(inByte);
    if(inByte == 'A') { // quake 1
      println("A recieved");
      keyPressed(); 
    }
    if(inByte == 'B') { // quake 2
      println("B recieved");
      keyPressed(); 
    }
    if(inByte == 'C') { // quake 3
      println("C recieved");
      keyPressed(); 
    }
    if(inByte == 'D') { // Stop Pressed
      println("D recieved");
      keyPressed(); 
    }
    if(inByte == 'E') { // Stop Pressed
      println("E recieved");
      keyPressed(); 
    }
    inByte = 0;
  }
  
  
} // end of main draw() 

void keyPressed() {
  char serialIn = 'g';
  timer = millis();
  if (key == 'r'|| inByte == 'r') {
    visualizationWall.toggleRotation();
    activityWall.toggleRotation();
  }

  if (key == '0' || inByte == 'D') {
    // stop everything
    visualizationWall.setState(0);
    mapWall.setState(0);
  }
  if (key == '1' || inByte == 'A') {
    // Scott Mills
    visualizationWall.setState(1);
    mapWall.setState(1);
    activityWall.setState(1);
  }
  if (key == '2' || inByte == 'B') {
    // North Ridge
    visualizationWall.setState(2);
    mapWall.setState(2);
    activityWall.setState(2);
  }
  if (key == '3' || inByte == 'C') {
    // Tohoku
    visualizationWall.setState(3);
    mapWall.setState(3);
    activityWall.setState(3);
  }
  if (key == '4') {
    // turn on all mapwall panel
    mapWall.setState(4);
  }
  if (key == '5') {
    // turn on all mapwall panel
    mapWall.setState(5);
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
