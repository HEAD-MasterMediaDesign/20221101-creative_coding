class CercleS {

  float taille=0;
  int x, y;
  //int rot=0;
  int a=0;

  CercleS() {
    x=width/2;
    y=height/2;
  }

  void draw() {
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/20);
    stroke(255);
    noFill();
    circle(x, y, taille);
    taille+=20;
  }
}
