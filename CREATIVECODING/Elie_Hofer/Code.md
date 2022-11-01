Star [] starsArray = new Star[2000];
import processing.sound.*;
SoundFile file;
PShape dna;
PShape hnd;
import peasy.*;
float ang=0;

float movX;

float v1 = 5;
float v2 =20;
float v3 = 1.1;

float posXAtom = -9000; //-2000 when box array
float posYAtom = 1000;
float posZAtom = -1800;

PeasyCam cam;
//PImage main;

void setup() {
  //size(800, 800, P3D);
  fullScreen(P3D);

  file = new SoundFile(this, "ELIE3Code.wav");
  file.play();

  dna = loadShape("adndna2.obj");
  hnd = loadShape("hndstar.obj");
  //main = loadImage("starz.png");

  for (int i=0; i<starsArray.length; i++) {
    starsArray[i] = new Star();
    // starsArray[i] = new Star (random(width), random(height));
  }
  cam = new PeasyCam(this, 0, 0, 0, 2000);
}


void draw() {
  background(0);
  
  pushMatrix();
  translate(-13250,2550,0);
  rotateZ(radians(180));
  rotateY(radians(280));
  rotateY(ang/1500);
  scale(74);
  //hnd.setTexture(main);
  shape(hnd,0,0);
  popMatrix();

  pushMatrix();
  translate(-8000,0,0);
  rotateX(ang/2500);
  rotateZ(radians(270));
  strokeWeight(1);
  scale(250);
    shape(dna,0,0);
    popMatrix();

  pushMatrix();
  translate(8000, 0);
  rotate(ang/2000);
  strokeWeight(2.5);
  stroke(255);
  noFill();
  sphere(2000);
  popMatrix();

  //////mouvement auto cam. ----->
  //movX+= 5;
  //////
  pushMatrix();
  translate(598, 0);
  //rotate(ang/5000);
  for (int i=0; i<starsArray.length; i++) {
    starsArray[i].link(starsArray);
  }
  for (int i=0; i<starsArray.length; i++) {
    starsArray[i].display();
  }
  popMatrix();
  //cam.setRotations(1,0, 0);
  // cam.lookAt(x,y, z,Distance);
  //cameramov();
  cam.lookAt(posXAtom, 0, 0, 0);
  cam.setRotations(100.2, 99.0, 100.3);

  pushMatrix();
  translate(posXAtom+=v1, 44);
  rotate(ang);
  rotateY(radians(50));
  fill(252);
  lights();
  float r= 30;
  int total = 20;

  for (int i=0; i<total; i++) {
    float lon = map(i, 0, total, -PI, PI);

    for (int j=0; j < total; j++) {
      float lat = map(j, 0, total, -HALF_PI, HALF_PI);
      float x = r * sin(lon) *cos(lat);
      float y = r * sin(lon) *sin(lat);
      float z = r * cos(lon);

      stroke(127, 0, 255);
      strokeWeight(4);
      point (x, y, z);
    }
  }


  //pushMatrix();
  //  rotate(ang);
  //  rotateX(radians(84));
  //  stroke(255);
  //  noFill();
  //  ellipse (0, 0, 500,500);
  //  popMatrix();

  pushMatrix();
  rotate(ang);
  rotateY (radians(109));
  stroke(255, 255, 0);
  strokeWeight(5);
  noFill();
  ellipse (0, 0, 350, 350);

  popMatrix();

  if (posXAtom>12000) { //>width*3.7
    ////posXAtom=-2000;
    box(1000);
    cam = new PeasyCam(this, 0, 0, 0, 500);
  }

  //if (posXAtom>12500) {
  //  cam = new PeasyCam(this, 0, 0, 0, 725);
  //}

  if (posXAtom>13000) {
    cam = new PeasyCam(this, 0, 0, 0, 1000);
  }

  if (posXAtom>13500) {
    cam = new PeasyCam(this, 0, 0, 0, 2000);
  }

  if (posXAtom>14000) {
    cam = new PeasyCam(this, 0, 0, 0, 3000);
  }

  if (posXAtom>14500) {
    cam = new PeasyCam(this, 0, 0, 0, 4000);
  }

if (posXAtom>15000){
  box(0);
  ang += 200;
}

 if (posXAtom>15700){
  v1= -80;
 }
 
 if (posXAtom>15700){
  v1= -80;
  }
  
 if (posXAtom<-9000){
  v1= -40;
  cam = new PeasyCam(this, 0, 0, 0, 4000);
 }
 
 if (posXAtom<-13000){
  v1= 0;
  cam = new PeasyCam(this, 0, 0, 0, 4000);
 }
  ang += 20;
  popMatrix();
}

/////////

class Star {
  float x;
  float y;
  float z;
  float speedx=random(-1, 1);
  float speedy=random(-1, 1);
  float speedz=random(-1, 1);
  int auto=0;
  int autoMax=int(random(100, 200));
  int limit=500;

  Star() {
    x=random(-4000, 4000); //(-2000,2000);
    y=random(-2000, 2000);
    z=random(-4000, 4000);//(-2000,2000);
  }
  void display() {
    x+=speedx;
    y+=speedy;
    z+=speedz;
    //stroke(0);
    //fill(255);
    //ellipse(x, y, 30, 30);

    if (x>limit || x<-limit)speedx*=-1;
    if (y>limit || y<-limit)speedy*=-1;
    if (z>limit || z<-limit)speedz*=-1;

    if (auto>autoMax) {
      speedx=random(-4, 4);
      speedy=random(-4, 4);
      speedz=random(-4, 4);
      auto=150;
      autoMax=int(random(100, 200));
    }
    auto++;
  }
  void link(Star [] stars) {
    for (int i=0; i<stars.length; i++) {
      if (stars[i] !=this) {
        float dist = dist(x, y, z, stars[i].x, stars[i].y, stars[i].z);
        if (dist<1000) {
          //dist<700
          float r = map(x, 0, 193, 237, 240);
          float g = map(y, 26, 112, 74, 65);
          float b = map(z, 198, 222, 88, 86);

          strokeWeight(1);
          stroke (r, g, b, 100);
          line(x, y, z, stars[i].x, stars[i].y, stars[i].z);
        }
      }
    }
  }
}