
class Orchestrator {
  // optimize to: array of event tuples
  // 2d array of ints for now
  // {{timeOfEvent, eventType}, ...}
  int recordings[][];

  Orchestrator() {
    recordings = new int[32][2];

    recordings[1][1] = 2;
    println(recordings[1][1]);

  }
  void update() {

  }
  void stopRecording() {

  }
  void startRecording() {

  }
  void play() {

  }
  void record(int timeStamp, int eventType) {
    //adds event and time to the recordings array

  }
}