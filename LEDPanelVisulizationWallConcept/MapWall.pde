class MapWall {
  int h;
  int w;
  int x;
  int y;
  LocationMarker andreanof;
  LocationMarker tohoku;
  LocationMarker losAngeles;
  LocationMarker aceh;
  LocationMarker christChurch;
  LocationMarker valdivia;
  int state; // 0 - off , 1 - on, ...

  MapWall(int _x, int _y) {
    w = 192;
    h = 128;

    x = _x;
    y = _y;
    state = 0;
    andreanof = new LocationMarker(128,0,64,32,"Alaska, Andreanof");
    andreanof.setFrameCounter(200/6*1);
    tohoku = new LocationMarker(64,32,64,64,"Japan, Tohoku");
    tohoku.setFrameCounter(200/6*2);
    losAngeles = new LocationMarker(128,32,64,64,"USA, LosAngeles");
    losAngeles.setFrameCounter(200/6*3);
    aceh = new LocationMarker(0,64,64,32, "Indonesia, Aceh");
    aceh.setFrameCounter(200/6*4);
    christChurch = new LocationMarker(64,96,64,32, "New Zealand, ChristChurch");
    christChurch.setFrameCounter(200/6*5);
    valdivia = new LocationMarker(128,96,64,32, "Chile, Valdivia");
    valdivia.setFrameCounter((int)(200/6*5.5));
  

  }
  void setState (int newState) {
    state = newState;
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    if(state == 1) {
      // scott mills
      losAngeles.update();
      losAngeles.draw();
    } else if (state == 2) {
      // tohoku
      tohoku.update();
      tohoku.draw();
    } else if (state == 3) {
      // north ridge ?? 
      valdivia.update();
      valdivia.draw();

    } else if(state == 4) {
      // update all the panels
      andreanof.update();
      tohoku.update();
      losAngeles.update();
      aceh.update();
      christChurch.update();
      valdivia.update();
      // draw all the panels
      andreanof.draw();
      tohoku.draw();
      losAngeles.draw();
      aceh.draw();
      christChurch.draw();
      valdivia.draw();
    } else if (state == 0) {
      // draw nothing
    } else {
      // drawDebug();
    }
    

    fill(127);
    text("Map Wall", 32, h + 32);
    popMatrix();
  }
  void toggleDebug() {
    if(andreanof.getState() == -1) {
      andreanof.setState(0);
      tohoku.setState(0);
      losAngeles.setState(0);
      aceh.setState(0);
      christChurch.setState(0);
      valdivia.setState(0);
    } else {
      andreanof.setState(-1);
      tohoku.setState(-1);
      losAngeles.setState(-1);
      aceh.setState(-1);
      christChurch.setState(-1);
      valdivia.setState(-1);
    }
    // draw();

    // noStroke();
    // // Alaska
    // fill(80);
    // rect(0,0,64,32);

    // // LA USA
    // fill(100);
    // rect(0,32,64,64);

    // // Tohoku
    // fill(120);
    // rect(64,32,64,64);

    // // Chile
    // fill(160);
    // rect(0,96,64,32);

    // // New Zealand
    // fill(200);
    // rect(64,96,64,32);

    // // Indonesia
    // fill(255);
    // rect(128,96,64,32);
  }
}
