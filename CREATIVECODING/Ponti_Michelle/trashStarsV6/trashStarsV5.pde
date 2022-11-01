import peasy.PeasyCam;
PeasyCam[] cameras = new PeasyCam[1];

PImage sun;
PShape sphere;
PImage part;
float ry;
ArrayList<Astre> tabPlan = new ArrayList<Astre>();
Etoile [] etoiles = new Etoile[2500];

PlanetData[] planets= {   //nom, taille, vitesse
  new PlanetData("head", 10, 15),
  new PlanetData("bird", 3, 1),
  new PlanetData("cat", 5, 35),
  new PlanetData("heart", 10, 0.04),
  new PlanetData("rocket", 1, 6),
  new PlanetData("toilet", 10, 20)
};
public void settings() {
  //scene
  fullScreen(P3D, SPAN);
}

///////////////////////////////////////////SETUP///////////////////////////////////////////
public void setup() {
  sun = loadImage("Flat_earth.png");
  //PLANETS

  for (int i=0; i<planets.length; i++) {
    tabPlan.add(
      new Planet(planets[i].nom, 300+ i*200, planets[i].taille, planets[i].vitesse )
      );
  }

  tabPlan.add(new Pizza(1000));
  tabPlan.add(new Cube(800));
  //tabPlan.add(new Pizza(10));

  //STARS
  part = loadImage("particules.png");
  for (int i=0; i<etoiles.length; i++) {
    etoiles[i] = new Etoile(new PVector(random(-3000, 3000), random(-3000, 3000), random(-3000, 3000)), part);
  }
  cameras[0] = new PeasyCam(this, 2000);
}

///////////////////////////////////////////DRAW///////////////////////////////////////////

public void draw() {
  background(0);


  lights();
  //ambientLight(100, 100, 150);

  //////////////OBJECTS

  //SUN
  pushMatrix();
  noStroke();
  rotateZ(PI);
  rotateY(-ry);
  sun.resize(200, 200);
  imageMode(CENTER);
  image(sun, 0, 0);
  ry += 0.005;
  popMatrix();

  //PLANETS
  for (int i=0; i<tabPlan.size(); i++) {
    tabPlan.get(i).display();
  }

  //STARS
  for (int i=0; i<etoiles.length; i++) {
    etoiles[i].draw();
  }


  //cameras[0].beginHUD();
  //fill(255, 255, 0);
  //text("frameRate : "+frameRate, 20, 20);
  //cameras[0].endHUD();
}
