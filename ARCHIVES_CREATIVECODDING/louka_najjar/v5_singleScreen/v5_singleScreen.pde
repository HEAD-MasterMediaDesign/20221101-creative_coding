import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import peasy.*;

//Constants
int MIN_FRAMERATE = 30;

//Camera
PeasyCam cam;
PVector camLocation;
boolean camState = false;

//Sound
Analysor s1;

//Stages
int stage = 0;
boolean stage0 = true;
boolean stage1 = false;
float rot = 0;

//Stage 0
Sun sun;
ArrayList<Star> stars  = new ArrayList<Star>();
ArrayList<ShootingStar> shootingStars  = new ArrayList<ShootingStar>();
int lastZoom = 0;

//Stage 1
Globe globe;
ArrayList<Dot> dots  = new ArrayList<Dot>();
int lastPush = 0;
boolean dezoom = false;
boolean pivot = false;
float camX;
float camY;
float camZ;
boolean zoom = false;
boolean dezoom2 = false;
//Circle growingCircle = new Circle();
boolean wall = true;
//ArrayList<Rectangle> rects = new ArrayList<Rectangle>();
boolean zoom2 = false;

void setup() {
  //Setup
  delay(5000);
  size(1200, 800, P3D);
  //fullScreen(P3D, SPAN);
  Ani.init(this);
  frameRate(MIN_FRAMERATE);

  //Sound
  s1 = new Analysor(this, "past.mp3", 60);

  //Camera
  cam = new PeasyCam(this, width/2, height/2, 0, 10000);
  cam.setActive(camState);

  //Stage 0
  sun = new Sun();
  for (int i = 0; i < 7000; i++) {
    stars.add(new Star());
  }

  //Stage 1
  globe = new Globe(width/2, height/2, 170);
}

void draw() {
  //Sound
  pushMatrix();
  s1.runAnalyse();
  popMatrix();

  //Stage 0
  if (stage == 0) {
    //Camera settings
    float fov = PI/3;
    float cameraZ = (height/2) / tan(fov/2);
    perspective(fov, float(width)/float(height), cameraZ/10, cameraZ*10000);

    //Cam zoom
    double camDistance = cam.getDistance() - cam.getDistance() * 10 / 100;
    if (cam.getDistance() > 1000 && s1.getChannel(43) > .5 && millis() > lastZoom + 450) {
      cam.setDistance(camDistance, 500);
      lastZoom = millis();
    }

    //Draw scene
    pushMatrix();
    //background(0);

    pushMatrix();
    fill(0, 75);
    translate(0, 0, -3000);
    rect(-width*20, -height*20, width * 200, height * 200);
    popMatrix();

    translate(width/2, height/2);

    //Supernovae
    if (millis() > 13000) {
      sun.deform();
    }
    sun.update();

    for (Star star : stars) {
      star.display();
    }

    for (ShootingStar star : shootingStars) {
      star.display();
    }


    if (int(random(0, 10)) == 1) {
      shootingStars.add(new ShootingStar());
    }

    if (sun.ended) {
      stage0 = false;
      stage = 1;
      rot = 0;
      cam.lookAt(width/2, height/2, 0);
      cam.setDistance(1000);
    }

    popMatrix();
  }

  if (stage == 1) {

    pushMatrix();
    fill(0, 50);
    rect(-width*20, -height*20, width * 200, height * 200);
    popMatrix();

    if (wall) {
      pushMatrix();
      translate(0, -90000);
      rotateX(radians(90));
      rect(0, 0, width * 200, height * 200);
      popMatrix();
    }

    if (!globe.isProducing) {
      globe.isRotating = true;
    }
    globe.display();

    int radius = 450;
    int sides = 32;
    if (s1.getPower() > 5 && millis() > lastPush + 50 && globe.isProducing) {
      for (int i = 0; i < sides; i++) {
        float x = cos(radians(i * 360/sides)) * radius;
        float y = sin(radians(i * 360/sides)) * radius;
        dots.add(new Dot(new PVector(x, y), new PVector(0, 0)));
        lastPush = millis();
      }
      if (frameRate < MIN_FRAMERATE - 5) {
        for (int i = 0; i < sides; i++) {
          dots.remove(0);
        }
      }
    }

    pushMatrix();
    translate(width/2, height/2);
    rotateZ(radians(rot));
    for (Dot dot : dots) {

      if (millis() > 94960) {
        if (int(random(0, 5)) == 1) {
          dot.location.z += 10;
        }
      }

      for (int i = 0; i < 10; i++) {
        if (millis() > 125400 && dot.location.z > 0 && millis() < 156000) {
          dot.location.z--;
          dot.mult = 1.5;
        }
      }

      if (millis() > 156000) {
        dot.distribute();
      }

      dot.display();
    }

    popMatrix();
    rot += s1.getPower() * .05;

    if (millis() > 40000) {
      if (!pivot) {
        int duration = 3;
        Ani.to(this, duration, "camX", -1.1504028);
        cam.setDistance(1500, duration * 1000);
        pivot = true;
      }

      if (camX != -1.1504028 && millis() < 63000) {
        cam.setRotations(camX, camY, camZ);
      }
    }

    if (millis() > 63000 && !dezoom) {
      dezoom = true;
      cam.setDistance(3500, 200);
    }

    if (millis() > 94960) {
      globe.groupMult = 5;
    }

    if (millis() > 125400) {
      globe.isProducing = false;

      if (!zoom) {
        int duration = 3;
        Ani.to(this, duration, "camX", 0);
        Ani.to(this, duration, "camY", 0);
        Ani.to(this, duration, "camZ", 0);
        cam.setDistance(7000, 200);
        zoom = true;
      }

      if (camX != 0 || camY != 0 || camZ != 0 && millis() < 140000) {
        cam.setRotations(camX, camY, camZ);
      }

      if (cam.getDistance() < 85000 && s1.getPower() > 1 && !dezoom2) {
        cam.setDistance(40000, 30000);
        dezoom2 = true;
      }


      if (millis() > 173000) {
        globe.disapear();
      }

      if (millis() > 185000) {
        if (!zoom2) {
          cam.setDistance(0, 27000);
          zoom2 = true;
          println("zoooom");
        }
      }

      if (millis() > 210300) {
        s1.jingle.pause();
        stage = 2;
      }
    }
  }
  
  if(stage == 2) {
    background(0);
  }
}

//Debug
void keyPressed() {
  if (key == 'b') {
    //cam.lookAt(width/2, height/2, 4000, 500);
    println(dots.size(), frameRate);
  }

  if (key == 'm') {
    //println(cam.getPosition());
    //println(width, height);
    println("millis:");
    println(millis());
    //println(sun.radiusValue);
    println("positions:");
    println(cam.getPosition());
    println("distance:");
    println(cam.getDistance());
    println("rotations:");
    println(cam.getRotations());
  }

  if (key == 'p') {
    camState = !camState;
    cam.setActive(camState);
    println("Cam: " + camState);
  }
}
