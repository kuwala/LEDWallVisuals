float easeOut( float t, float b, float c, float d) {
  // t: currentTime, b: start value
  // c: change in value, d: duration
  // time can be in frames or millis
  t = t / d;
  return -c * t*(t-2) + b;
}

void drawBackground() {
  background(60);
  //background(0);
}

/* * * * * * * * * * * DEBUG * * * * * * * * * * */
void drawDebugInfo() {
  fill(255);
  text(frameRate, 40, 40);
  text(mouseX, 100, 40);
  text(mouseY, 130, 40);


  text("Press 'r' or '1' '2' '3' to change settings", 160, 40); 
}

void drawDebugSections() {
  fill(120);
  rect(0, 0, 192, 128);
  fill(90);
  rect(192, 0, 192, 128);
  fill(20);
  rect(384, 0, 192, 128);
}
