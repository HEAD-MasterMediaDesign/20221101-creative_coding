class ShootingStar {
  PVector location;
  int size;
  int opacity;
  int shape;
  PVector dir = new PVector(random(-1, 1), random(-1, 1)).normalize().mult(5);


  ShootingStar() {
    location = new PVector(random(-width *5, width *5), random(-height *5, height *5), random(1000, 3000));
    size = int(map(location.z, 1000, 3000, 2, 5));
    opacity = 255;
    shape = 1;
  }

  void display() {
    pushMatrix();
    location.add(dir);
    noStroke();
    fill(255);
    translate(0, 0, location.z);
    circle(location.x, location.y, size);
    popMatrix();
  }
}
