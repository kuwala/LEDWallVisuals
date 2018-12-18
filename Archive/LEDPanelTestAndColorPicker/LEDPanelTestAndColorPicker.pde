void setup() {
  fullScreen();
 //size(128,64);
}

float angle = 0;
float rate = 0.003;
float angle2 = 0;
float rate2 = 0.0033;
color shapeColor = color(255,100,0);
void draw() {
  
  background(127);
  fill(0);
  rect(100,100,128,64);
  
  
  
  //rect(10,10,10,10);
  //float shapeWidth = 128 * sin(angle);
  float shapeWidth = 0 + abs((128 * sin(angle)));
  angle = angle + rate;
  angle2 = angle2 + rate2;
  float shapeHeight = 32 + abs((32* sin(angle2)));
  colorMode(HSB);
  float hue = map(mouseX, 0, 1280, 0, 255);
  float sat = map(mouseY, 0, 1024, 0, 255);
  shapeColor = color(hue,sat,255);
  
  fill(shapeColor);
  //1280 x 1024
  //float shapeHeight = map(mouseY, 0,1024,0,64);
  rect(100,100,shapeWidth,shapeHeight);
  colorMode(RGB);
  fill(255);
  text("Click to exit. \nMove mouse up and down to change color saturation \nMove mouse right and left to change color hue",64,300);
  text("H S V: ",64, 360);
  text(hue, 120,360);
  text(sat, 180,360);
  text("255.000", 240, 360);
  drawColorPicker();
}
void drawColorPicker() {
    // draw color picker
  int numberOfStrips = 32;
  for(int i = 0 ; i < numberOfStrips; i ++ ) {
     float stripWidth = width/numberOfStrips;
     float stripHeight = 64;
     float y = height - stripHeight;
     float x = i * stripWidth;
     colorMode(HSB);
     float stripHue = map(i, 0, 32, 0, 255);
     fill(stripHue,255,255);
     rect(x,y,stripWidth,stripHeight);
     colorMode(RGB);
  }
}

void mousePressed() {
  exit();
}

//void keyPressed() {
//  switch(key) {
//    case '1':
//    brightness = map(0,0,3,0,255);
//    break;
//    case '2':
//    brightness = map(1,0,3,0,255);
//    break;
//    case '3':
//    brightness = map(2,0,3,0,255);
//    break;
//    case '4':
//    brightness = map(3,0,3,0,255);
//    break;
   
//  }
    
//}
