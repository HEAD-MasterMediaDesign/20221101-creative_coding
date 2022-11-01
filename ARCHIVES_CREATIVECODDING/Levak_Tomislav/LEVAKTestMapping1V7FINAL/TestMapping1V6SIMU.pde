//float rot=0;
//float a = 0;
//float s = 0;

ArrayList<Cercle> cercle = new ArrayList<Cercle>();
ArrayList<CercleInt> cercleInt = new ArrayList<CercleInt>();

/*
void settings() {
  size(1920*2, 1080*2, P3D);
}


void setup() {

  surface.setLocation(0, 0);
  //pixelDensity(2);
  //frameRate(60);
}*/
void Cascade() {
  background(0);


  if (frameCount%6==0) {
    cercle.add(new Cercle());
    //println("yop");
  }

  for (int i=0; i<cercle.size(); i++) {
    cercle.get(i).draw();
  }

  for (int i=0; i<cercle.size(); i=i+1) {
    if (cercle.get(i).taille>(width*2)) {
      cercle.remove(i);
    }
  }
  /*  for (int i=0; i<cercle.size(); i=i+1) {
    if (cercle.get(i).taille<(height/3)*2) {
      cercle.remove(i);
    }
  }*/


  if (frameCount%10==0) {
    cercleInt.add(new CercleInt());
    //println("yop");
  }

  for (int j=0; j<cercleInt.size(); j++) {
    cercleInt.get(j).draw();
  }


for (int i=0; i<cercleInt.size(); i=i+1) {
  if (cercleInt.get(i).tailleInt<(height/20)) {
    cercleInt.remove(i);
  }
}


}
