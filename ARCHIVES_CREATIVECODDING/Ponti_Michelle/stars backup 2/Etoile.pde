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
    drawParticle(10,ima);
    popMatrix();
  }

}
