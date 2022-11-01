//Dans cette version, l'herbe commence à pousser à 5 px et ne descend pas plus bas
//Une caméra a été mise en place

class Herbe {
  float x;
  float y;
  float z;

  float timer=random(-1, 1);
  float rad=20;

  //pour gérer la croissance des brins d'herbe
  float cr=5;
  float crMax=100;
  float vitCr=0.5;

  //pour gérer le début de croissance de l'herbe version timer basé sur x
  float t=0;
  float tMax;
  boolean go =false;

  color vertf = color(85, 130, 139);
  color vertc = color(201, 228, 202);
  color jaune = color(244, 211, 94);
  color orange = color(238, 150, 75);

  Herbe(float cx, float cy, float cz) {
    x=cx;
    y=cy;
    z=cz;
    tMax=x;
  }
  
  void display() {
    pushMatrix();
    tempspousse();
    translate(x, y, z);
    rotateX(sin(timer)*radians(rad));
    color remp = lerpColor(vertf, vertc, (y/s1.getChannel(25))/10);
    color remp2 = lerpColor(orange, jaune, (y/s1.getChannel(25))/10);
    color l = lerpColor(remp, remp2, map(sin(timer), -1, 1, 0, 1));
    stroke(l);
    //comme x et y font office de sol, z indique la "haut" des brins d'herbe

    //pour commencer à fabriquer une forme
    beginShape(LINES);
    strokeWeight(10);
    stroke(50);
    //définit le 1er point de construction de la forme
    vertex(0, 0, 0);
    strokeWeight(1);
    stroke(l);
    //définit le 2ème pt de consrtuction qui va se relier au premier
    vertex(0, 0, cr);
    //termine la construction de forme
    endShape();
    popMatrix();

    //println(s1.getChannel(30));
    timer+=(s1.getChannel(25)/10)*0.01;
  }

  //fait que l'herbe ne commence pas à pousser au même moment selon x
  String mode="nothing";
  
  void tempspousse() {
    if(mode=="pousse"){
      if(cr<crMax)cr+=vitCr;
    }
   
    if(mode=="petit"){
      if(cr>5)cr-=vitCr;
    }
  }
}
