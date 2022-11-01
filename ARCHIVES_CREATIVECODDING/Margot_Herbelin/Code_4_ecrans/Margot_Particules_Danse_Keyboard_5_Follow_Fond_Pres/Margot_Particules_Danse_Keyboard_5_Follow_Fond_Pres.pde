Ant [] antlow1 = new Ant[5];
Ant [] antlow2 = new Ant[5]; // on definit un tableau fourmi et le nombre de fourmis
Ant [] antmedium1 = new Ant[10];
Ant [] antmedium2 = new Ant[10];
Ant [] antmedium3 = new Ant[10];
Ant [] anthigh1 = new Ant[10];
Ant [] anthigh2 = new Ant[10];
AntBulle [] tabAntBulle = new AntBulle[100];
AntBulle2 [] tabAntBulle2 = new AntBulle2[100];
//Bee [] bubble = new Bee [10];
Analysor s1; // on definit l'analyseur de son
PShader blur; // on definit la librairie qui permet le flou
PImage img;
float segLength = 18;


void setup() { // création du canvas
  fullScreen(P2D,SPAN); // de 10000x800 pixels
 // size(1000, 800, P2D); // de 10000x800 pixels
  //img = loadImage("cells.jpg");
  background(0);  // en noir
  s1=new Analysor(this, 60); // on met le son et l'analyseur
  blur=loadShader("blur.glsl"); // et on load la librairie du flou

  //--pour les bulles--//
  for (int i=0; i<tabAntBulle.length; i++) {
    tabAntBulle[i] = new AntBulle(random(width), random(height));
  }
  
   for (int i=0; i<tabAntBulle2.length; i++) {
    tabAntBulle2[i] = new AntBulle2(random(width), random(height));
  }

  //--pour chaque fourmi---//

  for (int i=0; i<antlow1.length; i++) {
    antlow1[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(30, 100, 110), 110); //rose: color(227,115,131)
    antlow1[i].cha1 = i;
    antlow1[i].cha2 = i+1;
    //antlow[i].col = color(random(240, 255), 255, random(240, 255)); //couleur des fourmis selectionnées
  }

  for (int i=0; i<antlow2.length; i++) {
    antlow2[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(85, 185, 171), 90); //rose: color(227,115,131)
    antlow2[i].cha1 = i;
    antlow2[i].cha2 = i+1;
    //antlow[i].col = color(random(240, 255), 255, random(240, 255)); //couleur des fourmis selectionnées
  }

  for (int i=0; i<antmedium1.length; i++) {
    antmedium1[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(194, 255, 192), 70);//rose color(255,192,203)
    antmedium1[i].cha1 = i;
    antmedium1[i].cha2 = i+1;
  }

  for (int i=0; i<antmedium2.length; i++) {
    antmedium2[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(194, 255, 220), 50);//rose color(255,192,203)
    antmedium2[i].cha1 = i;
    antmedium2[i].cha2 = i+1;
  }

  for (int i=0; i<antmedium3.length; i++) {
    antmedium3[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(194, 255, 235), 30);//rose color(255,192,203)
    antmedium3[i].cha1 = i;
    antmedium3[i].cha2 = i+1;
  }

  for (int i=0; i<anthigh1.length; i++) {
    anthigh1[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(194, 255, 255), 20);
    anthigh1[i].cha1 = i;
    anthigh1[i].cha2 = i+1;
  }

  for (int i=0; i<anthigh2.length; i++) {
    anthigh2[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1), color(255), 10);
    anthigh2[i].cha1 = i;
    anthigh2[i].cha2 = i+1;
  }



  /*
   for (int i=0; i<antmedium.length; i++) {
   antmedium[i] = new Ant(random(width), random(height), s1, random(PI), random(-1, 1));
   antmedium[i].cha1 = i;
   antmedium[i].cha2 = i+1;
   }
   
   */

  /* for (int i=0; i<10; i++) { //pour les 10 premières fourmis?
   tabAnt[i].cha1 = 10; //début de la plage de sélection des fréquences
   tabAnt[i].cha2 = 30; //fin de la plage de sélection des fréquences
   tabAnt[i].col = color(random(240, 255), 255, random(240, 255)); //couleur des fourmis selectionnées
   } */

  setupMidi(); //faire en sortes que ça soit synchronisé avec le midi
}

void draw() {  //dessin du fond noir avec flou pour trainée des fourmis
  rectMode(CENTER); //fond centré
  fill(0, 30); //remplir en noir à 10% d'opacité; vert(134, 193, 180)
  rect(width/2, height/2, width, height);
  filter(blur); //flou
  //image(img, 0, 0);


  for (int i=0; i<tabAntBulle.length; i++) {
    tabAntBulle[i].display();
  }
 for (int i=0; i<tabAntBulle2.length; i++) {
    tabAntBulle2[i].display();
  }
  //analyser
  s1.runAnalyse();  //lancer l'analyse
  //s1.drawPreAnalyse(0, 0, width, 300); //dessiner l'analyseur

  for (int i=0; i<antlow1.length; i++) {
    antlow1[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<antlow2.length; i++) {
    antlow2[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<antmedium1.length; i++) {
    antmedium1[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<antmedium2.length; i++) {
    antmedium2[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<antmedium3.length; i++) {
    antmedium3[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<anthigh1.length; i++) {
    anthigh1[i].displayAnt(); //afficher les fourmis
  }
  for (int i=0; i<anthigh2.length; i++) {
    anthigh2[i].displayAnt(); //afficher les fourmis
  }
}
