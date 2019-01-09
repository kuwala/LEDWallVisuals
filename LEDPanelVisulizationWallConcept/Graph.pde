class Graph {
  int paddingLeft;
  int paddingTop;
  int bars = 114; // 128 - 14 // 576 / 2 =
  float barMaxHeight;
  float barWidth;
  float[] scottGraph = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
  
  // Time in millis
  int timer; // timer to keep track of cpu millis
  int scottMillsTime; // 34000 millis
  int elapsedTime;
  int numberSegments; // each bar in the graph is a segment
  int segmentTime;
  int partialSegmentTime;// scottMillsTime
  float partial;
  int fullSegments;
  
  Graph() {
    bars = 114;
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
  void update() {
    
  }
  
  void draw(){
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
      color c =  color(136, 249, brightness);
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
