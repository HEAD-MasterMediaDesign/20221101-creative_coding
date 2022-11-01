class Star {
  PVector location;
  int size;
  int opacity;
  color colStar = color(random(100, 200));
  int dir;
  int lastChange = 0;
  //int rot = 0;

  Star() {
    location = new PVector(random(-width * 5, width * 5), random(-height * 5, height * 5), random(-2500, 10000));
    size = int(map(location.z, -1000, 200, 1, 10));
    opacity = int(random(100, 200));
    rectMode(CENTER);

    if (int(random(0, 2)) == 0) {
      dir = 1;
    } else {
      dir = - 1;
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    //rotateZ(radians(rot));
    //noStroke();
    //fill(col, opacity);
    stroke(colStar, opacity);
    fill(0, opacity);
    rect(0, 0, size, size);
    popMatrix();

    if (s1.getChannel(43) > 2  && millis() > lastChange + 250) {
      dir *= -1;
      lastChange = millis();
      //rot+= 5;
    }

    if (int(random(0, 5)) == 0) location.add(new PVector(1 * dir, 1 * dir).normalize());
    if (sun.explode) opacity -= 50;
  }
}
