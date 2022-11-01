class Asteroid {

  PShape asteroid;
  PImage texture;
  
Planet [] tabPlan = new Planet[planets.length];

  float x;
  float y;
  float vx=random(-1, 1);
  float vy=random(-1, 1);

  Asteroid(float cx, float cy) {
    x=cx;
    y=cy;

    this.asteroid = createShape(SPHERE, 3);
    this.asteroid.disableStyle();

    texture=loadImage("fire.jpg");
  }

  void display() {

    pushMatrix();
    //lights();
    translate(x, y);
    this.asteroid.setTexture(this.texture);
    noStroke();
    shape(this.asteroid);
    popMatrix();

    x+=vx;
    y+=vy;

    if (x>width+200 || x<0)vx*=-1;
    if (y>height+200 || y<0)vy*=-1;
  }

  void collision( Planet planets[]) {
    this.tabPlan=planets;
    
  }
}//END
