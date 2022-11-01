import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import peasy.*;

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

void setup() {
  //Setup
  size(1200, 800, P3D);
  //fullScreen(P3D, SPAN);
  Ani.init(this);
  frameRate(60);

  //Camera
  cam = new PeasyCam(this, width/2, height/2, 0, 10000);
  cam.setActive(camState);

  //Sound
  s1 = new Analysor(this, "past.mp3", 60);

  //Stage 0
  sun = new Sun();
  for (int i = 0; i < 7000; i++) {
    stars.add(new Star());
  }

  //Stage 1
  globe = new Globe(width/2, height/2, 0);
  //for(int i = 0; i < 10; i++) {
  //globes.add(new Globe(random(width), random(height), random(-2000, -1000)));
  //}

  //ArrayList<PVector> distributePoints(PVector p1, PVector p2, int n) {
  //  ArrayList<PVector> points = new ArrayList<PVector>();
  //  for (int i = 0; i < n; i++) {
  //    float t = i / (float) (n-1);
  //    PVector p = PVector.lerp(p1, p2, t);
  //    points.add(p);
  //  }
  //  return points;
  //}

  //for (int i = 0; i < 3; i++) {
  //    float t = i / (float) (3-1);
  //    PVector p = PVector.lerp(new PVector(globe.radius, height/2), new PVector(width/2 - globe.radius, height/2), t);
  //    globes.add(new Globe(p.x, p.y, 0));
  //  }
}

void draw() {
  //Sound
  pushMatrix();
  s1.runAnalyse();
  //s1.drawPreAnalyse(0, 0, width, 300);
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
    background(0);
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
    fill(0, 50);
    rect(-width*20, -height*20, width * 200, height * 200);

    pushMatrix();
    translate(0, -90000);
    rotateX(radians(90));
    rect(0, 0, width * 200, height * 200);
    popMatrix();


    if (!globe.isProducing) {
      globe.isRotating = true;
    }
    globe.display();


    int radius = 400;
    int sides = 32;
    if (s1.getPower() > 5 && millis() > lastPush + 50 && globe.isProducing) {
      for (int i = 0; i < sides; i++) {
        float x = cos(radians(i * 360/sides)) * radius;
        float y = sin(radians(i * 360/sides)) * radius;
        dots.add(new Dot(new PVector(x, y), new PVector(0, 0)));
        lastPush = millis();
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
        if (millis() > 125400 && dot.location.z > 0) {
          dot.location.z--;
        }
      }

      dot.display();
    }
    popMatrix();

    rot += s1.getPower() * .025;

    if (millis() > 40000) {
      if (!pivot) {
        int duration = 3;
        Ani.to(this, duration, "camX", -1.1504028);
        cam.setDistance(2000, duration * 1000);
        pivot = true;
      }


      if (camX != -1.1504028) {
        cam.setRotations(camX, camY, camZ);
      }
    }



    if (millis() > 63000 && cam.getDistance() < 7000 && !dezoom) {
      dezoom = true;
      cam.setDistance(7000, 200);
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

      if (camX != 0 || camY != 0 || camZ != 0) {
        cam.setRotations(camX, camY, camZ);
      }

      double camDistance = cam.getDistance() + cam.getDistance() * 2 / 100;
      if (cam.getDistance() < 85000 && s1.getPower() > 1 && millis() > lastZoom + 50) {
        cam.setDistance(camDistance, 50);
        lastZoom = millis();
      }
      
      //rezoomer?
      
      //if(cam.getDistance() > 85000) {
      //  //vérifier distance + circle grow
      //  growingCircle.display();
      //}
    }
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
