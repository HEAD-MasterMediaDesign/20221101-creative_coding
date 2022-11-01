
class Spiral {
  PShape p = new PShape();
  float r, s;
  Analysor analysor;

  Spiral(PShape sh) {
    this.p =loadShape("shishe line 2.svg");
    r=0;
    s=1;
  }

  void draw() {
    //fill(random(0), random(0), random(0), 200);
    translate(510,-10, 500);
    rotateY(r);
    rotateX(PI/2);
    shape(p, r, 10, 40, 40);
    //r=r+0.1;
    //s=s+0.06;
    r=r+1.5;
    s=s+0.06;
  }
}
