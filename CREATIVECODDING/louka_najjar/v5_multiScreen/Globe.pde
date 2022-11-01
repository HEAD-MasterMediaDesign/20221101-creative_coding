class Globe {
  PShape globe;
  PVector location;
  float radius = 300;
  color col = color(255);
  ArrayList<PVector> initialPos = new ArrayList<PVector>();
  ArrayList<PVector> shape = new ArrayList<PVector>();
  int sides = 16;
  float angle = 360 / sides;
  int opacity = 0;
  int groupMult = 1;
  boolean isProducing = true;
  boolean isRotating = false;
  float deformMultiplier = 1.5;
  float deformMax = 10;
  boolean appeared = false;

  Globe(float xi, float yi, float zi) {

    location = new PVector(xi, yi, zi);

    globe = createShape();
    globe.beginShape();
    for (int i = 0; i < sides; i++) {
      for (int j = 0; j < sides; j++) {
        float x = radius * cos(radians(angle * i)) * sin(radians(angle * j));
        float y = radius * sin(radians(angle * i)) * sin(radians(angle * j));
        float z = radius * cos(radians(angle * j));
        globe.vertex(x, y, z);
        initialPos.add(new PVector(x, y, z));
      }
    }
    globe.endShape();
    for (int i = 0; i < globe.getVertexCount(); i++) {
      PVector v = globe.getVertex(i);
      initialPos.add(v);
      shape.add(v);
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    //rotateX(1.3676498 + 1.5);
    rotateX(radians(180));
    PShape newGlobe = createShape();
    newGlobe.beginShape();
    newGlobe.noFill();
    newGlobe.stroke(col, opacity);
    for (int i = 0; i < globe.getVertexCount(); i++) {
      PVector v = globe.getVertex(i);
      float deformValue = s1.getPower() * deformMultiplier;
      deformValue = constrain(deformValue, 0, deformMax);

      if (s1.getPower() >  1 && millis() < 94960 || millis() > 124000) {
        v.x += random(-deformValue, deformValue);
        v.y += random(-deformValue, deformValue);
        v.z += random(-deformValue, deformValue);
      }
      PVector pos = initialPos.get(i);
      PVector dir = pos.copy().sub(v).normalize().mult(groupMult);
      float dist = pos.copy().sub(v).mag();
      if (dist > .5) {
        v.add(dir);
      }
      newGlobe.vertex(v.x, v.y, v.z);
    }
    newGlobe.endShape();
    fill(0, 0);
    if (opacity == 0 && !appeared) {
      Ani.to(this, 3, "opacity", 255);
      appeared = true;
    }

    if (isRotating) {
      rotateZ(frameCount);
    }

    shape(newGlobe);
    globe = newGlobe;

    popMatrix();
  }

  void disapear() {
    if (opacity > 0) opacity -=5;
  }
}

class Dot {

  PVector location;
  PVector origin;
  int radius = 30;
  PVector velocity;
  float mult = 1;
  color col = color(255);
  PVector destination;
  boolean isMoving = true;

  Dot(PVector location, PVector origin) {
    this.location = location;
    this.origin = origin;
  }

  void display() {

    pushMatrix();
    noFill();
    stroke(col);
    translate(location.x, location.y, location.z);
    rect(0, 0, radius, radius);
    popMatrix();

    if (isMoving) {

      float dist = location.copy().sub(origin).mag();
      if (s1.getPower() > 1) {
        location.add(new PVector(random(-2 * dist / 1000, 2 * dist / 1000), random(-2 * dist / 1000, 2 * dist / 1000)));
      }

      velocity = location.copy().sub(origin).normalize().mult(s1.getPower() * mult);
      location.add(velocity);
    }
  }

  void back() {
    PVector dir = location.copy().sub(origin).normalize().mult(-1 * s1.getPower());
    location.add(dir);
  }


  void distribute() {
    if (destination == null) {
      float maxRadius = 2000;
      float radius = (float)Math.cosh(random(PI)) * maxRadius;
      float angle = random(TWO_PI);
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      float z = random(-5000, 35000);
      destination =  new PVector(x, y, z);
    }
    isMoving = false;
    PVector dir = location.copy().sub(destination).normalize().mult(-75);
    float dist = location.copy().sub(destination).mag();
    if (dist > 250) {
      location.add(dir);
    }
  }
}
