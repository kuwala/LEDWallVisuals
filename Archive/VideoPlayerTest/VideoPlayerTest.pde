//VideoPlayerTest
  
import processing.video.*;
Movie myMovie1;
Movie myMovie2;
Movie myMovie3;
int movieWidth = 1024;
int movieHeight = 768;
int movieSelector = 1;

void setup() {
  //size(1024,768);
  fullScreen();
  //frameRate(30);
  background(0);
  // movies go into data sub folder
  myMovie1 = new Movie(this, "ScottMills.mp4");
  myMovie2 = new Movie(this, "Tohoku.mp4");
  myMovie3 = new Movie(this, "NorthRidge.mp4");
  myMovie1.loop();
  myMovie2.loop();
  myMovie3.loop();
}

void draw() {
  
  if(movieSelector == 1) {
    if (myMovie1.available()) {
      myMovie1.read();
      image(myMovie1, 0, 0, movieWidth, movieHeight);

    }
  } else if (movieSelector == 2) {
    if (myMovie2.available()) {
      myMovie2.read();
          image(myMovie2, 0, 0, movieWidth, movieHeight);

    }
  } else if (movieSelector == 3) {
    if (myMovie3.available()) {
      myMovie3.read();
          image(myMovie3, 0, 0, movieWidth, movieHeight);

    }
  }
  
}

//void movieEvent(Movie m) {
//  m.read();
//}

void keyPressed() {
  //myMovie1.pause();
  //myMovie2.pause();
  //myMovie3.pause();
  if (key == '1') {
    myMovie1.jump(0);
    movieSelector = 1;
    //myMovie1.play();
    
  }
  if (key == '2') {
    myMovie2.jump(0);
    movieSelector = 2;
    //myMovie2.play();

  }
  if (key == '3') {
    myMovie3.jump(0);
    movieSelector = 3;
    //myMovie3.play();

  }

}

//void mousePressed() {
//  myMovie1.jump(0);
//}
