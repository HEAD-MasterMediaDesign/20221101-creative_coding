class Forme {

  //L'équivalent d'une tableau mais en plus pratique (apparement)
  //Appelle la classe Point
  ArrayList<Point> points = new ArrayList<Point>();
  float y=0;
  float x=0;

  //La forme est une ellipse
  Forme(float x, float y, float rayon) {
    this.x=x;
    this.y=y;
    
    //Le nombre de Points qu'une forme peut posséder (entre 6 et 30)
    int nb=int(random(6, 20));
    /*pour disposer les pts en cercle ? PI*2 = 360° qui sont divisés par le
    * nombre de points.*/
    float ang=PI*2/float(nb);

    //Incrémente les Points selon le nombre de Points que la forme contient
    for (int i=0; i<nb; i++) {
      //Définit les pts px et py de la classe point en ondes selon le rayon (?)
      float px=sin(ang*i)*rayon;
      float py=cos(ang*i)*rayon;
      //Un nouveau point est ajouté à chaque fois que la boucle est relancée (?)
      points.add(new Point(px, py));
    }
  }

  void display(PGraphics pg) {
    for (int i=0; i<points.size(); i++) {
      //Le point est cherché dans la liste
      points.get(i).run();
    }
    
    
    pg.noStroke();
    pg.fill(100);
    
    //Début de la construction de la forme
    pg.beginShape();
    
    //Se base sur la longueur (size) de la liste (?)
    for (int i=0; i<points.size(); i++) {
      //Pour changer la couleur selon les Points
      //fill(points.get(i).col);
      pg.fill(255, 50);
      
      //curveVertex pour créer des courbes entre chaque point
      //Combine le x/Y de cette classe et le x/y de la classe Point
      pg.curveVertex(x+points.get(i).x, y+points.get(i).y);
    }
    //Ces 3 lignes servent à corriger la fermeture des formes (normalement pas nécessaire)
    pg.curveVertex(x+points.get(0).x, y+points.get(0).y);
    pg.curveVertex(x+points.get(1).x, y+points.get(1).y);
    pg.curveVertex(x+points.get(2).x, y+points.get(2).y);
    //Fin de la construction de la forme
    pg.endShape(CLOSE);
  }
}
