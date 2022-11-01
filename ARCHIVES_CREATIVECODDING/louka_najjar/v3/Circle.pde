class Circle {
  PVector location;
  int size = 0;
  color col;
  PVector destination;
  boolean isMoving;
  int filled = int(random(2));
  int opacity = 255;


  Circle(float x, float y, int toSize, int easing, int col_) {
    location = new PVector(x, y);
    if (easing == 0) {
      //Stars
      Ani.to(this, 1, 1, "size", toSize);
      opacity = int(random(20, 200));
    } else if (easing == 1) {
      //Growing circles
      Ani.to(this, 5, 1, "size", toSize, Ani.BOUNCE_IN);
    } else if (easing == 2) {
      //Black
      Ani.to(this, 4.5, 1, "size", toSize, Ani.EXPO_IN);
    }

    col = color(col_);
    destination = new PVector(random(-width/2, width/2), random(-width/2, width/2));
  }

  void update() {
    pushMatrix();
    if (filled == 1) {
      noFill();
      stroke(col, opacity);
    } else {
      noStroke();
      fill(col, opacity);
    }
    circle(location.x, location.y, size);
    popMatrix();
  }

  void update2() {
    pushMatrix();
    noStroke();
    fill(col, opacity);
    circle(location.x, location.y, size);
    popMatrix();
  }

  void explode() {
    pushMatrix();
    noStroke();
    fill(col, opacity);
    circle(location.x, location.y, size);
    popMatrix();
  }

  void goToPlace() {
    PVector pos = location.copy().sub(destination);
    float dist = pos.mag();

    if (dist > 5 ) {
      location.add(pos.normalize().mult(5).mult(-1));
    }
  }

  void goToCenter() {
    PVector pos = location.copy().sub(new PVector(0, 0));
    float dist = pos.mag();

    if (dist > 5) {
      location.add(pos.normalize().mult(random(.5, 2)).mult(-1));
    }
  }

  void wiggle() {
    PVector wiggle = new PVector(random(-1, 1), random(-1, 1)).mult(1).normalize();
    location.add(wiggle);
  }

  //void attracted() {
  //  if (!isMoving && int(random(10)) == 1) {
  //    destination = new PVector(location.x + random(-20, 20), location.y + random(-20, 20)).normalize();
  //    isMoving = true;
  //  }
  //}
}
