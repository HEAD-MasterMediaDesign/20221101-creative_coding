float rot=0;

ArrayList<CercleS> cercles = new ArrayList<CercleS>();

/*void setup() {
  fullScreen(P3D);
}
*/
void Shape () {
  
  blendMode(DIFFERENCE);
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rotate(rot);
  shape1();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(-rot);
  scale(2);
  shape1();
  popMatrix();
  
  rot = rot+1 ;
  
  if (frameCount%3==0) {
    cercles.add(new CercleS());
  }

  for (int i=0; i<cercles.size(); i++) {
    cercles.get(i).draw();
  }

  for (int i=0; i<cercles.size(); i=i+1) {
    if (cercles.get(i).taille>(width*2)) {
      cercles.remove(i);
    }
  }
}
