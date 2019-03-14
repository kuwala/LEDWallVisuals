// Autonomous Agents
// https://natureofcode.com/book/chapter-6-autonomous-agents/
Vehicle v;
boolean toggle = false;
void setup() {
  size(600,600);
v = new Vehicle(width, height);
}
void draw() {
  if(toggle) {
    v.seek(new PVector(mouseX, mouseY));
  } else {
    v.flee(new PVector(mouseX, mouseY));

  }

  v.update();
  v.display();

  fill(255);
  rect(mouseX,mouseY, 5,5);

}

void mouseClicked() {
  print("clicked");
  toggle = !toggle;

}