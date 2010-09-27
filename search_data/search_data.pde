float[] clicks;
void setup() {
  size(600, 400, P3D);
  frameRate(5);


  String lines[] = loadStrings("clicks_per_day.txt");
  clicks = new float[lines.length];

  for (int i=0; i < lines.length; i++) {
    clicks[i] = float(lines[i]);
  }
}

int counter = 0;
float old_clicks = 0.0;
float new_clicks = 0.0;

void draw() {
  if(counter == clicks.length) {
    counter = 0;
  }
  
  new_clicks = map(clicks[counter], 3000000, 6000000, 0, 100);
  println("in draw");
 // println(new_clicks);
  for(int i=0; i<=20; i++) {
    float c = lerp(old_clicks, new_clicks, i/20.0);
    background(0);
    noLights();
    noStroke();
    pushMatrix();
    translate(100, 100, 0);
    
    fill(c);
    lights();
    sphere(100);

    popMatrix();
  }
  old_clicks = new_clicks;
  counter ++;
}

