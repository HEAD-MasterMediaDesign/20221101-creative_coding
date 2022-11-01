class Courbe {


  float [] nombres;
  float [] nombresSmooth;
  
  color [] tabColor;
  float x; 
  float w;
  float y, h;
  int nb;
  float vx;
  
  float px,py;

  Courbe(float x, int y, float w, float h, int nb, float vx) {
    nombres = new float[nb];
    nombresSmooth = new float[nb];
    tabColor = new color[nb];
    this.x=0;
    this.y=y;
    this.w=w;
    this.h=h;
    this.nb=nb;
    this.vx=vx;
    this.px=x;
    for (int i=0; i<nb; i++)nombres[i]=random(-10, 10);
  }
  

  void drawBoreal() {
    beginShape();
    vertex(x, y);
    float ecart=w/nb;
    for (int i=0; i<nb; i++) {
      fill(tabColor[i]);
      curveVertex(x+ecart*i, y+nombresSmooth[i]);
    }
    vertex(x+w, y);
    vertex(x+w, y+h);
    for (int i=0; i<nb; i++) {
      fill(tabColor[i],0);
      curveVertex(x+w-ecart*i, h+y+nombresSmooth[i]);
    }
    vertex(x, y+h);
    endShape(CLOSE);
    
    if(px>width) px=0;
    
    for(int i=0;i<nombres.length;i++){
      nombresSmooth[i] -= (nombresSmooth[i]-nombres[i])*0.005;
    }
    
    this.px+=this.vx;
  }
  
  void draw() {
    pushMatrix();
    translate(px,py);
    drawBoreal();
    popMatrix();
  }
  
  
}
