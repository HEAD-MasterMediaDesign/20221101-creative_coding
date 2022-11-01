class CercleTI {

  float tailleTI=1544;
  int xTI, yTI;
  //int rot=0;
  //int a=0;

  CercleTI() {
    xTI=width/2;
    yTI=height/2;
  }

  void draw() {
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/50);
    stroke(255);
    noFill();
    circle(xTI, yTI, tailleTI);
    tailleTI -= 10;

    /*pushMatrix();
     translate(x, y);
     rotate(radians(rot));
     line(0, 0, x, y);
     popMatrix();
     
     rot = rot + 1;
     //a = a +3;*/

    //rect(x+taille/2,y,30,30);
  }
}
