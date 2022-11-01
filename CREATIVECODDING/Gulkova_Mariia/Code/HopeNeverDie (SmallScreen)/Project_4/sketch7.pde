float a_17 = 0.0;
float s_17 = 0.0;

float a_6 = 0.0;
float s_6 = 0.0;

float a_7 = 0.0;
float s_7 = 0.0;

float a_8 = 0.0;
float s_8 = 0.0;


void setup7() {
  size(1080, 600);
  noStroke();
  
  rectMode(CENTER);
  frameRate(35);
}

void draw7() {
  background(0,15,30);
  
  a_17 = a_17 + 0.01;
  s_17 = cos(a_17)*1;
  
  a_6 = a_6 + 0.02;
  s_6 = cos(a_6)*1;
  
  a_7 = a_7 + 0.02;
  s_7 = cos(a_7)*1;
  
  a_8 = a_8 + 0.01;
  s_8 = cos(a_8)*1;
  
  pushMatrix();
  translate(width/2, height/2);
  scale(s_17);
  fill(0);
  rotate(frameCount / 200.0);
  
  star(150, 0, 87, 450, 142); 
  popMatrix();
  
  pushMatrix();
  translate(width/3, height/3);
  scale(s_6);
  fill(#E8E8E8);
  rotate(frameCount / 200.0);
  star(100, 0, 87, 550, 142); 
  popMatrix();
  
  pushMatrix();
  translate(width/1.3, height/1.3);
  scale(s_7);
  fill(#FFFFFF);
  rotate(frameCount / 200.0);
  star(200, 0, 87, 550, 142); 
  popMatrix();
  
  pushMatrix();
  translate(width/8, height/5);
  scale(s_8);
  fill(0);
  rotate(frameCount / 200.0);
  star(160, 0, 87, 450, 142); 
  popMatrix();
  
  
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
