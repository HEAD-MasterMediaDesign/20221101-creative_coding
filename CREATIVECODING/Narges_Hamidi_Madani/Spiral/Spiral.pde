PShape p;
float r, s;
void setup() {
size(800,600,P3D);
p = loadShape("shishe line 2.svg");
  r=0;
  s=1;
  background(255);
  noFill();
  stroke(255);
}


void draw() {
  fill(random(0), random(0), random(0), 200);
  translate(width/2,height/2);
  rotate(r);
  shape(p,r,10,40,40);
  //r=r+0.1;
  //s=s+0.06;
  r=r+1.5;
  s=s+0.06;
}
