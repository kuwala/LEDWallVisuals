/* Color class to hold the color pallete and assit
in mapping things like intensity to color brightness. */
class Colors {
	color blueColor;
	color accentColor;
	color bgColor;
	color yellowColor;
	color offColor;

	Colors() {
		blueColor = color(136, 249, 255); // blue
	    accentColor = color(136,100,255);
	    offColor = color(0);
	    bgColor = color(0);

	    yellowColor = color(39, 242, 255); // orange/yellow

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