void dibuja7() {

  Ant [] tabAnt = new Ant[1];



  for (int i=0; i<tabAnt. length; i++) {
    tabAnt[i] = new Ant(random(40), 40);
  }


  for (int i=0; i<tabAnt.length; i++) {
    tabAnt[i].link(tabAnt);
  }
  for (int i=0; i<tabAnt.length; i++) {
    tabAnt[i].display();
  }
}
