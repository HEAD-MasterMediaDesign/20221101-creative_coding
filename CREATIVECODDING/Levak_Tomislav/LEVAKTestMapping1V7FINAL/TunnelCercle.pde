class CercleT {

  float tailleT=0;
  int xT, yT;
  int rotT=0;
  //int a=0;

  CercleT() {
    xT=width/2;
    yT=height/2;
  }

  void draw() {
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/50);
    stroke(255);
    noFill();
    circle(xT, yT, tailleT);
    tailleT+=10;

    /* pushMatrix();
     translate(xT, yT);
     rotate(radians(rotT));
     line(0, 0, xT, yT);
     popMatrix();*/

    rotT = rotT + 1;
    //a = a +3;

    //rect(x+taille/2,y,30,30);
  }
}
