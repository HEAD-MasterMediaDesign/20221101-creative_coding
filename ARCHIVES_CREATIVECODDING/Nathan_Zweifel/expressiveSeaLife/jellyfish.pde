class Jellyfish {
  PVector pos = new PVector(0, 0);
  PVector posSmooth = new PVector(random(0, width), random(0, height));
  PVector vit = new PVector(random(-5, 5), random(-5, 5));
  PVector nextPos = new PVector(0, 0);
  PVector soundVit = new PVector(0, 0);
  float[] x = new float[4];
  float[] y = new float[4];
  float segLength = 18;
  int size = 60;
  float angle;
  int count = 0;

  Analysor soundA;

  color col;
  color touchColor;
  int t=0;
  int tMax=int(random(100, 200));

  Jellyfish(float posX, float posY, Analysor soundA) {
    this.pos.x = posX;
    this.pos.y = posY;
    this.soundA = soundA;
    //this.col = color(200, 10, 200, 100);
    this.col = color(random(150,255), random(50,120), random(150,255));
  }

  void display() {
    this.soundA.runAnalyse();

    posSmooth.x -= (-pos.x + posSmooth.x)*0.01;
    posSmooth.y -= (-pos.y + posSmooth.y)*0.01;


    this.pos.add(vit);


    noStroke();
    rectMode(CENTER);
    
    //first tentacle
    pushMatrix();
    translate(20, 0);
    strokeWeight(20.0);
    stroke(100, 10, 200, 100);
    dragSegment(0, this.posSmooth.x, this.posSmooth.y);
    for (int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
    popMatrix();

    //second tentacle
    pushMatrix();
    translate(0, 0);
    strokeWeight(20.0);
    stroke(100, 10, 200, 100);
    dragSegment(0, this.posSmooth.x, this.posSmooth.y);
    for (int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
    popMatrix();

    //third tentacle
    pushMatrix();
    translate(-20, 0);
    strokeWeight(20.0);
    stroke(100, 10, 200, 100);
    dragSegment(0, this.posSmooth.x, this.posSmooth.y);
    for (int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
    popMatrix();

    //head
    pushMatrix();

    fill(col);
    rect(this.posSmooth.x, this.posSmooth.y, size, size, 20);

    fill(255);

    popMatrix();



    if (this.pos.x>width+50 || this.pos.x<-50)this.vit.x*=-1;
    if (this.pos.y>height+50 || this.pos.y<-50)this.vit.y*=-1;


    if (t>tMax) {
      this.vit.x=random(-5, 5);
      this.vit.y=random(-5, 5);


      t=0;
      tMax=int(400);
    }
    t++;
  }

  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], angle);
  }

  void segment(float x, float y, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }

  void touch(Jellyfish[] jellyArray) {
    for (int i = 0; i < jellyArray.length; i++) {
      if (jellyArray[i] != this) {
        if (jellyArray[i].posSmooth.x > this.posSmooth.x-(size/2) && jellyArray[i].posSmooth.x < this.posSmooth.x + (size/2) && jellyArray[i].posSmooth.y > this.posSmooth.y - (size/2) && jellyArray[i].posSmooth.y < this.posSmooth.y + (size/2)) {
          color randomColor = color(random(150,255), random(50,120), random(150,255));
          jellyArray[i].col = randomColor;
          this.col = randomColor;
          count++;

        }
      }
    }
  }
}
