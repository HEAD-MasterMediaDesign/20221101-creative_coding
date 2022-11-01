import peasy.PeasyCam;

Analysor s1;

PeasyCam cam;

PImage back;
PImage sun;
float ry;
PShape sphere;


PImage part;
Etoile [] etoiles = new Etoile[1000];


PlanetData[] planets= {   //nom, taille, vitesse rotation
  new PlanetData("mercury", 15, 4),
  new PlanetData("venus", 20, 5 ),
  new PlanetData("earth", 22, 7),
  new PlanetData("mars", 18, 0.009),
  new PlanetData("jupiter", 15, 0.04),
  new PlanetData("saturn", 60, 2 ),
  new PlanetData("uranus", 40, 6),
  new PlanetData("neptune", 42, 0.006),
  new PlanetData("pluto", 13, 0.009)
};

Planet [] tabPlan = new Planet[planets.length];

Asteroid [] tabAst = new Asteroid [5];

///////////////////////////////////////////SETUP///////////////////////////////////////////

public void setup() {
  fullScreen(P3D, SPAN);
  
  s1 = new Analysor (this, 60);

  cam = new PeasyCam(this, 1000);

  //BACKGROUND
  back = loadImage("milky_way.jpg");
  back.resize(width, height);

  //SUN
  sphere = createShape(SPHERE, 100);
  this.sphere.disableStyle();
  sun=loadImage("sun.jpg");

  //PLANETS
  for (int i=0; i<planets.length; i++) {
    tabPlan[i] = new Planet(planets[i].nom, 300+ i*150, planets[i].taille, planets[i].vitesse );
  }

  //ASTEROIDS
  for (int i=0; i<tabAst.length; i++) {
    tabAst[i] = new Asteroid(random(width), random(height));
  }
  
  
  //STARS
  
  part = loadImage("particules.png");
  for (int i=0;i<etoiles.length;i++){
    etoiles[i] = new Etoile(new PVector(random(-1500,1500),random(-1500,1500),random(-1500,1500)),part);
  }
  hint(ENABLE_DEPTH_SORT);
  
  
}

///////////////////////////////////////////DRAW///////////////////////////////////////////

public void draw() {
  pointLight(255, 255, 255, 0, 0, 0);
  s1.runAnalyse();

  float [] pos= tabPlan[2].actualPosition();

  

  background(back);
  ambientLight(100,100,150);
  

  //SUN
  pushMatrix();
  //  pointLight(255, 200, 200, 0+100, 0, 0);
 //lights();
  //translate(width/2, height/2);
  noStroke();
  rotateZ(PI);
  rotateY(-ry);
  sphere.setTexture(sun);
  
  shape(sphere);
  ry += 0.0002;
  popMatrix();

  //PLANETS
  for (int i=0; i<tabPlan.length; i++) {
    tabPlan[i].display();

  }

  //ASTEROIDS
  for (int i=0; i<tabAst.length; i++) {
    tabAst[i].display();
   // tabAst[i].collision(tabPlan);
  }
  
  
  //STARS
    for (int i=0;i<etoiles.length;i++){
    etoiles[i].draw();
  }
  
        cam.lookAt(pos[0],pos[1],pos[2],250,0);
}
