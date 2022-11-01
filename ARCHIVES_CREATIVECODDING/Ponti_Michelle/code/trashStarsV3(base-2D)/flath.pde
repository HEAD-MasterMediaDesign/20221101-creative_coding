import peasy.PeasyCam;

import processing.opengl.PGL;
import processing.opengl.PGraphics3D;
import processing.opengl.PJOGL;


Analysor s1;

final int NX = 1;
final int NY = 1;
PeasyCam[] cameras = new PeasyCam[NX * NY];

PImage back;

PImage sun;

PShape sphere;
PImage part;

float ry;


PlanetData[] planets= {   //nom, taille, position base
  new PlanetData("mercury", 15, 15),
  new PlanetData("venus", 20, 5 ),
  new PlanetData("sun", 22, 1),
  new PlanetData("mars", 18, 35),
  new PlanetData("jupiter", 15, 0.04),
  new PlanetData("saturn", 60, 2 ),
  new PlanetData("uranus", 40, 6),
  new PlanetData("neptune", 42, 45),
  new PlanetData("pluto", 13, 20)
};

Planet [] tabPlan = new Planet[planets.length];

Asteroid [] tabAst = new Asteroid [5];

Etoile [] etoiles = new Etoile[2500];


public void settings() {

  //scene
  fullScreen(P3D, SPAN);

  //SOUND
  s1 = new Analysor (this, "1.mp3", 60);
}

///////////////////////////////////////////SETUP///////////////////////////////////////////

public void setup() {

  int gap = 0;

  //SUN

  sun = loadImage("Flat_earth.png");

  //PLANETS
  for (int i=0; i<planets.length; i++) {
    tabPlan[i] = new Planet(planets[i].nom, 300+ i*200, planets[i].taille, planets[i].vitesse );
  }

  //ASTEROIDS
  for (int i=0; i<tabAst.length; i++) {
    tabAst[i] = new Asteroid(random(width), random(height));
  }

  //STARS
  part = loadImage("particules.png");
  for (int i=0; i<etoiles.length; i++) {
    etoiles[i] = new Etoile(new PVector(random(-3000, 3000), random(-3000, 3000), random(-3000, 3000)), part);
  }


  // tiling size
  int tilex = floor((width  - gap) / NX);
  int tiley = floor((height - gap) / NY);

  // viewport offset ... corrected gap due to floor()
  int offx = (width  - (tilex * NX - gap)) / 2;
  int offy = (height - (tiley * NY - gap)) / 2;

  // viewport dimension
  int cw = tilex - gap;
  int ch = tiley - gap;

  // create new viewport for each camera
  for (int y = 0; y < NY; y++) {
    for (int x = 0; x < NX; x++) {
      int id = y * NX + x;
      int cx = offx + x * tilex;
      int cy = offy + y * tiley;
      cameras[id] = new PeasyCam(this, 400);
      cameras[id].setViewport(cx, cy, cw, ch);
    }
  }
}

///////////////////////////////////////////DRAW///////////////////////////////////////////

public void draw() {


  //sound
  s1.runAnalyse();

  // background(back);
  background(0);
  ambientLight(100, 100, 150);
  pointLight(255, 255, 255, 0, 0, 0);

  // render scene once per camera/viewport
  for (int i = 0; i < cameras.length; i++) {
    pushStyle();
    pushMatrix();
    displayScene(cameras[i], i);
    popMatrix();
    popStyle();
  }
}


// some OpenGL instructions to set our custom viewport
//   https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glViewport.xhtml
//   https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glScissor.xhtml
void setGLGraphicsViewport(int x, int y, int w, int h) {
  PGraphics3D pg = (PGraphics3D) this.g;
  PJOGL pgl = (PJOGL) pg.beginPGL();
  pg.endPGL();

  pgl.enable(PGL.SCISSOR_TEST);
  pgl.scissor (x, y, w, h);
  pgl.viewport(x, y, w, h);
}


public void displayScene(PeasyCam cam, int ID) {

  int[] viewport = cam.getViewport();
  int w = viewport[2];
  int h = viewport[3];
  int x = viewport[0];
  int y = viewport[1];
  int y_inv =  height - y - h; // inverted y-axis

  // scissors-test and viewport transformation
  setGLGraphicsViewport(x, y_inv, w, h);

  // modelview - using camera state
  cam.feed();

  // projection - using camera viewport
  perspective(60 * PI/180, w/(float)h, 1, 5000);

  if (ID==0) {
    float [] pos= tabPlan[2].actualPosition();
    //  cam.lookAt(pos[0], pos[1]-10, pos[2], 200, 0); //x,y,z,distance,delay
    cam.lookAt(0, 0, 0, 2000, 0); //x,y,z,distance,delay
  }

  if (ID==1) {
    //float [] pos= tabPlan[2].actualPosition();
    cam.lookAt(0, 0, 0, 2000, 0); //x,y,z,distance,delay
  }

  // clear background (scissors makes sure we only clear the region we own)
  background(0);


  //////////////OBJECTS DRAW

  //SUN
  pushMatrix();
  noStroke();
  rotateZ(PI);
  rotateY(-ry);
  sun.resize(200, 200);
  imageMode(CENTER);

  image(sun, 0, 0);

  ry += 0.0001;
  popMatrix();

  //PLANETS
  for (int i=0; i<tabPlan.length; i++) {
    tabPlan[i].display();
  }

  //ASTEROIDS
  for (int i=0; i<tabAst.length; i++) {
    tabAst[i].display();
  }

  //STARS
  for (int i=0; i<etoiles.length; i++) {
    etoiles[i].draw();
  }
}
