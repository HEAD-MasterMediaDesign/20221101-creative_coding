class Particule {
  float x;
  float y;
  float life=random(60);
  PImage texture;
  float vx;
  float vy;
  float deathCo=random(0.5, 2);
  float rot=0;
  float rotVit=random(-0.01, 0.01);
  int size =0;

  Particule(float x, float y, PImage texture) {
    this.x=x;
    this.y=y;
    this.texture=texture;
    vx=random(-1, 1);
    vy=random(-1, 1);
    rot=random(PI);
  }

  void draw() {

    pushMatrix();
    translate(x, y);
    scale(2,2);
    translate(random(100,-100),random(20));
    rotate(rot);
    tint(255, 10);
    imageMode(CENTER);
    image(texture, 0, 0);
    popMatrix();
    x+=vx;
    y+=vy;
    life-=deathCo;
    rot+=rotVit;
    size+=1;
  }
}
