class Sun {
  PShape sun;
  PShape sunLight;
  float radius = 300;
  int sides = 32;
  float angle = 360 / sides;
  PImage degrade;
  color col = color(255);

  ArrayList<ExplosionPart> parts  = new ArrayList<ExplosionPart>();
  ArrayList<Float> circlesRadius  = new ArrayList<Float>();

  boolean deform = false;
  boolean explode = false;
  boolean ended = false;

  float deformValue = 1;
  float shrinkValue = 0;
  float radiusValue = 0;
  float colValue = 0;
  float opacityValue = 0;
  float blurValue = 0;
  float zValue = 0;

  float dist = radius * 2 + 30;

  PShader blur;

  Sun() {
    degrade = loadImage("degrade.png");
    blur = loadShader("blur.glsl");
    sun = createShape();
    sun.beginShape();
    for (int i = 0; i < sides; i++) {
      float x = cos(radians(i * angle)) * radius;
      float y = sin(radians(i * angle)) * radius;
      sun.vertex(x, y, x, y);
    }
    sun.endShape(CLOSE);
  }

  void update() {
    if (explode) {
      explode();
    } else {
      display();
    }

    for (int i = 0; i < blurValue; i++) {
      filter(blur);
    }

    if (radiusValue > 7000) {
      //println('a');
      ended = true;
    }
  }

  void display() {
    pushMatrix();
    PShape newSun = createShape();
    newSun.beginShape();
    newSun.fill(255);
    newSun.noStroke();
    for (int i = 0; i < sun.getVertexCount(); i++) {
      PVector v = sun.getVertex(i);

      if (deform) {
        PVector center = new PVector(0, 0);
        PVector dir = center.sub(v);
        dist = center.sub(v).mag();
        v.add(dir.normalize().mult(shrinkValue));
        v.x += random(-deformValue, deformValue);
        v.y += random(-deformValue, deformValue);

        if (millis() > 17000 && s1.getPower() > 5 && parts.size() < 1) {
          for (int j = 0; j < sun.getVertexCount(); j++) {
            for (int n = 0; n < 10; n++) {
              PVector v_ = sun.getVertex(j);
              parts.add(new ExplosionPart(v_));
            }
          }
          explode();
          deform = false;
        }
      }

      newSun.vertex(v.x, v.y);
    }
    newSun.endShape(CLOSE);
   // newSun.disableStyle();
    
    //col = color(255);
    //fill(255);
    //noStroke();
    shape(newSun);
    sun = newSun;
    popMatrix();

    //col = degrade.get(int(colValue), 0);
    //col = color(255);
    //fill(col);
    //noStroke();
    //sun.setFill(col);
    //sun.setStroke(false);
    //shape(sun);
  }

  void deform() {
    if (!deform) {
      Ani.to(this, 3.5, "shrinkValue", 3.5, Ani.BACK_IN);
      Ani.to(this, 5, "colValue", degrade.width - 1, Ani.EXPO_IN);
      Ani.to(this, 5, 3, "blurValue", 5);
      deform = true;
    }
  }

  void explode() {
    if (!explode) {
      Ani.to(this, 2, "radiusValue", 15000, Ani.QUAD_OUT);
      Ani.to(this, 4, "opacityValue", 255);
      Ani.to(this, 4, "zValue", 100);
      explode = true;
    }

    circlesRadius.add(radiusValue);

    pushMatrix();
    translate(0, 0, zValue);
    noStroke();
    for (Float radius : circlesRadius) {
      //translate(0, 0, zValue);

      //fill(127, 254, 255, 255 - opacityValue);
      fill(200, 255 - opacityValue);
      circle(0, 0, radius + radius*10/100);

      fill(255);
      circle(0, 0, radius);

      //fill(0);
      //circle(0, 0, radius - 1000);

      //rect(0, 0, (radius + radius*10/100) *2, radius + radius*10/100);
      //rect(0, 0, radius *2, radius);

      filter(blur);
    }
    popMatrix();

    for (ExplosionPart part : parts) {
      pushMatrix();
      translate(0, 0, 0);
      part.update();
      popMatrix();
    }
  }
}

class ExplosionPart {
  PVector location;
  PVector velocity = new PVector(random(-1, 1), random(-1, 1), random(-.1, .1)).normalize().mult(random(5, 20));
  color col = color(255);
  int size = int(random(10, 25));
  float opacity = 255;
  float maxDist = 1000;

  ExplosionPart(PVector location_) {
    location = location_;
  }

  void update() {
    location.add(velocity);

    float dist = location.copy().sub(new PVector(0, 0)).mag();
    if (dist > maxDist) opacity -= 7.5;

    fill(col, opacity);
    noStroke();
    circle(location.x, location.y, size);
  }

  void setColor(color col_) {
    col = col_;
  }
}
