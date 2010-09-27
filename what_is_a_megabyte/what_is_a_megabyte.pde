float zoom = 0;
int width = 500;
int height = 500;
int speed = -2;
int kbColor = 0;
int showBytesZoom = -1000;
int showSmallBytesZoom = -2000;
int showKbZoom = -10000;

void setup() {
  size(width, height, P3D);
}

void draw() {
  background(0);
  fill(255);

  drawDetailed();
  zoom += speed;
}


void drawDetailed() {

  if(kbColor < 200 && zoom < showKbZoom) {
     kbColor +=2; 
  }
  int colSeparation = 25;
  int rowSeparation = 25;
   
  for(int row = 0; row < 25; row++) {
    for(int col=0; col< 40; col++) {
      pushMatrix();

      if(zoom > showBytesZoom) {
        translate(col * colSeparation, row * rowSeparation, zoom);
        rect(0, 0, 20, 20);
      } 
      else if(zoom > showSmallBytesZoom) {
        updateSpeed(-20);
        translate(col * colSeparation, row * rowSeparation, zoom);
        rect(0, 0, 10, 10);
      }       
      else if(zoom > showKbZoom) {
        updateSpeed(-50);
        translate(col * colSeparation, row * rowSeparation, zoom);
        stroke(200);
        point(col, row);
      } 
      else {
        updateSpeed(-200);
        int factor = 80;
        translate(col * factor * colSeparation, row * factor * rowSeparation, zoom);
        if(row == 0 && col ==0) {
           fill(100);
        } else {
          fill(kbColor); 
        } 
        
        noStroke();
        rect(0, 0, 1000, 700);
      }

      popMatrix();
    }
  }
}

void updateSpeed(int s) {
  if(speed != 0){
   speed = s;   
  }
 
}
int oldSpeed = 0;

void mousePressed(){
  int newSpeed = oldSpeed;
  oldSpeed = speed;
  speed = newSpeed;
}

