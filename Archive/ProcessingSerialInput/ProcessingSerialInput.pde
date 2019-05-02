import processing.serial.*;
Serial myPort;


void setup() {
    
  printArray(Serial.list());
  
  myPort = new Serial(this, Serial.list()[1], 115200);

}

void draw() {
  while (myPort.available() > 0) {
    int inByte = (char)myPort.read();
    println(inByte);
    if(inByte == 'A') {
      println("A recieved");
    }
    if(inByte == 'B') {
      println("B recieved");
    }
    if(inByte == 'C') {
      println("C recieved");
    }
    if(inByte == 'D') {
      println("D recieved");
    }
  }
}
