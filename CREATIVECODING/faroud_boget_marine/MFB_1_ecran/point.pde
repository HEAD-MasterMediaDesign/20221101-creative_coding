class poin {

  float a;
  float b;
  float c;
  float d;
  float life=255;

  boolean move=false;
  float v=10;

  poin(float a, float b, float c, float d) {
    this.a = random(width);
    this.b = random(height);
    this.c = random(4);
    //this.d = random(5);
  }

  void draw() {
    noStroke();
    fill(random(255), life);
    ellipse(a, b, c, c);

    if(move==true){
      a+=v;
      b+=v;
      life--;
    }
    
    
    //sometime
    if (frameCount%(60*2)==0) {
      float de=random(100);
      if (de>98) {
        move=true;
      }
    }
    ///end draw
  }
}
