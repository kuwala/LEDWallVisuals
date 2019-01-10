import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LEDPanelVisulizationWallConcept extends PApplet {

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

int scottBars = 114; // 128 - 14 // 576pixels wide area
float[] scottData = { 0.33333334f, 0.29113925f, 0.17721519f, 0.19831224f, 0.18565401f, 0.17299578f, 0.22362868f, 0.23206751f, 0.25738397f, 0.33333334f, 0.4008439f, 0.6118143f, 0.8101266f, 0.8101266f, 0.8565401f, 0.9704641f, 0.9746835f, 0.9409283f, 0.87763715f, 0.8101266f, 0.721519f, 0.814346f, 0.814346f, 0.7172996f, 0.65400845f, 0.65400845f, 0.6329114f, 0.60337555f, 0.5527426f, 0.42194092f, 0.38396624f, 0.35443038f, 0.33333334f, 0.32489452f, 0.4177215f, 0.4177215f, 0.4177215f, 0.36708862f, 0.34177214f, 0.4008439f, 0.38818565f, 0.45147678f, 0.4599156f, 0.38818565f, 0.38818565f, 0.34177214f, 0.3164557f, 0.31223628f, 0.3206751f, 0.3206751f, 0.4599156f, 0.46413502f, 0.39240506f, 0.32911393f, 0.3206751f, 0.35021096f, 0.29113925f, 0.21097046f, 0.21097046f, 0.21518987f, 0.23206751f, 0.2278481f, 0.18565401f, 0.14767933f, 0.14767933f, 0.16877638f, 0.20675105f, 0.21097046f, 0.21097046f, 0.1814346f, 0.17721519f, 0.17299578f, 0.16877638f, 0.15189873f, 0.1392405f, 0.1308017f, 0.12658228f, 0.10970464f, 0.10548523f, 0.101265825f, 0.09704641f, 0.09704641f, 0.11392405f, 0.18987341f, 0.21518987f, 0.21518987f, 0.17299578f, 0.1308017f, 0.12236287f, 0.12236287f, 0.21097046f, 0.21097046f, 0.21097046f, 0.14345992f, 0.10970464f, 0.09704641f, 0.1308017f, 0.16033755f, 0.15189873f, 0.11814346f, 0.11814346f, 0.12658228f, 0.13502109f, 0.11392405f, 0.08438819f, 0.06329114f, 0.05907173f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07172996f, 0.07172996f, 0.05907173f, 0.05485232f, 0.05485232f, 0.050632913f, 0.046413504f, 0.042194095f, 0.042194095f, 0.03797468f, 0.03797468f, 0.03797468f, 0.033755273f, 0.029535865f, 0.029535865f, 0.021097047f }; //128 elements

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


public void setup() {
  
  frameRate(60);
  colorMode(HSB,255);
  label1 = new Label();
  label1.turnOn();
  label2 = new Label();
  label3 = new Label();
  
  scottGraph = new Graph(scottBars, scottData);

}
public void draw() {
  //drawBackground();
  background(0);
  //drawDebugInfo();
  
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
public void mousePressed() {
  if(mouseX < 100) {
    exit();
  }
}

public void keyPressed() {
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
public float easeOut( float t, float b, float c, float d) {
  // t: currentTime, b: start value
  // c: change in value, d: duration
  // time can be in frames or millis
  t = t / d;
  return -c * t*(t-2) + b;
}

public void drawBackground() {
  background(60);
  //background(0);
}

/* * * * * * * * * * * DEBUG * * * * * * * * * * */
public void drawDebugInfo() {
  fill(255);
  text(frameRate, 40, 40);
  text(mouseX, 100, 40);
  text(mouseY, 130, 40);


  text("Press 'r' or '1' '2' '3' to change settings", 160, 40); 
}

public void drawDebugSections() {
  fill(120);
  rect(0, 0, 192, 128);
  fill(90);
  rect(192, 0, 192, 128);
  fill(20);
  rect(384, 0, 192, 128);
}
class Graph {
  int paddingLeft;
  int paddingTop;
  int bars = 114; // 128 - 14 // 576 / 2 =
  float barMaxHeight;
  float barWidth;
  float[] scottGraph;// = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
  
  // Time in millis
  int timer; // timer to keep track of cpu millis
  int scottMillsTime; // 34000 millis
  int elapsedTime;
  int numberSegments; // each bar in the graph is a segment
  int segmentTime;
  int partialSegmentTime;// scottMillsTime
  float partial;
  int fullSegments;
  
  Graph(int _bars, float[] array) {
    bars = _bars;//114;
    scottGraph = array;
    barMaxHeight = 32;
    barWidth = 4;
    paddingLeft = 4;
    paddingTop = 128 -12;
    partial = 0;
    
    timer = 0; // timer to keep track of cpu millis
    scottMillsTime = 34000; // 34000 millis
    elapsedTime = 0;
    numberSegments = bars; // each bar in the graph is a segment
    segmentTime = floor(scottMillsTime / bars);
    partialSegmentTime = 0; // scottMillsTime

  }
  public void update() {
    
  }
  
  public void draw(){
    // Timer stuff
    elapsedTime = millis() - timer;
    if(elapsedTime >= scottMillsTime) {
      timer = millis();
      elapsedTime = millis() - timer;
    }
    //float progressPercent = (float)elapsedTime / (float)scottMillsTime;
    
    fullSegments = floor(elapsedTime / segmentTime);
    partial = ((float)elapsedTime - (float)fullSegments * (float)segmentTime); 
    
    //translate to the buttom right corner of where the progress bargraph starts
    translate(paddingLeft,paddingTop);
    
    //* * * * * * * * * * * * * Draw Progress Bar * * * * * * * * * * * * */
    // Create a shape with data points
    // Animate the shape Over time

     noStroke();
    // Draw filled in segments
    for (int i = 0; i < fullSegments; i ++) {
       if(barColorToggle) {
          fill(39, 242, 255); // warm
        } else {
          int fade = (int)map(i,0,100,255,0);
          println(fade);
          fill(136, 249, 255);
        }
      float h = scottGraph[i] * barMaxHeight;
      rect(i*barWidth, -1*h, barWidth, h );
    }
    // Draw partial segment
    if(fullSegments < numberSegments) {
      // fill the color based on how filled the partial segment is
      
      float part = ((partial / segmentTime));
      float brightness = lerp(0,255,part);
      int c =  color(136, 249, brightness);
      fill(c);
      int i = fullSegments;
      float h = scottGraph[i] * barMaxHeight;
      rect(i*barWidth, -1*h*part, barWidth, h );
    }
    // Draw Emtpy Segments if any
    for (int i = fullSegments + 1; i < numberSegments; i ++) {
      //fill(255);
      //float h = scottGraph[i] * barMaxHeight;
      //rect(i*barWidth, -1*h, barWidth, h );
    }
    
  } // end draw
  
}
class Label {
  int blueColor;
  int accentColor;
  int bgColor;
  int yellowColor;
  int offColor;
  PGraphics graphics;
  
  // height, width
  int h;
  int w;
  int paddingLeft;
  int paddingTop;
  
  int state;
  
  Label() {
    colorMode(HSB,255);
    blueColor = color(136, 249, 255); // blue
    accentColor = color(136,100,255);
    offColor = color(0);
    bgColor = color(0);

    yellowColor = color(39, 242, 255); // orange/yellow
    h = 26; // height
    w = 192 - 8; // width
    paddingLeft = 4;
    paddingTop = 32;
    
    state = 0; // 0 off 1 on
    
    graphics = createGraphics(w, h);
    graphics.beginDraw();
    graphics.noStroke();
    graphics.rectMode(CENTER);
    graphics.endDraw();
   
  }
  public void update() {
   
  }
  public void turnOn() {
    state = 1;
  }
  public void turnOff() {
    state = 0; 
  }
  public void draw() {
    if(state == 0) {
      
    } else if (state == 1) {
      // label is on
      // pulse effect
      graphics.beginDraw();
      graphics.fill(blueColor);
      graphics.rect(w/2, h/2, w, h);
      graphics.endDraw();
      pushMatrix();
      translate(paddingLeft, paddingTop);
      image(graphics,0,0);
      popMatrix();
    } else if (state == 2) {
      // debug state for alignment
      graphics.beginDraw();

      graphics.fill(100);
      graphics.rect(w/2, h/2, w, h);
      graphics.endDraw();
      pushMatrix();
      translate(paddingLeft, paddingTop);
      image(graphics,0,0);
      popMatrix();
    }
    
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LEDPanelVisulizationWallConcept" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
