class Etoile{
  PVector pos;
  PImage ima;
  
  Etoile(PVector pos,PImage ima){
    this.pos=pos;
    this.ima=ima;
  }

  void draw(){
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    tint(255, 255,255, random(255));
    drawParticle(10,ima);
    noTint();
    popMatrix();
  }

}
