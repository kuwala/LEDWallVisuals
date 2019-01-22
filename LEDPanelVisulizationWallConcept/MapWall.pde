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
    state = 1;
    andreanof = new LocationMarker(0,0,64,32);
    andreanof.setFrameCounter(200/6*1);
    tohoku = new LocationMarker(0,32,64,64);
    tohoku.setFrameCounter(200/6*2);
    losAngeles = new LocationMarker(64,32,64,64);
    losAngeles.setFrameCounter(200/6*3);
    aceh = new LocationMarker(0,96,64,32);
    aceh.setFrameCounter(200/6*4);
    christChurch = new LocationMarker(64,96,64,32);
    christChurch.setFrameCounter(200/6*5);
    valdivia = new LocationMarker(128,96,64,32);
    valdivia.setFrameCounter((int)(200/6*5.5));

  }
  void setState (int newState) {
    state = newState;
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    if(state == 1) {
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
    } else {
      drawDebug();
    }

    fill(127);
    text("Map Wall", 32, h + 32);
    popMatrix();
  }
  void drawDebug() {
    // Alask
    fill(80);
    rect(0,0,64,32);

    // LA USA
    fill(100);
    rect(0,32,64,64);

    // Tohoku
    fill(120);
    rect(64,32,64,64);

    // Chile
    fill(160);
    rect(0,96,64,32);

    // New Zealand
    fill(200);
    rect(64,96,64,32);

    // Indonesia
    fill(255);
    rect(128,96,64,32);
  }
}