class ShootingStar {
  PVector location;
  int size;
  int opacity;
  int shape;
  PVector dir = new PVector(random(-1, 1), random(-1, 1)).normalize().mult(5);
  int rot = 0;
  color col = color(random(100, 200));


  ShootingStar() {
    location = new PVector(random(-width *5, width *5), random(-height *5, height *5), random(-1000, 1000));
    size = int(map(location.z, -1000, 1000, 2, 5));
    opacity = 255;
    shape = 1;
  }

  void display() {
    pushMatrix();
    location.add(dir);
    noFill();
    stroke(col);
    translate(location.x, location.y, location.z);
    rotateZ(rot);
    rect(0, 0, size, size);
    popMatrix();
    rot += 10;
  }
}
