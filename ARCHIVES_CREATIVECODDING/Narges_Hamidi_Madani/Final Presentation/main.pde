import peasy.PeasyCam;
Analysor analysor;
public final int repeatNum = 10;
public float shapeSize = 0;
PShape shape;
Surface front;
Surface back;
Surface left;
Surface right;
Surface top;
Surface bottom;

final color red = color(255, 0, 0);
final color blue = color(0, 0, 255);
final color green = color(0, 255, 0);
final color cyan = color(0, 255, 255);
PeasyCam cam;
PShape character;
boolean play = false;
float startRange = 0;
float endRange = 600;
float characterRot = 0.01;
boolean camTransition = false;
float camDegree=0;
float camMove=0;
boolean transitionDone;
float camRotation;
boolean fallActive;
boolean rotating;
boolean finalTransition = false;
boolean cameraAligned;
boolean xAligned;
boolean yAligned;
boolean zAligned;
Spiral spiral;

void setup() {
  size(800,600,P3D);
  frameRate(30);


  analysor = new Analysor(this, "f1.mp3", 60);
  // volume
  analysor.volume(0);
  character = loadShape("character_test.obj");
  character.scale(200);

  cam = new PeasyCam(this, 400);

  cam.setMinimumDistance(0.01);
  cam.setMaximumDistance(10000);

  shape = loadShape("shishe line 2.svg");
  spiral = new Spiral(shape);
  shapeSize = shape.getWidth();
  cam.setDistance(repeatNum * 2 * shape.getWidth());
  cam.lookAt(repeatNum*shape.getWidth()/2, repeatNum*shape.getWidth()- character.getHeight(), repeatNum*shape.getWidth()/2);


  front = new Surface(shape, 0, 0, repeatNum*shape.getWidth(), new PVector(0, 0, 0), analysor, "front");
  back = new Surface(shape, 0, 0, 0, new PVector(0, 0, 0), analysor, "back");
  right = new Surface(shape, 0, 0, -repeatNum*shape.getWidth(), new PVector(0, -90, 0), analysor, "right");
  left = new Surface(shape, -repeatNum*shape.getWidth(), 0, 0, new PVector(0, 90, 0), analysor, "left");
  top = new Surface(shape, 0, 0, 0, new PVector(90, 0, 0), analysor, "top");
  bottom = new Surface(shape, 0, 0, -repeatNum*shape.getHeight(), new PVector(90, 0, 0), analysor, "bottom");
  
  frameCount=0;
}

void draw() {
  spotLight(160, 160, 160,
    repeatNum*shape.getWidth()/2, 0, repeatNum*shape.getWidth()/2,
    0, 1, 0, PI/2, 2);
    if(frameCount<2490){
  background(255);
    }
  analysor.runAnalyse();
  analysor.drawPreAnalyse(0, 0, width, 300);
  drawCharacter();
  front.draw();
  back.draw();
  left.draw();
  right.draw();
  top.draw();
  bottom.draw();
  if (!rotating)
  {
    cam.rotateY(analysor.getPower()/1000);
  }

  if (front.motifs[0][0].fallen && frameCount > 1400 && !finalTransition) {
    rotating = true;
    cam.rotateX(analysor.getPower()/100);
  }
  if (frameCount > 1800 && frameCount < 3600) {
    finalTransition = true;
    // x to 90
    // y to 0
    // z to 0
    if (degrees(cam.getRotations()[0]) != 90) {
      if (degrees(cam.getRotations()[0]) > 90) {
        cam.rotateX(-0.01);
      } else if (degrees(cam.getRotations()[0]) < 90) {
        cam.rotateX(0.01);
      } else {
        xAligned = true;
      }
    } else {
      xAligned = true;
    }
    if (cam.getRotations()[1] != 0) {
      if (cam.getRotations()[1] > 0) {
        cam.rotateY(-0.01);
      } else if (cam.getRotations()[1] < 0) {
        cam.rotateY(0.01);
      } else {
        yAligned = true;
      }
    } else {
      yAligned = true;
    }

    if (cam.getRotations()[2] != 0) {
      if (cam.getRotations()[2] > 0) {
        cam.rotateZ(-0.01);
      } else if (cam.getRotations()[2] < 0) {
        cam.rotateZ(0.01);
      } else {
        zAligned = true;
      }
    } else {
      zAligned = true;
    }

    if (frameCount > 2000) {
      top.transition(true);
      bottom.transition(true);
      right.transition(false);
      left.transition(false);
      front.transition(false);
      back.transition(false);
      
    }
  }
    if (frameCount>2490 ) {
    //(CENTER);
    spiral.draw();
  }


  if (frameCount > 600 && !fallActive) {
    fallActive = true;
    fall();
  }
  println(frameCount);
}

void drawCharacter() {
  pushMatrix();
  translate(repeatNum*shape.getWidth()/2,
    repeatNum*shape.getHeight(),
    repeatNum*shape.getWidth()/2);
  rotateX(radians(180));
  shape(character);
  character.rotateY(analysor.getPower()/100);
  popMatrix();
}

void fall() {
  front.fall(false);
  left.fall(false);
  right.fall(false);
  back.fall(false);
  top.fall(true);
}



void randomMotif() {
  front.random(false);
  left.random(false);
  right.random(false);
  back.random(false);
  top.random(true);
}

void keyPressed() {
  if ( keyCode== 32) {
    fall();
  }
}
