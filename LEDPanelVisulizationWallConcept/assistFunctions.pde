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

  text("Press: 'r' to rotate the visualization wall section", 160, 0); 
  text("Press: 1 - Scott Mills, 2 - North Ridge, 3 - Tohoku to change graph. Esc to exit.", 4,24);

  text("Animation Timer: ",4,50);
  float animationTime = (float)(millis() - timer) /1000.0;
  text(animationTime, 100,50);

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
