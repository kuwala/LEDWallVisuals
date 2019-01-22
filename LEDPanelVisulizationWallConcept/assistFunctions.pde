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
  pushMatrix();
  translate(32,710);
  text("FPS",4,0);
  text(frameRate, 40, 0);
  text(mouseX, 100, 0);
  text(mouseY, 130, 0);

  text("Press 'r' to rotate the visualization wall section", 160, 0); 
  text("Press '1,2,3'' to change graph.'6,7,8,9' to change activity'. Esc to exit.", 4,24);
  popMatrix();
}

void drawDebugSections() {
  fill(120);
  rect(0, 0, 171, 128);
  fill(90);
  rect(171, 0, 170, 128);
  fill(20);
  rect(341, 0, 170, 128);
}
