ArrayList<Coeur> coeur = new ArrayList<Coeur>();

void Coeur() {
  background(0);

  if (frameCount%11==0) {
    coeur.add(new Coeur());
    //println("yop");
  }

  for (int i=0; i<coeur.size(); i++) {
    coeur.get(i).draw();
  }

  for (int i=0; i<coeur.size(); i=i+1) {
    if (coeur.get(i).s<-15*(height/500)) {
      coeur.remove(i);
    }
  }
}
