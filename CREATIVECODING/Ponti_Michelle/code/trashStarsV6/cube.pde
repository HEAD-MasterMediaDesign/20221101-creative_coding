class Cube extends Astre {

  PImage block;
  float ry=random(0, 0.04);
  int distance;

  Cube(int distance) {
    this.distance=distance;
    //PIZZA
    block = loadImage("block.png");
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
    scale(50);
    noStroke();
    TexturedCube(block);
    popMatrix();
    
    ry+=0.002;
  }


  void TexturedCube(PImage block) {
    beginShape(QUADS);
    texture(block);

    // +Z "front" face
    vertex(-1, -1, 1, 0, 0);
    vertex( 1, -1, 1, 1, 0);
    vertex( 1, 1, 1, 1, 1);
    vertex(-1, 1, 1, 0, 1);

    // -Z "back" face
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 1, 0);
    vertex(-1, 1, -1, 1, 1);
    vertex( 1, 1, -1, 0, 1);

    // +X "right" face
    vertex( 1, -1, 1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex( 1, 1, 1, 0, 1);

    // -X "left" face
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1, 1, 1, 0);
    vertex(-1, 1, 1, 1, 1);
    vertex(-1, 1, -1, 0, 1);

    // +Y "bottom" face
    vertex(-1, 1, 1, 0, 0);
    vertex( 1, 1, 1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex(-1, 1, -1, 0, 1);

    // -Y "top" face
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1, 1, 1, 1);
    vertex(-1, -1, 1, 0, 1);

    endShape();
  }
}
