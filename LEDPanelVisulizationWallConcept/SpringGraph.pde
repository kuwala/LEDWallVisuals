/* class for drawing bar graphs
and animating them with spring physics. */
class SpringGraph {
  int paddingLeft;
  int paddingTop;
  int bars;
  float barMaxHeight;
  float barWidth;
  float totalWidth;
  float[] scottGraph;
  
  // Time in millis
  int timer; // timer to keep track of cpu millis
  int scottMillsTime; // 34000 millis
  int elapsedTime;
  int numberSegments; // each bar in the graph is a segment
  int segmentTime;
  int partialSegmentTime;// scottMillsTime
  float partial;
  int fullSegments;

  ArrayList<Spring> springs;
  int numberSprings;
  int lastFlickedSpring;

  SpringGraph(int _bars, float[] dataArray, int graphTime) {

    bars = _bars;//114;
    numberSprings = _bars;
    scottGraph = dataArray;
    barMaxHeight = 32;
    barWidth = 4;
    totalWidth = 512;
    paddingLeft = 4;
    paddingTop = 128 -12;
    partial = 0;
    
    timer = 0; // timer to keep track of cpu millis
    scottMillsTime = graphTime; // 34000 millis
    elapsedTime = 0;
    numberSegments = bars; // each bar in the graph is a segment
    segmentTime = floor(scottMillsTime / bars);
    partialSegmentTime = 0; // scottMillsTime

    // springs
    springs = new ArrayList<Spring>();
    int numberSegments = _bars;

    int spaceBetween = (int)totalWidth / numberSprings;

    for (int i = 0; i < numberSprings; i ++ ) {
      float springLength = dataArray[i] * barMaxHeight;
      springs.add(new Spring(i*spaceBetween, 100, springLength));
    }
    lastFlickedSpring = -1;

  }
  void update() {
    for (Spring i : springs) {
      i.update();
    }

    // Timers
    elapsedTime = millis() - timer;
    if(elapsedTime >= scottMillsTime) {
      timer = millis();
      elapsedTime = millis() - timer;
    }    
    fullSegments = floor(elapsedTime / segmentTime);
    partial = ((float)elapsedTime - (float)fullSegments * (float)segmentTime); 
    
    // flick the spring under the cursor as soon as the cursor moves onto it
    if(fullSegments != lastFlickedSpring) {
      flick(fullSegments,0.35); // Adjustable Here
      lastFlickedSpring = fullSegments;
    }

    
  } // end update

  void draw() {
    //translate to the buttom right corner of where the progress bargraph starts
    pushMatrix();
    translate(paddingLeft,paddingTop);
    noStroke();
    colorMode(HSB,255);
    for (int i = 0; i < fullSegments; ++i) {
      fill(136, 249, 255);
      float h = springs.get(i).getH();
      rect(i*barWidth, -1*h, barWidth, h);
    }

     // Draw partial segment
    if(fullSegments < numberSegments) {
      // fill the color based on how filled the partial segment is
      
      float part = ((partial / segmentTime));
      float brightness = lerp(0,255,part);
      color c =  color(136, 249, brightness);
      fill(c);
      int i = fullSegments;
      float h = scottGraph[i] * barMaxHeight;
      rect(i*barWidth, 0, barWidth, -1*h );
    }
    // Draw Emtpy Segments if any
    // for (int i = fullSegments + 1; i < numberSegments; i ++) {
      //fill(255);
      //float h = scottGraph[i] * barMaxHeight;
      //rect(i*barWidth, -1*h, barWidth, h );
    // }

    popMatrix();
  } // end draw

  void flick(int pos, float force) {
    if(pos < numberSprings && pos >=0) {
      springs.get(pos).flick(force);
    }
  }
  
}
