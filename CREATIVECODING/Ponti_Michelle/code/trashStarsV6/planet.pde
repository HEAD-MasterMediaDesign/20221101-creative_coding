class Planet extends Astre{

  PShape sphere;
  PShape sphereEye;

  PImage texture;
  PImage textureEye;

  float distanceX;
  float positionY;

  float ry=random(0, 0.04);
  float rmoon= 0.2;
  int taille;

  float vitesse;

  String noms;

  Planet(String _noms, float _distance, int _taille, float _vitesse) {
    this.taille=_taille;
    this.sphere = loadShape(_noms+".obj");
    this.texture = loadImage(_noms+".jpg");
    this.distanceX = _distance;
    this.vitesse=_vitesse;
    this.noms=_noms;
    
    //if(texture!=null)this.sphere.setTexture(this.texture);
  }

  void display() {

    pushMatrix();
    stroke(255, 50);
    noFill();
    rotateX(PI/2);
    strokeWeight(1);
    circle(0, 0, this.distanceX*2);
    popMatrix();

    pushMatrix();
    //translate(width/2, 0);
    rotateY(this.vitesse);
    translate(this.distanceX, 0, 0);
    rotateY(this.ry);

    noStroke();
    scale(this.taille);
    rotateX(PI/2);
    shape(this.sphere);
    this.vitesse+=0.001;
    ry+=0.002;

   
    popMatrix();
  }
}
