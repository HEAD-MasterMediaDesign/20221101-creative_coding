class CercleInt {

  float tailleInt=(height/3)*2;
  int x, y;
  //int rot=0;
  int a=0;

  CercleInt() {
    x=width/2;
    y=height/2;
  }

  void draw() {
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/50);
    stroke(255);
    //noFill();
    fill(0);
    circle(x, y, tailleInt);
    tailleInt -= 5;

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
