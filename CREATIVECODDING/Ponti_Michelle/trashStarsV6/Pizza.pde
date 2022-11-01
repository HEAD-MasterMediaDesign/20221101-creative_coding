class Pizza extends Astre {

  PImage pizza;
  float ry=random(0, 0.04);
  float distance=0;

  Pizza(int distance) {
    this.distance=distance;
    //PIZZA
    pizza = loadImage("pizza.png");
    textureMode(NORMAL);
  }

  void display() {
    pushMatrix();
    stroke(255, 50);
    noFill();
    rotateX(PI/2);
    circle(0, 0, this.distance*2);
    popMatrix();

    pushMatrix();
    rotateY(this.ry);
    translate(distance, 0, 0);
    scale(0.08);
    imageMode(CENTER);
    image(pizza, 0, 0);
    popMatrix();

    ry+=0.002;
  }
}
