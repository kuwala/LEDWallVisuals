/* Color class to hold the color pallete and assit
in mapping things like intensity to color brightness. */
class Colors {
	color blueColor;
	color yellowColor;
  color greenColor;
  
	color offColor;
  color accentColor;
  color bgColor;

	Colors() {
		blueColor = color(136, 249, 255); // blue
    yellowColor = color(39, 242, 255); // orange/yellow
    greenColor = color(136,100,255);
    accentColor = color(136,100,255);
    offColor = color(0);
    bgColor = color(0);


	}
	color blue() {
		return blueColor;
	}
	color yellow() {
		return yellowColor;
	}
	color bg() {
		return bgColor;
	}
	color blueIntensity(float intensity) {
		int brightness = (int)map(intensity, 0, 1, 0, 255);
		return color(136, 249, brightness);
	}

}