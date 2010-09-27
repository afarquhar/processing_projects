ArrayList balls = new ArrayList();
int nBalls = 1000;
ArrayList click_counts;
ArrayList times;

void setup() {
  size(600, 400, P3D);
  background(0); 

  String[] lines = loadStrings("clicks_per_minute.txt");
  click_counts = new ArrayList();
  times = new ArrayList();

  for(int i=0; i< lines.length; i++) {
    String[] split = lines[i].split("\t");
    times.add(split[0]+ ":"+ split[1]);
    click_counts.add(float(split[2]));
  }

  PFont f = loadFont("AndaleMono-48.vlw"); 
  textFont(f, 36);
}

int counter = 0;

void draw() {
  background(0);

  if(counter < click_counts.size()) {

    fill(100);
    String time = (String)times.get(counter);

    text(time, 100, 100);

    float click_count = (Float)click_counts.get(counter);
    click_count = map(click_count, 300, 3320, 0, 50);
    for(int i=0; i< click_count; i++) {
      balls.add(randomBall());
    }
  }

  for(int i=0; i< balls.size(); i++) {
    ((Ball) balls.get(i)).draw();
  }

  counter++;
}

Ball randomBall() {
  //  return new Ball(0, 400, random(1, 5), random(1, 7), random(0.05), 400);
  return new Ball(0, height, random(4, 5), random(4, 5), random(0.01, 0.05), 400);
}

