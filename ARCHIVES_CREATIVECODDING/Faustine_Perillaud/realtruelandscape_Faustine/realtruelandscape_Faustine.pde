import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//import processing.sound.*;

ArrayList<Source> sources= new ArrayList<Source>();
ArrayList<Sols> sols= new ArrayList<Sols>();


PImage [] textures = new PImage[2];
PImage [] nuages = new PImage [2];
//PImage [] feuilles = new PImage [9];
PImage [] suns = new PImage [2];
PImage [] nuits = new PImage[2];
PImage [] boues = new PImage[2];
PImage [] champs = new PImage[2];
PImage [] herbes = new PImage[2];
PImage [] sables = new PImage[2];


//PImage [][] cieles = new PImage [] [] {boues, textures,champs,herbes};
//PImage [][] soles = new PImage [] [] {suns, nuits,nuages};

PGraphics layer ;

int time =0;
int lastMillis;
boolean button;
boolean birds;
boolean moon;
int checksol;
int checkciel;


Minim minim ;
AudioPlayer nazz;
AudioPlayer orage;
AudioPlayer pioupiou;
AudioPlayer vent;
AudioPlayer pouic;
//Reverb reverb;

Flock flock;
void setup() {
  //size (1800, 800, P2D);
  fullScreen(P2D, SPAN);

  minim = new Minim(this);
  flock = new Flock();
  //  reverb = new Reverb(this);

  nazz = minim.loadFile("Solo-nazz.mp3");
  orage = minim.loadFile("storm.mp3");
  pioupiou = minim.loadFile("bird.mp3");
  vent = minim.loadFile("wind.mp3");
  pouic = minim.loadFile("pouet.mp3");

  nazz.loop();
  //  reverb.process(nazz);
  // frameRate(25);
  for (int i=0; i<2; i++) {
    textures[i] = loadImage("texture"+int(i+1)+".png");
  }
  for (int i=0; i<2; i++) {
    nuages[i] = loadImage("nuage"+int(i+1)+".png");
  }

  for (int i=0; i<2; i++) {
    suns[i] = loadImage("sun"+int(i+1)+".png");
  }

  for (int i=0; i<2; i++) {
    nuits[i] = loadImage("nuit"+int(i+1)+".png");
  }

  for (int i = 0; i<2; i++) {
    boues [i] = loadImage("boue"+int(i+1)+".png");
  }

  for (int i = 0; i<2; i++) {
    champs [i] = loadImage("champ"+int(i+1)+".png");
  }

  for (int i = 0; i<2; i++) {
    herbes [i] = loadImage("herbe"+int(i+1)+".png");
  }
  for (int i = 0; i<2; i++) {
    sables [i] = loadImage("sable"+int(i+1)+".png");
  }

  layer = createGraphics (width, height);

  construcSource();
}

void time() {

  /*for (s=0; s<10000; s++){
   for (int i=0; i<sources.size(); i++) {
   sources.get(i).textures = random(ciels);
   sols.get(i).textures = random(sols);
   }
   vent.play();
   vent.rewind();
   }
   
   }*/

  /* if(m==1500){
   for (int i=0; i<sources.size(); i++) {
   sources.get(i).textures = suns;
   sols.get(i).textures = boues;
   }
   pouic.play();
   pouic.rewind();
   }*/
}

void construcSource() {

  //sources du ciel
  for (int i=0; i<width; i = i+300) {
    sources.add(new Source(i, random(20, 80), suns, 0));
  }

  // source du sol
  for (int j=0; j<width; j = j+300) {
    sols.add(new Sols(j, random(height-20, height-80), herbes, 0));
  }
}


void draw () {

  flock.run();
  time+=millis()-lastMillis;
  // int index=int(random(soles.length));

  /* if(time>random(20000,10000)){
   for (int i=0; i<sources.size(); i++) {
   sources.get(i).textures = nuages;
   }
   time=0;
   }*/
  lastMillis=millis();
  println(lastMillis);
  for (int i=0; i<sources.size(); i++) {
    sources.get(i).display();
  }

  for (int i=0; i<sols.size(); i++) {
    sols.get(i).display();
  }
  // time();

  if (checkciel == 2 && checksol == 2) {
    moon = true;
    if(moon== true){
    lune();
    }
    
  } 
  else {
    moon = false;
    
  }

  if (checkciel == 1 && checksol==1) {
    birds = true;
  }
}
void lune() {
  pushMatrix();
  frameRate(25);
  //translate(random(20,50),random(20,50));
  //scale(random(0.2,1));
  fill(255, 10);
  noStroke();
  circle(width/4, height/3.7, random(135, 150));
  popMatrix();
}

/*void oiseau() {

  flock.addBoid(new Boid(width/1.3, height/4));
}*/

void keyPressed () {

  if (keyCode==10) {
    save("capture/frame"+frameCount+".png");
  }

  if (key=='a') {
    for (int i=0; i<sources.size(); i++) {
      sources.get(i).textures = nuages;
    }
    checkciel=1;
    vent.play();
    vent.rewind();
  }
  /*else{
  checkciel  = 0;
  }*/

  if (key=='z') {
    for (int i=0; i<sources.size(); i++) {
      sources.get(i).textures = suns;
    }
    checkciel=2;
    pioupiou.play();
    pioupiou.rewind();
  }
  /*else{
  checkciel  = 0;
  }*/
  /*  if (key=='e') {
   for (int i=0; i<sources.size(); i++) {
   sources.get(i).textures = suns;
   }
   }*/

  if (key=='e') {
    for (int i=0; i<sources.size(); i++) {
      sources.get(i).textures = nuits;
    }
    orage.play();
    orage.rewind();
    checkciel = 3;
    
  }

  if (key=='s') {
    for (int i=0; i<sols.size(); i++) {
      sols.get(i).textures = boues;
    }
    pouic.play();
    pouic.rewind();
    checksol = 5;
  }

  if (key=='q') {
    for (int i=0; i<sols.size(); i++) {
      sols.get(i).textures = textures;
      checksol = 4;
    }
  }

  if (key=='d') {
    for (int i=0; i<sols.size(); i++) {
      sols.get(i).textures = champs;
    }
    checksol = 2;
  }
  /*else{
  checksol  = 0;
  }*/

  if (key=='f') {
    for (int i=0; i<sols.size(); i++) {
      sols.get(i).textures = herbes;
    }
    checksol = 1;
  } 
  /*else{
  checksol  = 0;
  }*/

  if (key=='g') {
    for (int i=0; i<sols.size(); i++) {
      sols.get(i).textures = sables;
    }
    checksol = 3;
  }
 

  /*  if(key=='k'){
   }*/


  /*    if (key=='c') {
   construcSource();
   }
   if (key=='d') {
   while (sources.size()>0) {
   sources.remove(0);
   }
   }*/
}
