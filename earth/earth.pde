
int d1 = -48000;
int moonDistance = -12500;
int distance = 0;
void setup(){
  size(1000, 400, P3D);
  background(0); 
  noStroke();
  noLoop();
}

void draw(){
  background(0);
  lights();
  directionalLight(200, 0, 0, 100, 100, 0);

  distance -=100;
  pushMatrix();
  translate(200, 100, distance);
  fill(0, 100, 200);
  sphere(400);
  popMatrix();
  
  
  if(distance < moonDistance) {

    pushMatrix();
     translate(100, 50, distance - moonDistance);
     fill(100, 100, 100);
     sphere(100);
     popMatrix();
     
  } 
  if(distance == d1){
   
   noLoop(); 
  }
}

void mousePressed(){
 loop(); 
}
