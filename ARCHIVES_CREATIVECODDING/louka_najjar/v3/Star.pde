class Star {
  PVector location;
  int size;
  int opacity;
  int shape;
  color col = color(#fffdff);

  Star() {
    location = new PVector(random(-width * 5, width * 5), random(-height * 5, height * 5), random(-1000, 5000));
    size = int(map(location.z, -1000, 200, 1, 10));
    opacity = int(random(100, 255));
    shape = 1;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    noStroke();
    fill(col, opacity);

    if (shape == 1) {
      rect(0, 0, size, size);
    } else {
      circle(0, 0, size);
    }

    popMatrix();

    if (int(random(0, 5)) != 0) return;
    location.add(new PVector(random(-.5, .5), random(-.5, .5)));
  }
}
