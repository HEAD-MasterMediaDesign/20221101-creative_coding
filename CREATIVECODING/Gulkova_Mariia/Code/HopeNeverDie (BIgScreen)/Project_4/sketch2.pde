/////////////////////////////////////////////
//sketch 2
float angle;
float a = 0.0;
float s = 0.0;

void setup2() {
  frameRate(30);
}

void draw2() {
  background(0, 15, 30);
  stroke(0, 15, 30);
  strokeWeight(1);

  pushMatrix();
  a = a + 0.01;
  //s = cos(a)*2;

  translate(width/2, height/2);
  scale(7);
  for (int i=0; i<100; i++) {
    fill(i*5, 85, 63);
    //fill(255, 0, 0);
    scale(0.98);
    rotate(radians(angle));
    rect(0, 0, 200, 200);
  }
  popMatrix();

  angle+=0.1;
}
