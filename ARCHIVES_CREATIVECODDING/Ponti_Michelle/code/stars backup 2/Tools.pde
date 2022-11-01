void drawParticle(float partSize,PImage sprite) {
  pushMatrix();
  
  float[] rota = cam.getRotations();
  rotateX(rota[0]);
  rotateY(rota[1]);
  rotateZ(rota[2]);
  
  
  beginShape(QUAD);
  noStroke();
  texture(sprite);
  normal(0, 0, 1);
  vertex(-partSize/2, -partSize/2, 0, 0, 0);
  vertex(partSize/2, -partSize/2, 0, sprite.width, 0);
  vertex(partSize/2, partSize/2, 0, sprite.width, sprite.height);
  vertex(-partSize/2, partSize/2, 0, 0, sprite.height);                
  
  endShape();
  
  //rect(0,0,40,40);
  popMatrix();
}
