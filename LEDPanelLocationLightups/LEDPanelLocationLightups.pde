// * * * * Lightup Spots * * * *
// Of the Earthquake Locations(3)
// Pulse the shape
// Gets Bigger and Slower
// Change Colors
float angle = PI;
float angleRate = 0.007;

float x = 32;
float y = 32;

float minSize = 1;
float maxSize = 64;
float targetSize =maxSize;
float size = minSize;
float easing = 0.05;
color colorStart = color(64,180,255,255);
color colorEnd = color(64,180,120,0);
int frameCounter = 0;
int maxFrames = 200;

void setup() {
  fullScreen();
  //frameRate(10);
  // 128*64
  // Panels 1*2
  //background(0);
}
void draw() {
  
  frameCounter = (frameCounter +1 ) % maxFrames;
  println(frameCounter);
  translate(100,100);
  angle += angleRate;
  //float difSize = maxSize - size;
  //size += difSize * easing;
  //if(maxSize - size < 1) {
  //  size = minSize;
  //}
  size = easeOut( frameCounter, minSize, targetSize, maxFrames);
  //if(size >= targetSize) {
  //  size = minSize;
  //}
  //size = 32+8 + cos(angle) *16;
  //size = map(abs(cos(angle)),0,1,minSize,maxSize);
  fill(0);
  //rect(0,0,64,64); // bg
  ellipseMode(CENTER);
  //color currentColor = lerpColor(colorStart, colorEnd, sin(angle));
  //fill(currentColor);
  fill(20,100,255,10);
  strokeWeight(2);
  stroke(0,255,200);
  ellipse(x,y,size,size);
  
  
}
float easeOut( float t, float b, float c, float d) {
  // t: currentTime, b: start value
  // c: change in value, d: duration
  // time can be in frames or millis
  t = t / d;
  return -c * t*(t-2) + b;
}
void mousePressed() {
  exit(); 
}
