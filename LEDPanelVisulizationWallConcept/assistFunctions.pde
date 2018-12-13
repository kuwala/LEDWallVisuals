float easeOut( float t, float b, float c, float d) {
  // t: currentTime, b: start value
  // c: change in value, d: duration
  // time can be in frames or millis
  t = t / d;
  return -c * t*(t-2) + b;
}
