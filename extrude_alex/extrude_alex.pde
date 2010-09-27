/**
 * Extrusion. 
 * 
 * Converts a flat image into spatial data points and rotates the points
 * around the center.
 */

PImage extrude;
int[][] values;
float angle = 0;

void setup() {
  size(1200, 1000, P3D);

  // Load the image into a new array
  extrude = loadImage("alex.jpg");
  extrude.loadPixels();
  values = new int[extrude.width][extrude.height];
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      color pixel = extrude.get(x, y);
      values[x][y] = int(brightness(pixel));
    }
  }
  noLoop();
}

void draw() {
  background(0);

  // Update the angle
  angle += 0.05;

  // Rotate around the center axis
  translate(width/2, 0, -128);
  rotateY(angle);  
  translate(-extrude.width/2, 100, -128);

  // Display the image mass
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      stroke(values[x][y]);
      point(x, y, -values[x][y]);
    }
  }
}

boolean on = false;
void mousePressed() {
  if(on) {
    noLoop();
    on = false;
  } 
  else {
    loop();
    on = true;
  }
}

