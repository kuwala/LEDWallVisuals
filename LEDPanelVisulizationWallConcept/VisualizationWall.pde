class VisualizationWall {
  int scottBars;
  int northRidgeBars;
  int tohokuBars;

  // do we need final keyword?
  final float[] scottData = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
  final float[] northRidgeData = {0.021097047, 0.021097047, 0.021097047, 0.021097047, 0.021097047, 0.025316456, 0.029535865, 0.029535865, 0.029535865, 0.029535865, 0.033755273, 0.03797468, 0.050632913, 0.05485232, 0.05485232, 0.05485232, 0.05485232, 0.05485232, 0.05485232, 0.067510545, 0.101265825, 0.14345992, 0.15611814, 0.15189873, 0.13502109, 0.12236287, 0.12236287, 0.16877638, 0.18565401, 0.2278481, 0.25738397, 0.28691983, 0.2616034, 0.24472573, 0.24050634, 0.2742616, 0.30379745, 0.32911393, 0.33755276, 0.3164557, 0.28691983, 0.20253165, 0.20253165, 0.22362868, 0.23628692, 0.20675105, 0.15611814, 0.19831224, 0.21097046, 0.20675105, 0.19831224, 0.17299578, 0.15611814, 0.2278481, 0.34599155, 0.38818565, 0.37130803, 0.33755276, 0.23206751, 0.25738397, 0.278481, 0.278481, 0.3206751, 0.34599155, 0.36708862, 0.3586498, 0.34177214, 0.32911393, 0.32911393, 0.45147678, 0.48523206, 0.5485232, 0.5611814, 0.556962, 0.5443038, 0.51476794, 0.2278481, 0.10548523, 0.08438819, 0.11814346, 0.15611814, 0.21097046, 0.23206751, 0.25316456, 0.35021096, 0.37130803, 0.34599155, 0.32911393, 0.32911393, 0.32911393, 0.33755276, 0.4050633, 0.59915614, 0.64978904, 0.65400845, 0.64978904, 0.60337555, 0.56540084, 0.5316456, 0.278481, 0.24050634, 0.14767933, 0.11814346, 0.12658228, 0.1392405, 0.20675105, 0.21097046, 0.20253165, 0.1814346, 0.16033755, 0.14345992, 0.19409283, 0.2278481, 0.23628692, 0.23628692, 0.23206751, 0.23628692, 0.3206751, 0.2742616, 0.21518987, 0.15611814, 0.10970464, 0.09704641, 0.09704641, 0.09282701, 0.09282701, 0.09282701, 0.088607594, 0.088607594, 0.088607594, 0.09704641, 0.12658228, 0.10970464, 0.09282701, 0.06329114, 0.05485232, 0.050632913, 0.042194095, 0.042194095, 0.03797468, 0.029535865, 0.033755273, 0.021097047, 0.0210};
  final float[] tohokuData = {0.016877636, 0.012658228, 0.025316456, 0.029535865, 0.029535865, 0.029535865, 0.029535865, 0.042194095, 0.05907173, 0.07172996, 0.08438819, 0.07594936, 0.101265825, 0.10970464, 0.15611814, 0.21097046, 0.29535866, 0.37974682, 0.51054853, 0.56540084, 0.5864979, 0.60337555, 0.51476794, 0.3586498, 0.31223628, 0.28691983, 0.33333334, 0.33755276, 0.21518987, 0.19409283, 0.19831224, 0.24472573, 0.2616034, 0.20675105, 0.16033755, 0.1392405, 0.101265825, 0.09282701, 0.10970464, 0.16033755, 0.20675105, 0.21097046, 0.19409283, 0.16455697, 0.16033755, 0.17721519, 0.31223628, 0.45147678, 0.47679326, 0.56540084, 0.6118143, 0.6455696, 0.6624473, 0.67932487, 0.8565401, 0.8649789, 0.8101266, 0.6835443, 0.6075949, 0.32489452, 0.278481, 0.30379745, 0.34599155, 0.3628692, 0.38396624, 0.38396624, 0.32489452, 0.23628692, 0.27004218, 0.30379745, 0.3206751, 0.33333334, 0.34177214, 0.32911393, 0.30801687, 0.25738397, 0.31223628, 0.32489452, 0.32489452, 0.31223628, 0.21518987, 0.18987341, 0.1814346, 0.16877638, 0.14767933, 0.12236287, 0.11392405, 0.10970464, 0.10548523, 0.11392405, 0.14345992, 0.15189873, 0.16033755, 0.16877638, 0.16033755, 0.16033755, 0.15611814, 0.15189873, 0.14767933, 0.1308017, 0.10548523, 0.088607594, 0.07594936, 0.07172996, 0.07172996, 0.07172996, 0.07172996, 0.07594936, 0.088607594, 0.101265825, 0.11814346, 0.12236287, 0.12236287, 0.11392405, 0.10970464, 0.10970464, 0.10970464, 0.09704641, 0.09704641, 0.09704641, 0.088607594, 0.080168776, 0.07172996, 0.06329114, 0.05907173, 0.050632913, 0.03797468, 0.03797468};

  int scottTime;
  int tohokuTime;
  int northRidgeTime;
  int state;
  int animationState;

  SpringGraph scottGraph;
  SpringGraph tohokuGraph;
  SpringGraph northRidgeGraph;

  int animationTimer;
  int scottStartTime;
  int scottCompleteTime;
  int scottActivityStartTime;
  int scottFadeOutTime;

  int tohokuStartTime;
  int tohokuCompleteTime;
  int tohokuActivityStartTime;
  int tohokuActivityStartTime2;
  int tohokuFadeOutTime;

  int northRidgeStartTime;
  int northRidgeCompleteTime;
  int northRidgeActivityStartTime;
  int northRidgeFadeOutTime;

  Label label1;
  Label label2;
  Label label3;

  boolean rotateScreen;

  VisualizationWall() {
    scottBars = 126; // 128 - 14 // 512 pixels wide area
    northRidgeBars = 128;
    tohokuBars = 128;

    scottTime = 43000; // 34 seconds - in millis
    tohokuTime = 60000;
    northRidgeTime = 20000;
    state = 0; // 0 - attractor, 1 - Scott, 2 - Tohoku, 3 - NorthRidge. quakes
    animationState = 0; // o - waiting for start dealy, 1 - started drawing graph
    rotateScreen = true;

    scottGraph = new SpringGraph(scottBars, scottData, scottTime, 1);
    tohokuGraph = new SpringGraph(tohokuBars, tohokuData, tohokuTime, 2);
    northRidgeGraph = new SpringGraph(northRidgeBars, northRidgeData, northRidgeTime, 3);

    // used for all 3
    animationTimer = 0;

    scottStartTime = 5000;
    scottActivityStartTime = 20000;
    scottFadeOutTime = 28000;
    scottCompleteTime = 30000;

    tohokuStartTime = 5000;
    tohokuActivityStartTime = 30000;
    tohokuActivityStartTime2 = 50000;
    tohokuFadeOutTime = 65000;
    tohokuCompleteTime = 70000;

    northRidgeStartTime = 5000;
    northRidgeActivityStartTime = 15000;
    northRidgeFadeOutTime = 25000;
    northRidgeCompleteTime = 30000;

    label1 = new Label(1);
    label1.turnOff();
    label2 = new Label(2);
    label2.turnOff();
    label3 = new Label(3);
    label3.turnOff();
  }
  void draw() {
    /* * * * * * * * * * * * * * * * * * * * * */ 
    /* * * * * VISULIZATIONS WALL * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * */ 
    // Move drawing origin to led Panel Start X Y locations
    // and rotate screen to allign with led Panels
    // translate(100, 100);
    pushMatrix();
    if (rotateScreen) {
      fill(100);
      text("Visualization Wall", 30, 540);
      translate(512,0);
      rotate(HALF_PI*3); 
      translate(-512,-512);
      
    } else {
      fill(100);
      text("Visualization Wall", 30, 180);
    }
    // drawDebugSections();

    
    if(state==0) {
      // * * * * * * * * * * * * * * * * * * * 
      // * * * * * * Atractor * * * * * * * * *
      // * * * * * * * * * * * * * * * * * * * 
    } else if (state==1) {
      // * * * * * * * * * * * * * * * * * * * 
      // * * * * * * Scott Mills * * * * * * *
      // * * * * * * * * * * * * * * * * * * * 
      // if delayTime passed draw
      if(animationState == 0) {
        // start the graph
        if(millis() - animationTimer > scottStartTime) {
        scottGraph.reset();
        animationState = 1;
        }
      } else if (animationState == 1){
        if(millis() - animationTimer > scottActivityStartTime) {
          //activity wall Animation starts
          animationState = 2;
        }
        scottGraph.update();
        scottGraph.draw();
      } else if (animationState == 2){
        if(millis() - animationTimer > scottFadeOutTime) {
          //fade out graph
          //fade out label
          label1.fadeOut();
          animationState = 3;
        }
        scottGraph.update();
        scottGraph.draw();
      } else if (animationState == 3){
        if(millis() - animationTimer > scottCompleteTime) {
          // return to the attracktor
          state = 0;
          animationState = 0;
        }
        scottGraph.update();
        scottGraph.draw();
      }

    } else if (state == 2) {
      // * * * * * * * * * * * * * * * * * * * 
      // * * * * * * * Tohoku * * * * * * * * *
      // * * * * * * * * * * * * * * * * * * * 
      if(animationState == 0) {
        // start the graph
        if(millis() - animationTimer > tohokuStartTime) {
        tohokuGraph.reset();
        animationState = 1;
        }
      } else if (animationState == 1){
        if(millis() - animationTimer > tohokuActivityStartTime) {
          //activity wall Animation starts
          animationState = 2;
        }
        tohokuGraph.update();
        tohokuGraph.draw();
      } else if (animationState == 2){
        if(millis() - animationTimer > tohokuFadeOutTime) {
          //fade out graph
          //fade out label
          label2.fadeOut();
          animationState = 3;
        }
        tohokuGraph.update();
        tohokuGraph.draw();
      } else if (animationState == 3){
        if(millis() - animationTimer > tohokuCompleteTime) {
          // return to the attracktor
          state = 0;
          animationState = 0;
        }
        // fade out graph 5secs
        // tohokuGraph.update();
        // tohokuGraph.draw();
      }
      
    } else if (state == 3) {
      // * * * * * * * * * * * * * * * * * * * 
      // * * * * * * North Ridge * * * * * * *
      // * * * * * * * * * * * * * * * * * * * 
      if(animationState == 0) {
        // start the graph
        if(millis() - animationTimer > northRidgeStartTime) {
        northRidgeGraph.reset();
        animationState = 1;
        }
      } else if (animationState == 1){
        if(millis() - animationTimer > northRidgeActivityStartTime) {
          //activity wall Animation starts
          animationState = 2;
        }
        northRidgeGraph.update();
        northRidgeGraph.draw();
      } else if (animationState == 2){
        if(millis() - animationTimer > northRidgeFadeOutTime) {
          //fade out graph
          //fade out label
          label3.fadeOut();
          animationState = 3;
        }
        northRidgeGraph.update();
        northRidgeGraph.draw();
      } else if (animationState == 3){
        if(millis() - animationTimer > northRidgeCompleteTime) {
          // return to the attracktor
          state = 0;
          animationState = 0;
        }
        // northRidgeGraph.update();
        // northRidgeGraph.draw();
      }
      
    }

    
    pushMatrix();
    translate(1, 9); // move to section 1
    label1.draw();
    translate(170, 0); // move to section 2
    label2.draw();
    translate(170, 0); // move to section 3
    label3.draw();
    popMatrix();

    popMatrix(); // end rotation
    
    
  } // end draw()
  void toggleRotation() {
    rotateScreen = !rotateScreen;
  }
  void turnOffLabels() {
    label1.turnOff();
    label2.turnOff();
    label3.turnOff();
  }
  void resetTimers() {
    animationTimer = millis();
  }
  void setState(int _state) {
    // start a quake animation
    state = _state;
    animationState = 0;
    if(state == 1) { 
      scottGraph.reset();
      resetTimers();
      turnOffLabels();
      label1.fadeIn();
    } else if(state == 2) {
      tohokuGraph.reset();
      resetTimers();
      turnOffLabels();
      label2.fadeIn();
    } else if(state == 3) {
      northRidgeGraph.reset();
      resetTimers();
      turnOffLabels();
      label3.fadeIn();
    } else if (state == 0) {
      label1.turnOff();
      label2.turnOff();
      label3.turnOff();
    }
    
  }
}