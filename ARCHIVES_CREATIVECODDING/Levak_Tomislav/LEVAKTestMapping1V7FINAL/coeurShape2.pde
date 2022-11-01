class Coeur2 {
  
  float s=15*(height/1000);
  int x1=0;
  int y1=-8;

  void draw() {
    stroke(255);
    noFill();
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/1000);


    pushMatrix();
    shapeMode(CENTER);
    translate(width/2, height/2);
    scale(s);
    
    beginShape();
    vertex(x1, y1);
    bezierVertex(10, -19, 27, -4, 0, 11);
    bezierVertex(-27, -4, -10, -19, 0, -8);
    endShape();

    popMatrix();
    
    s+=0.4;
  }
}
