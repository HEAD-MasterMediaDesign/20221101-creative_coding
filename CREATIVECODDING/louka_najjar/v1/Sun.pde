class Sun {
  PShape sun;
  float radius = 300;
  int sides = 32;
  float angle = 360 / sides;
  PImage degrade;
  color col;
  float debut;

  boolean deform = true;
  boolean explode = false;
  float deformValue = 0;

  ArrayList<ExplosionPart> parts  = new ArrayList<ExplosionPart>();

  Sun() {
    degrade = loadImage("degrade.png");
    sun = createShape();
    sun.beginShape();
    for (int i = 0; i < sides; i++) {
      float x = cos(radians(i * angle)) * radius;
      float y = sin(radians(i * angle)) * radius;
      sun.vertex(x, y);
    }
    sun.endShape(CLOSE);
  }

  void update() {
    //if (frameCount < 60) deformValue = map(frameCount, 0, 60, 0.01, .1);
    //if (frameCount > 60) deformValue = map(frameCount, 60, 60*5, 1, 1);
    //if (deformValue > .1) deformValue = .1;




    //println(deformValue);
    //radius = map(frameCount, 0, 60*5, 500, 25);
    //if (radius < 10) radius = 10;

    if (deform) {
      deform();
    }

    if (explode) {
      explode();
    } else {
      display();
    }
  }

  void display() {
    //int colX = int(map(frameCount, 0, 60*2, 0, degrade.width));
    //col = degrade.get(colX, 0);
    col = color(255);


    noStroke();
    fill(255, 0, 0);
    circle(0, 0, radius *2);

    sun.setFill(col);
    sun.setStroke(false);
    shape(sun);
  }

  //void OLDdeform() {
  //  //for (int j = 0; j < 3; j++) {
  //  translate(location.x, location.y);
  //  for (int i = 0; i < sun.getVertexCount(); i++) {
  //    PVector v = sun.getVertex(i);
  //    fill(0, 255, 0);
  //    circle(v.x, v.y, 10);
  //    if (i % 2 == 0) {

  //      v.x += random(-1, 1);
  //      v.y += random(-1, 1);
  //      sun.setVertex(i, v);
  //    }
  //  }
  //  //}
  //}

  //void deform() {
  //  sun = createShape();
  //  sun.beginShape();
  //  for (int i = 0; i < sides; i++) {
  //    float x = cos( radians( i * angle ) ) * radius + random(-deformValue * 1.5 * radius, 0);
  //    float y = sin( radians( i * angle ) ) * radius  + random(-deformValue * 1.5 * radius, 0);
  //    sun.vertex(x, y);
  //  }
  //  sun.endShape(CLOSE);
  //}

  void deform() {
    PShape newSun = createShape();
    PVector center = new PVector(0, 0);
    //radius = map(frameCount, 0, 60*5, 300 - 300 * 10/100, 1);
    float deformValue = map(frameCount, 0, 60*5, 1, .01);
    println(deformValue);
    float shrinkValue = map(frameCount, 0, 60*5, 1, .05);

    newSun.beginShape();
    for (int i = 0; i < sun.getVertexCount(); i++) {
      PVector v = sun.getVertex(i);
      PVector dir = center.sub(v);
      v.add(dir.normalize());
      v.x += random(-deformValue, deformValue);
      v.y += random(-deformValue, deformValue);
      newSun.vertex(v.x, v.y);

      //fill(0, 255, 0);
      //circle(v.x, v.y, 10);

      float dist = center.sub(v).mag();
      if (dist < 5 && parts.size() < 1) {


        for (int j = 0; j < sun.getVertexCount(); j++) {
          //for (int k = 0; k < 10; k++) {
          PVector v_ = sun.getVertex(j);
          parts.add(new ExplosionPart(v_));
          //}
        }
        explode = true;
        deform = false;
      }
    }
    newSun.endShape();
    sun = newSun;
  }

  void explode() {

    //int colX = int(map(frameCount, 0, 60*2.5, 0, degrade.width));
    //println(colX);
    //color col = degrade.get(colX, 0);
    for (ExplosionPart part : parts) {
      part.update();
      part.setColor(col);
    }
  }
}

class ExplosionPart {
  PVector location;
  PVector velocity = new PVector(random(-1, 1), random(-1, 1)).mult(random(1, 2));
  color col;
  int size = int(random(5, 15));
  float opacity = 255;
  float maxDist = random(125, 175);

  ExplosionPart(PVector location_) {
    location = location_;
    println(location);
  }

  void update() {
    location.add(velocity);

    float dist = location.copy().sub(new PVector(0, 0)).mag();
    if (dist > maxDist) opacity -= 7.5;

    fill(255, opacity);
    noStroke();
    circle(location.x, location.y, size);
  }

  void setColor(color col_) {
    col = col_;
  }
}
