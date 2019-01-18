class MapWall {
  int h;
  int w;
  int x;
  int y;
  MapWall(int _x, int _y) {
    w = 192;
    h = 128;

    x = _x;
    y = _y;

  }
  void draw() {
    // draw all the panels
    pushMatrix();
    translate(x, y);
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

    fill(127);
    text("Map Wall", 32, h + 32);
    popMatrix();
  }
}