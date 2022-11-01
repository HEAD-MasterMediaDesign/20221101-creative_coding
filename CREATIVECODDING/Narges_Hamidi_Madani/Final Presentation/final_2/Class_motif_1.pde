import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



class Motif {
  PShape motifShape;
  float x;
  float y;
  float z;
  float rotX;
  float rotY;
  float rotZ;
  boolean fall = false;
  boolean fallTop = false;
  boolean transition= false;
  boolean horizontal;
  String posName;
  Analysor analysor;
  float alpha = 255;
  int channel;
  boolean fallen = false;
  
  Motif(PShape motifShape, int x, int y, Analysor analysor, String posName) {
    this.motifShape = motifShape;
    this.x = x;
    this.y = y;
    this.analysor= analysor;
    this.posName = posName;
    this.channel = (int)random(analysor.getNbreChannel());
  }

  void draw() {
    if (this.fall || this.fallTop) {
      this.fallMotif();
    } else if (this.transition) {
      moveToZero();
    } else {
      this.drawMotif();
    }
  }

  void drawMotif() {

    float move=0;
    if (!this.fallTop && !this.fall) {
      if (this.posName == "left" || this.posName == "right" || this.posName == "back") {
        move= -30* this.analysor.getChannel(channel);
      } else {
        move= 30* this.analysor.getChannel(channel);
      }
    }
    pushMatrix();

    translate(x * this.motifShape.getWidth(), y * this.motifShape.getHeight(), z+move);
    rotateX(this.rotX);
    rotateY(this.rotY);
    rotateZ(this.rotZ);
    this.motifShape.setFill(color(0, 0, 0, alpha));
    shape(this.motifShape);
    popMatrix();
  }
  void fallMotif() {
    if (this.y <=10 && this.z >= -this.motifShape.getHeight()*repeatNum) {
      if (this.fallTop) {
        this.z -= random(20, 30);
      } else {
        this.y += random(0.1, 0.3);
      }
      float rotationX = random(0, 5);
      float rotationY = random(0, 5);
      float rotationZ = random(0, 5);
      this.rotX += radians((int)random(-2, 2)*rotationX);
      this.rotY += radians((int)random(-2, 2)*rotationY);
      this.rotZ += radians((int)random(-2, 2)*rotationZ);
    }
    else {
       fallen = true; 
    }
    this.drawMotif();
  }

  void moveToZero() {

    if (x != 4.5) {
      if (x < 4.5) {
        x+=0.02;
      } else {
        x-=0.02;
      }
    }
    if (horizontal) {
      this.rotX = this.rotY = this.rotZ = 0;
      if (y != 4.5) {
        if (y < 4.5) {
          y+=0.02;
        } else {
          y-=0.02;
        }
      }
    } else {
      this.rotX = 90;
      this.rotY = this.rotZ = 0;
      if (z < repeatNum*shapeSize/2 - shapeSize/2) {
        if (this.posName == "front") {
          if (z > -(repeatNum*shapeSize/2 + shapeSize/2)) {
            z -= 5;
          }
        } else {
          if (z < repeatNum*shapeSize/2 - shapeSize/2) {
            z+=3;
          } else {
            z-=3;
          }
        }
      }
    }
    this.alpha-=1;
    drawMotif();
  }
}
