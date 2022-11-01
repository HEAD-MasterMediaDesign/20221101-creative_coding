import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import peasy.*;
import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

//Camera
PeasyCam cam;
PVector camLocation;
boolean camState = false;

//Stages
int stage = 0;
boolean stage0 = false;
boolean stage1 = false;
float rot = 0;

//Stage 0
Sun sun;
ArrayList<Star> stars  = new ArrayList<Star>();
ArrayList<ShootingStar> shootingStars  = new ArrayList<ShootingStar>();

//Stage 1
ArrayList<Circle> circles  = new ArrayList<Circle>();
ArrayList<Circle> dots  = new ArrayList<Circle>();
Circle black;
Circle white;
boolean isBlack = false;
boolean isWhite = false;
int debut1 = 13;




void setup() {
  //Setup
  size(1200, 800, P3D);
  Ani.init(this);

  //Camera
  cam = new PeasyCam(this, width/2, height/2, 10000, 0);
  cam.setActive(camState);

  //Stage 0
  sun = new Sun();
  for (int i = 0; i < 5000; i++) {
    stars.add(new Star());
  }

  //Stage 1
  for (int i = 0; i < 1000; i++) {
    dots.add(new Circle(0, 0, int(random(2, 10)), 0, 255));
  }
}

void draw() {
  if (stage == 0) {
    //Camera settings
    float fov = PI/3;
    float cameraZ = (height/2) / tan(fov/2);
    perspective(fov, float(width)/float(height), cameraZ/10, cameraZ*10000);


    if (!stage0) {
      //Zoom to sun
      cam.lookAt(width/2, height/2, 2500, 5000);
      cam.setDistance(0, 1);
      stage0 = true;
    }

    //Trigger supernova
    if (millis()/1000 > 10) {
      sun.deform();
    }

    //Rotate things towards camera
    float[] rotations = cam.getRotations();
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);

    //Add shooting stars
    if (millis() > 3000 && int(random(0, 10)) == 1) {
      shootingStars.add(new ShootingStar());
    }

    if (!sun.ended) {
      background(13, 0, 26);

      //Draw stage 0 stuff
      pushMatrix();
      translate(width/2, height/2, 0);
      sun.update();


      for (Star star : stars) {
        star.display();
      }

      for (ShootingStar star : shootingStars) {
        star.display();
      }
      popMatrix();
    } else {
      //Trigger next stage when sun ends its supernova
      stage0 = false;
      stage = 1;
    }
  } else if (stage == 1) {
    if (!stage1) {
      //Reset camera & matrix and start stage 1
      resetMatrix();
      camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
      rot = 0;
      stage1 = true;
      debut1 = millis() / 1000 - 2;
    }

    //Draw stage 1 stuff
    //Start at millis()/1000 == 15

    pushMatrix();
    translate(width/2, height/2);
    rotateZ(radians(rot));

    background(255);


    if (millis()/1000 > debut1) {
      if (frameCount % 4 == 0 && !isBlack) {
        circles.add(new Circle(0, 0, width + width/2, 1, int(random(50, 200))));
      }
    }

    for (Circle circle : circles) {
      circle.update();
    }

    if (millis()/1000 > debut1 + 4 && !isBlack) {
      black = new Circle(0, 0, width + width/2, 2, 0);
      isBlack = true;
    }

    if (isBlack) black.explode();

    if (millis()/1000 > debut1 + 8) {
      for (Circle dot : dots) {
        if (millis()/1000 < debut1 + 13) dot.goToPlace();
        if (millis()/1000 < debut1 + 25) {
          dot.wiggle();
        }
        dot.update2();
      }
    }

    if (millis()/1000 > debut1 + 14) {
      rot += frameCount / 10;
    }

    if (millis()/1000 > debut1 + 15 && millis()/1000 < debut1 + 24) {
      for (Circle dot : dots) {
        dot.goToCenter();
      }
    }

    if (millis()/1000 > debut1 + 24) {
      for (Circle dot : dots) {
        dot.goToPlace();
      }
    }

    if (millis()/1000 > debut1 + 22) {
      if (!isWhite) {
        white = new Circle(0, 0, width + width/2, 2, 255);
        isWhite = true;
      }
      white.explode();
    }

    popMatrix();
  }
}

//Debug
void keyPressed() {
  if (key == 'b') {
    //cam.lookAt(width/2, height/2, 4000, 500);
  }

  if (key == 'm') {
    //println(cam.getPosition());
    //println(width, height);
    println(millis());
    //println(cam.getPosition());
    //println(cam.getRotations());
  }

  if (key == 'p') {
    camState = !camState;
    cam.setActive(camState);
    println("Cam: " + camState);
  }
}
