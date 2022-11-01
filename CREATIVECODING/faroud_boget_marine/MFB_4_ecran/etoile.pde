class bore {
  float x;
  float y;
  float max=4;
  float vx=random(-max, max);
  float vy=random(-max, max);
  color col;
  int t=0;
  int tMax=int(random(100, 200));


  float ry;

  bore(float cx, float cy, PShape mol) {
    x=cx;
    y=cy;
    //this.mol=mol;
    col = color(255);
  }
  void draw() {
    x+=vx;
    y+=vy;

    pushMatrix();
    translate(x, y,40);
    //rotateZ(PI);
    rotateY(ry);
    
    fill(255);
    noStroke();
    //shape(mol, 0, 0);
    
    
    popMatrix();

    if (x>width || x<0)vx*=-1;
    if (y>height || y<0)vy*=-1;
    if (t>tMax) {
      vx=random(-max, max);
      vy=random(-max, max);
      t=0;
      tMax=int(random(8000, 2000));
    }
    t++;
    ry += 0.001;
  }
}
