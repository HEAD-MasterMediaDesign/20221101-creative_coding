class BoxSound {

  //int amount = 10;
  float wave;
  float [] v = {1, 2, 3, 4, 5};
  int index=0;
  float x, y, z;
  float boxWidth = 50;
  float boxHeight = height*0.87;
  float boxDepth = 50;
  

  BoxSound(int i, float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }


  void draw() {
    //translate(width/2, height/2);
    //wave= sin(radians(frameCount*s2.getPower()/2));
    wave= sin(radians(frameCount*s2.getPower()/2));
    fill(255);
    //box(200);
    
    //x = frameCount*wave/v[index];
    //y = wave;
    //z =- 250;
    noFill();
    stroke(255);
    strokeWeight(1);
    fill(s2.getPower()*4);
    //rectMode(CENTER);

    pushMatrix();
    //translate(width/2+z, height/2, z);
    //box(wave, y, z);
    translate(x, y, z);
    //box(s2.getPower()/2, height*0.75, 250);
    box(boxWidth, boxHeight, boxDepth);
    popMatrix();
    x+=1;
    //push();
    //translate(x+frameCount*wave/2, height/2, -500);
    //box(s2.getPower()/2, height*0.65, 250);
    //pop();
    
    
  }

  void changeVitess() {
    index=int(random(v.length));
  }
}
