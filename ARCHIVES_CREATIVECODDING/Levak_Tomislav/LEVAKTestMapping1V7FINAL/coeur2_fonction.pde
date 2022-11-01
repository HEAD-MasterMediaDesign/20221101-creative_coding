ArrayList<Coeur2> coeur2 = new ArrayList<Coeur2>();

void Coeur2() {


  if (frameCount%5==0) {
    coeur2.add(new Coeur2());
    //println("yop");
  }

  for (int i=0; i<coeur2.size(); i++) {
    coeur2.get(i).draw();
  }

  for (int i=0; i<coeur2.size(); i=i+1) {
    if (coeur2.get(i).s>500) {
      coeur2.remove(i);
    }
  }
}
