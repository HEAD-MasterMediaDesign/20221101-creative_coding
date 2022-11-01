class Planet {

  //PShape sphere;
  //PShape sphereMoon;
  PShape sphereRing;


  PImage texture;
  PImage textureMoon;
  PImage textureRing;


  float distanceX;
  float positionY;

  float ry=random(0, 0.04);
  float rmoon= 0.2;
  int taille;

  float vitesse;

  String noms;


  Planet(String _noms, float _distance, int _taille, float _vitesse) {

    this.taille=_taille;


    this.texture = loadImage(_noms+".png");
    this.distanceX = _distance;
    this.vitesse=_vitesse;
    this.noms=_noms;

    //MOON
    this.textureMoon = loadImage("moon.png");



    //SATURN RING
    this.textureRing = loadImage("ring.jpg");
    this.sphereRing = loadShape("arc.obj");
    this.sphereRing.disableStyle();
  }

  float x, y, z;

  void display() {


//trajectories
    pushMatrix();
    stroke(255, 50);
    noFill();
    rotateX(PI/2);
    circle(0, 0, this.distanceX*2);
    popMatrix();


//planets
    pushMatrix();
    // lights();
    //translate(width/2, 0);
    rotateY(this.vitesse);
    translate(this.distanceX, 0, 0);
    rotateY(this.ry);
    
    if(texture==null){
      fill(255,0,0);
      println(noms);
      rect(0,0,200,200);
    }else{
      imageMode(CENTER);
      scale(0.05);
      image(this.texture,0,0);
    }
    noStroke();
    //Camera position
    x = modelX(0, 0, 0);
    y = modelY(0, 0, 0);
    z = modelZ(0, 0, 0);
    
//    shape(this.sphere);
    this.vitesse+=0.001;
    ry+=0.002;


    //moon
    if (this.noms=="Flath_earth") {

      pushMatrix();
      rotateY(this.ry*10);
      translate(25, 0);

      rotateY(rmoon);

    
      noStroke();
      
      
      //shape(this.sphereMoon);
      popMatrix();
      rmoon+=0.002;
    }


    //saturn rings
    if (this.noms=="saturn") {
      pushMatrix();
      translate(0, 0);
      rotateZ(PI/1.5);
      scale(3.5);
    //  this.sphereRing.setTexture(this.textureRing);
      fill(128, 128, 128);
      noStroke();
      shape(this.sphereRing);
      popMatrix();
      rmoon+=0.5;
    }

    popMatrix();
  }


  float [] actualPosition() {
    float [] pos = {0, 0, 0};
    pos[0]=x;
    pos[1]=y;
    pos[2]=z;
    return pos;
  }
}
