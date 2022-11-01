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
    rotateX(1.3676498);
    PShape newGlobe = createShape();
    newGlobe.beginShape();
    newGlobe.noFill();
    newGlobe.stroke(col, opacity);
    for (int i = 0; i < globe.getVertexCount(); i++) {
      PVector v = globe.getVertex(i);
      //PVector dir = center.sub(v);
      //dist = center.sub(v).mag();
      float deformValue = s1.getPower() * 1.5;
      deformValue = constrain(deformValue, 0, 10);
      //println(deformValue);
      //v.add(dir.normalize().mult(shrinkValue));

      if (s1.getPower() >  1 && millis() < 94960) {
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
    if (opacity == 0) {
      Ani.to(this, 3, "opacity", 255);
    }

    if (isRotating) {
      rotateZ(frameCount);
    }

    shape(newGlobe);
    globe = newGlobe;

    popMatrix();
  }
}

class Dot {

  PVector location;
  PVector origin;
  int radius = 30;
  PVector velocity;
  float mult = 1;
  color col = color(255);

  Dot(PVector location, PVector origin) {
    this.location = location;
    this.origin = origin;
  }

  void display() {

    pushMatrix();
    //translate(width/2, height/2);
    noFill();
    stroke(col);
    translate(location.x, location.y, location.z);
    rect(0, 0, radius, radius);
    popMatrix();

    //if(s1.getChannel(32) > s1.getChannel(4)) {
    //  location.y++;
    //} else {
    //  location.y--;
    //}

    float dist = location.copy().sub(origin).mag();
    if (s1.getPower() > 1) {
      location.add(new PVector(random(-1 * dist / 1000, 1 * dist / 1000), random(-1 * dist / 1000, 1 * dist / 1000)));
    }

    velocity = location.copy().sub(origin).normalize().mult(s1.getPower() * mult);
    location.add(velocity);
  }

  void back() {
    PVector dir = location.copy().sub(origin).normalize().mult(-1 * s1.getPower());
    location.add(dir);
  }
}

//class Circle {
//  PVector location = new PVector(200, 200);
//  int size = 0;
//  color col = color(255);
//  boolean isGrowing = false;

//  Circle() {
//  }

//  void display() {
//    if(!isGrowing) {
//      Ani.to(this, 3, "size", 100000);
//      isGrowing = true;
//    }
    
//    pushMatrix();
//    noStroke();
//    fill(col);
//    circle(location.x, location.y, size);
//    popMatrix();
//  }
//}
