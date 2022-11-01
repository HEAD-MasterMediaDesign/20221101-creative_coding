import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import peasy.*;

PeasyCam cam;

int z = 0;
Sun sun;
float rot = 0;

PVector camLocation;

ArrayList<Star> stars  = new ArrayList<Star>();

boolean camState = false;

int stage = 0;
boolean stage0 = false;
boolean stage1 = false;

PShader dither;


import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

void setup() {
  size(1200, 800, P3D);
  Ani.init(this);

  cam = new PeasyCam(this, width/2, height/2, 6000, 0);
  cam.setActive(camState);
  
  dither = loadShader("dither.glsl");
  dither.set("ditherText", loadImage("dit.png"));

  
  sun = new Sun();

  for (int i = 0; i < 5000; i++) {
    stars.add(new Star());
  }
}

void draw() {
  if (stage == 0) {
    if (!stage0) {
      stage0 = true;

      cam.lookAt(width/2, height/2, 2500, 5000);
      cam.setDistance(0, 1);
    }
    //if (millis() > 10000) {
    //  sun.deform();
    //}
  }

  float[] rotations = cam.getRotations();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);

  if (!sun.ended) {
    background(1, 13, 41);
    //rect(0, 0, width, height);
    //#010D29
    //#02091a

    pushMatrix();
    translate(width/2, height/2, 0);
    sun.update();

    pushMatrix();
    
    //Rocks
    float rotation = map(millis(), 0, 30000, 0, 360);
    rotateX(radians(-15));
    rotateY(radians(rotation));
    translate(0, 0, 0);
    
    for (int i = 0; i < 3; i++) {
      pushMatrix();
      float angle = radians(15*i);
      if (angle >= TWO_PI) angle = 0;
      float x = sin(angle) * 700;
      float z = cos(angle) * 700;
      translate(x, 0, z);
      rotateY(-radians(rotation));

      fill(255);
      circle(0, 0, 30);
      fill(150, int(map(rotation, 0, TWO_PI, 0, 255)));
      circle(0, 0, 30);
      popMatrix();
    }

    popMatrix();
    popMatrix();

    float[] positions = cam.getPosition();
    PVector camPosition = new PVector(positions[0], positions[1], positions[2]);

    for (Star star : stars) {
      float dist = star.location.copy().sub(camPosition).mag();
      star.display();
    }
  } else {
    background(0);
  }
  
  
  shader(dither);
  
}

void keyPressed() {
  if (key == 'b') {
    //cam.lookAt(width/2, height/2, 4000, 500);
  }

  if (key == 'm') {
    //println(cam.getPosition());
    //println(width, height);
    //println(millis());
    println(cam.getPosition());
    println(cam.getRotations());
  }

  if (key == 'p') {
    camState = !camState;
    cam.setActive(camState);
    println("Cam: " + camState);
  }
}
