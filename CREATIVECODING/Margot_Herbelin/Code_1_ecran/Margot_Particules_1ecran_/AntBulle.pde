class AntBulle{
  float x;
  float y;
  float vx=random(-1,1);
  float vy=random(-1,1);
  color col;
  float size;
 // PShader blur;
  int t=0;
  int tMax=int(random(100,200));
  
  AntBulle(float cx,float cy){
    x=cx;
    y=cy;
 
    col = color(255,5);
  }

  void display(){
    x+=vx*0.6;
    y+=vy*0.6;
  //  blur=loadShader("blur.glsl");
    noStroke();
    fill(col);
   // filter(blur);
    circle(x,y,10);
    if(x>width || x<0)vx*=-1;
    if(y>height || y<0)vy*=-1;
    if(t>tMax){
      vx=random(-1,1);
      vy=random(-1,1);
      t=0;
      tMax=int(random(20,100));
    }
    
    t++;
  }
}
