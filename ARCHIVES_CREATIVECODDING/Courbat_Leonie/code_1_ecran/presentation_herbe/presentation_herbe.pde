//enchaîner les différents types de vague.

//(Très cramé, comment atténuer ça ? => je veux dire, dans les modes de fusion,
//y'a moyen de donner des indications plus précises à ADD et BLEND ?)

import peasy.PeasyCam;
import peasy.org.apache.commons.math.geometry.*;
import peasy.*;

Herbe [] tabHerbe = new Herbe[20000];
Forme [] tabForme = new Forme[60];
PeasyCam cam;
Analysor s1;

PGraphics pg;
PShader blur;

//int m = millis();
int m = frameCount;

color ora = color(238, 150, 75);
color ver = color(85, 130, 139);

void setup() {
  fullScreen(P3D, SPAN);
  //size(1200, 500, P3D);
  pg = createGraphics (width, height, P2D);
  blur = loadShader("blur.glsl");
  s1 = new Analysor(this, "halp.mp3", 60);

  //le 400 correspond à quoi ?
  //PeasyCam(PApplet parent, double lookAtX, double lookAtY, double lookAtZ, double distance);
  cam = new PeasyCam(this, 400);

  cam.lookAt(1000, 100, 0.0, 1141.0087774794538);
  cam.setRotations(-1.185902, -0.014753667, -0.0065380344);


  int index=0;
  for (int i=0; i<200; i++) {
    for (int j=0; j<100; j++) {

      float h = noise(i*0.1, j*0.1);
      tabHerbe[index] = new Herbe(i*20-(20*100/2)+random(-30, 30), j*20-(20*100/2)+random(-30, 30), h*200);
      index++;
    }
  }
  for (int i=0; i<tabForme.length; i++) {
    tabForme[i] = new Forme(random(width), random(height), random(140, 160));
  }
}

void draw() {

  background(54, 73, 88);
  //frameRate(60);

  //Variante avec le fond qui change de couleur selon la musique
  //color r = lerpColor(ver, ora, map(s1.getChannel(30), 0, 32, 0, 1));
  //background(r);

  pg.beginDraw();
  pg.background(54, 73, 88);
  //pg.clear();
  for (int i=0; i<tabForme.length; i++) {
    tabForme[i].display(pg);
    //filter(blur);
  }
  pg.filter(blur);
  pg.endDraw();

  s1.runAnalyse();
  pushMatrix();
  for (int i=0; i<tabHerbe.length; i++) {
    tabHerbe[i].display();
  }
  translate(0-(20*100/2)-300, 0-(20*100/2)-500);
  fill(38, 70, 83);
  noStroke();
  //rectMode(CORNERS);
  rect(0, 0, 4*width, 5*height);
  //rect(0-(20*100/2)-30, 0-(20*100/2)-30, 200-(20*100/2)-30, 100-(20*100/2)-30);
  popMatrix();

  //cam.beginHUD et cam.endHUD permettent de désactiver la 3D dans une zone concerner pour y travailler en 2D
  cam.beginHUD();
  pushMatrix();
  //BlendMode et Tint permettent de jouer avec ées teintes et fusions comme dans PS
  //tint(255, 150);
  //ADD => C = min(A*factor + B, 255)
  blendMode(ADD);
  tint(255, 100);
  image(pg, 0, 0, width, height);
  popMatrix();
  //Blend => C = A*factor + B
  blendMode(BLEND);
  cam.endHUD();
  
  if (frameCount==200) {
    for (int i=0; i<tabHerbe.length; i++) {
      tabHerbe[i].mode="pousse";
    }
  }
  
  if (frameCount==2200) {
    for (int i=0; i<tabHerbe.length; i++) {
      tabHerbe[i].mode="petit";
    }
  }

  if (frameCount==2500 || frameCount==2700 ||
  frameCount==2900 || frameCount==3100 || frameCount==3300 ||
  frameCount==3500 || frameCount==3700 || frameCount==3900 ||
  frameCount==4100 || frameCount==4300 || frameCount==4500 ||
  frameCount==4700 || frameCount==4900 || frameCount==5100 || 
  frameCount==5300 || frameCount==5500 || frameCount==5700/*||
  frameCount==5900 || frameCount==6100 || frameCount==6300 || 
  frameCount==6500 || frameCount==6700 || frameCount==6900 ||
  frameCount==7100 || frameCount==7300 || frameCount==7500 ||
  frameCount==7700 || frameCount==7900 || frameCount==8100 || 
  frameCount==8300 || frameCount==8500 || frameCount==8700 ||
  frameCount==8900 || frameCount==9100 || frameCount==9300 || 
  frameCount==9500 || frameCount==9700 || frameCount==9900*/ ) {
    thread("vague");
  }
   if (frameCount==2600 || frameCount==2800 ||
  frameCount==3000 || frameCount==3200 || frameCount==3400 ||
  frameCount==3600 || frameCount==3800 || frameCount==4000 ||
  frameCount==4200 || frameCount==4400 || frameCount==4600 ||
  frameCount==4800 || frameCount==5000 || frameCount==5200 || 
  frameCount==5400 || frameCount==5600 || frameCount==5800/* ||
  frameCount==6000 || frameCount==6200 || frameCount==6400 || 
  frameCount==6600 || frameCount==6800 || frameCount==7000 ||
  frameCount==7200 || frameCount==7400 || frameCount==7600 ||
  frameCount==7800 || frameCount==8000 || frameCount==8200 || 
  frameCount==8400 || frameCount==8600 || frameCount==8800 ||
  frameCount==9000 || frameCount==9200 || frameCount==9400 || 
  frameCount==9600 || frameCount==9800 || frameCount==10000*/) {
    thread("devague");
  }
}


void vague() {
  for (int i=0; i<tabHerbe.length; i++) {
    tabHerbe[i].mode="pousse";
    delay(1);
  }
}

void devague() {
  for (int i=0; i<tabHerbe.length; i++) {
    tabHerbe[i].mode="petit";
    delay(1);
  }
}

void keyPressed() {

  if (key=='d') {
    //println(cam.getLookAt());
    //println(cam.getDistance());
    //println(cam.getRotations());
  }

  println(frameCount);

  //lookAt(lookAt[0],lookAt[1],lookAt[2],getDistance)
  if (key=='a') {
    //cam.lookAt(0.0, .0, 0.0, 1098.33);
    //setRotation(getRotations()[0],getRotations()[1],getRotations()[2]);
    //cam.setRotations(-1.3057507, 0.00747479, 0.012857597);
    CameraState stat = new CameraState(
      new Rotation(RotationOrder.XYZ, -1.185902, -0.014753667, -0.0065380344),
      new Vector3D(1000, 100, 0),
      (double)1141.0087774794538
      );

    cam.setState(stat, (long)6000);
  }

  if (key=='b') {
    cam.lookAt(0.0, 0.0, 0.0, 1098.33);
    //setRotation(getRotations()[0],getRotations()[1],getRotations()[2]);
    cam.setRotations(-1.2276181, -0.7656701, 0.33582705);
  }


  /*if (key=='q') {
    for (int i=0; i<tabHerbe.length; i++) {
      tabHerbe[i].mode="pousse";
    }
  }
  if (key=='x') {
    for (int i=0; i<tabHerbe.length; i++) {
      tabHerbe[i].mode="petit";
    }
  }


  if (key=='c') {
    thread("vague");
  }
   if (key=='v') {
    thread("devague");
  }
}


void vague() {
  for (int i=0; i<tabHerbe.length; i++) {
    tabHerbe[i].mode="pousse";
    delay(1);
  }
}

void devague() {
  for (int i=0; i<tabHerbe.length; i++) {
    tabHerbe[i].mode="petit";
    delay(1);
  }*/
}
