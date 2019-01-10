import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class graph_background_waves extends PApplet {

boolean barColorToggle = false;
float[] scottGraph = { 0.33333334f, 0.29113925f, 0.17721519f, 0.19831224f, 0.18565401f, 0.17299578f, 0.22362868f, 0.23206751f, 0.25738397f, 0.33333334f, 0.4008439f, 0.6118143f, 0.8101266f, 0.8101266f, 0.8565401f, 0.9704641f, 0.9746835f, 0.9409283f, 0.87763715f, 0.8101266f, 0.721519f, 0.814346f, 0.814346f, 0.7172996f, 0.65400845f, 0.65400845f, 0.6329114f, 0.60337555f, 0.5527426f, 0.42194092f, 0.38396624f, 0.35443038f, 0.33333334f, 0.32489452f, 0.4177215f, 0.4177215f, 0.4177215f, 0.36708862f, 0.34177214f, 0.4008439f, 0.38818565f, 0.45147678f, 0.4599156f, 0.38818565f, 0.38818565f, 0.34177214f, 0.3164557f, 0.31223628f, 0.3206751f, 0.3206751f, 0.4599156f, 0.46413502f, 0.39240506f, 0.32911393f, 0.3206751f, 0.35021096f, 0.29113925f, 0.21097046f, 0.21097046f, 0.21518987f, 0.23206751f, 0.2278481f, 0.18565401f, 0.14767933f, 0.14767933f, 0.16877638f, 0.20675105f, 0.21097046f, 0.21097046f, 0.1814346f, 0.17721519f, 0.17299578f, 0.16877638f, 0.15189873f, 0.1392405f, 0.1308017f, 0.12658228f, 0.10970464f, 0.10548523f, 0.101265825f, 0.09704641f, 0.09704641f, 0.11392405f, 0.18987341f, 0.21518987f, 0.21518987f, 0.17299578f, 0.1308017f, 0.12236287f, 0.12236287f, 0.21097046f, 0.21097046f, 0.21097046f, 0.14345992f, 0.10970464f, 0.09704641f, 0.1308017f, 0.16033755f, 0.15189873f, 0.11814346f, 0.11814346f, 0.12658228f, 0.13502109f, 0.11392405f, 0.08438819f, 0.06329114f, 0.05907173f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07594936f, 0.07172996f, 0.07172996f, 0.05907173f, 0.05485232f, 0.05485232f, 0.050632913f, 0.046413504f, 0.042194095f, 0.042194095f, 0.03797468f, 0.03797468f, 0.03797468f, 0.033755273f, 0.029535865f, 0.029535865f, 0.021097047f }; //128 elements
int bars = 114;
Graph graph;
Spring spring;
SpringArray springArray;
SpringGraph springGraph;

int numberSprings = 40;
public void setup() {
  
  colorMode(HSB,255);
  spring = new Spring(200,200, 20);
  graph = new Graph(bars, scottGraph);
  springArray = new SpringArray(width,numberSprings);
  springGraph = new SpringGraph(bars, scottGraph);
}

public void draw() {
	background(0);
	fill(120);
	text("Left and Right click mouse to flick the springs.", 16,16);
	text("Rightclick - MouseX, selects spring, MouseY is flick force.",16,38);
	// graph.update();
 	// graph.draw();
 	// graph.drawSprings();
  // update Graph
  springArray.update();
  springArray.draw();
  springGraph.update();
  springGraph.drawSprings();
  fill(255,255,255);
  rect(0,0,16,16);
  
}

public void mousePressed() {
  if(mouseX < 16 && mouseY < 16) {
    exit();
  } 
  if(mouseButton == LEFT) {
	int pos = (int)map(mouseX, 0, width, 0, numberSprings);
  	float force = map(mouseY, 0, height, 0,40);
  	// springGraph.flick2(pos,force);
  	springArray.flick(pos);
  } else if (mouseButton == RIGHT) {
  	int pos = (int)map(mouseX, 0, width, 0, numberSprings);
  	float force = map(mouseY, 0, height, 0,40);
  	springArray.flick2(pos,force);
  	// springGraph.flick(pos);
  }
  	
}
class Graph {
  int paddingLeft;
  int paddingTop;
  int bars = 114; // 128 - 14 // 576 / 2 =
  float barMaxHeight;
  float barWidth;
  float[] scottGraph;// = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
  
  // Time in millis
  int timer; // timer to keep track of cpu millis
  int scottMillsTime; // 34000 millis
  int elapsedTime;
  int numberSegments; // each bar in the graph is a segment
  int segmentTime;
  int partialSegmentTime;// scottMillsTime
  float partial;
  int fullSegments;
  SpringArray springs;
  
  Graph(int _bars, float[] array) {
    springs = new SpringArray(576,124); // 500 width, 100 springs 5px spread
    bars = _bars;//114;
    scottGraph = array;
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
  public void update() {
    springs.update();
    
  }
  public void drawSprings() {
    springs.draw();
  }
  
  public void draw(){
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
    pushMatrix();
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
      int c =  color(136, 249, brightness);
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
    popMatrix();
  } // end draw
  
}
class Spring {
	PVector position;
    float velocity;
    float flickForce;
    float acceleration;
    float targetHeight;
    float w; // width
    float h; // height
    float argetHeight;
    
	Spring(float _x, float _y, float _h) {
		position = new PVector(_x, _y);
		targetHeight = _h;
		h = _h;
		w = 4;
		velocity = 0;
		acceleration = 0;
	}
	public void flick2(float force) {
		flickForce += force;
	}
	public void flick() {
		h = targetHeight *1.5f;
	}
	public void update() {
		float x = h - targetHeight;
	    //spring structure
	    float dampenning = 0.015f*velocity;
	    float k = 0.0025f;
	    float springForce = -k * x -dampenning;
	    
	    acceleration = springForce + flickForce;
	    flickForce = 0; // applied one time
	    velocity += acceleration;
	    h += velocity;
	}
	public float getH() {
		return h;
	}
	public void draw() {
		pushMatrix();
		translate(position.x, position.y);
		fill(200,0,220);
		rect(0,0,w,h);
		ellipse(w/2,h,10,10);
		popMatrix();
	}

}
class SpringArray {
	ArrayList<Spring> springs;
	int numberSprings;
	SpringArray(float widthOfSpace,int _num) {
		springs = new ArrayList<Spring>();
		numberSprings = _num;
		int spaceBetween = (int)widthOfSpace / numberSprings;

		for (int i = 0; i < numberSprings; i++) {
			springs.add(new Spring(i*spaceBetween, 100, 10*i));
		}
	}
	public void flick(int pos) {
		if(pos < numberSprings && pos >= 0) {
			springs.get(pos).flick();


		}
	}
	public void flick2(int pos, float force) {
		if(pos < numberSprings && pos >=0) {
			springs.get(pos).flick2(force);
		}
	}
	public void update() {
		for (Spring i : springs) {
			i.update();
		}
	}
	public void draw() {
		for (int i = 0; i < springs.size(); ++i) {
			springs.get(i).draw();
			
		}
	}

}
class SpringGraph {
  int paddingLeft;
  int paddingTop;
  int bars = 114; // 128 - 14 // 576 / 2 =
  float barMaxHeight;
  float barWidth;
  float totalWidth;
  float[] scottGraph;// = { 0.33333334, 0.29113925, 0.17721519, 0.19831224, 0.18565401, 0.17299578, 0.22362868, 0.23206751, 0.25738397, 0.33333334, 0.4008439, 0.6118143, 0.8101266, 0.8101266, 0.8565401, 0.9704641, 0.9746835, 0.9409283, 0.87763715, 0.8101266, 0.721519, 0.814346, 0.814346, 0.7172996, 0.65400845, 0.65400845, 0.6329114, 0.60337555, 0.5527426, 0.42194092, 0.38396624, 0.35443038, 0.33333334, 0.32489452, 0.4177215, 0.4177215, 0.4177215, 0.36708862, 0.34177214, 0.4008439, 0.38818565, 0.45147678, 0.4599156, 0.38818565, 0.38818565, 0.34177214, 0.3164557, 0.31223628, 0.3206751, 0.3206751, 0.4599156, 0.46413502, 0.39240506, 0.32911393, 0.3206751, 0.35021096, 0.29113925, 0.21097046, 0.21097046, 0.21518987, 0.23206751, 0.2278481, 0.18565401, 0.14767933, 0.14767933, 0.16877638, 0.20675105, 0.21097046, 0.21097046, 0.1814346, 0.17721519, 0.17299578, 0.16877638, 0.15189873, 0.1392405, 0.1308017, 0.12658228, 0.10970464, 0.10548523, 0.101265825, 0.09704641, 0.09704641, 0.11392405, 0.18987341, 0.21518987, 0.21518987, 0.17299578, 0.1308017, 0.12236287, 0.12236287, 0.21097046, 0.21097046, 0.21097046, 0.14345992, 0.10970464, 0.09704641, 0.1308017, 0.16033755, 0.15189873, 0.11814346, 0.11814346, 0.12658228, 0.13502109, 0.11392405, 0.08438819, 0.06329114, 0.05907173, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07594936, 0.07172996, 0.07172996, 0.05907173, 0.05485232, 0.05485232, 0.050632913, 0.046413504, 0.042194095, 0.042194095, 0.03797468, 0.03797468, 0.03797468, 0.033755273, 0.029535865, 0.029535865, 0.021097047 }; //128 elements
  
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

  SpringGraph(int _bars, float[] dataArray) {

    bars = _bars;//114;
    numberSprings = _bars;
    scottGraph = dataArray;
    barMaxHeight = 32;
    barWidth = 4;
    totalWidth = 572;
    paddingLeft = 4;
    paddingTop = 128 -12 + 300;
    partial = 0;
    
    timer = 0; // timer to keep track of cpu millis
    scottMillsTime = 34000; // 34000 millis
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
  public void update() {
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
      flick2(fullSegments,0.35f); // Adjustable Here
      lastFlickedSpring = fullSegments;
    }

    
  }
  public void flick2(int pos, float force) {
    if(pos < numberSprings && pos >=0) {
      springs.get(pos).flick2(force);
    }
  }
  public void drawSprings() {
    //translate to the buttom right corner of where the progress bargraph starts
    pushMatrix();
    translate(paddingLeft,paddingTop);
    noStroke();
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
      int c =  color(136, 249, brightness);
      fill(c);
      int i = fullSegments;
      float h = scottGraph[i] * barMaxHeight;
      rect(i*barWidth, 0, barWidth, -1*h );
    }
    // Draw Emtpy Segments if any

    popMatrix();
  }
  
  public void draw(){
  
    //translate to the buttom right corner of where the progress bargraph starts
    pushMatrix();
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
          //println(fade);
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
      int c =  color(136, 249, brightness);
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
    popMatrix();
  } // end draw
  
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "graph_background_waves" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
