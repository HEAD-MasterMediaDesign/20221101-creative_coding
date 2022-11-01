class LineT {

  float tailleT=0;
  int xT, yT;
  float rotT=0;
  //int a=0;



  void draw() {

    pushMatrix();
    translate(xT, yT);
    rotate(/*radians*/(rotT));
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/50);
    stroke(255);
    line(0, 0, xT, yT);
    popMatrix();

    rotT = rotT + (PI/60);

    xT=width/2;
    yT=height/2;
  }
}
