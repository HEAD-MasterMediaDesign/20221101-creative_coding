class Ant {
  float x;
  float y;
  float vx=1; // pour la vitesse
  float vy=1;
  color col;
  PImage bob;  // pour l'image
  float ang=0; // pour le push/popmatrix
  float angyeux;
  float[] x2 = new float[10];
  float[] y2 = new float[10];
  float segLength = 3;

  int t=0;
  int tMax=int(random(100, 200));

  float freq1;
  float freq2;
  Analysor an;
  int cha1=0; //...
  int cha2=0;
  float direction;
  int size;
  int sizedivider=1;

  boolean pushed=false;


  Ant(float cx, float cy, Analysor an, float anglePI, float autrechose, color managementcol, int taille) {
    x=cx;
    y=cy;
    angyeux=anglePI;
    direction=autrechose;
    this.an=an;
    //bob=loadImage("bob.png");
    //col = color(255, random(150, 220), random(150, 220));
    col = managementcol;
    size = taille;
  }

  void displayAnt() {
    sizelink();

    //attribue freq à la donnée du channel
    //freq1 = an.getChannel(cha1);
    //freq2 = an.getChannel(cha2);

  //  println ("pushed: "+pushed);

    if (pushed==false) { //si la variable "pushed" est fausse, alors la freq diminue jusqua s'arreter (0.9)
      freq1=freq1*0.9;
      freq2=freq2*0.9;
    }

    //truc qui definit que la vitesse bouge en fonction de la freq
    x+=random(-1, 1)+vx*freq1*0.2;
    y+=random(-1, 1)+vy*freq2*0.2;


    noStroke(); //pas de contour pour le corps
    fill(col); //couleur du corps
    //  println("freq1: "+x);


    //-------YEUX
    //mouvement en fonction de freq
    //ellipse(x, y, 12*(freq1/40+1), 12+(freq2/40+1));

    //image(bob,x, size*(abs(freq1)/60+1));
  
    circle(x, y, size*(abs(freq1)/60+1));
    
    dragSegment(0, x, y);
    for(int i=0; i<x2.length-1; i++) {
    dragSegment(i+1, x2[i], y2[i]);
  }

    //ellipse(x, y, 20, 20);

    noStroke();
   
    /*
    pushMatrix();     //debut pate 
    fill(255,40);
    translate(x, y);
    rotate(5+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, ((10*sizedivider)+abs(freq1*0.1)));
    popMatrix();       //fin pate
    
    pushMatrix();     //debut pate 2
    fill(255,40);
    translate(x, y);
    rotate(10+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, ((10*sizedivider)+abs(freq1*0.1)));
    popMatrix();       //fin pate 2
    
    pushMatrix();     //debut pate 2
    fill(255,40);
    translate(x, y);
    rotate(15+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, ((10*sizedivider)+abs(freq1*0.1)));
    popMatrix();       //fin pate 2
    
    pushMatrix();     //debut pate 3
    fill(255,40);
    translate(x, y);
    rotate(20+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, ((10*sizedivider)+abs(freq1*0.1)));
    popMatrix();       //fin pate 3

    pushMatrix();     //debut pate 4
    fill(255,40);
    translate(x, y);
    rotate(25+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, ((10*sizedivider)+abs(freq1*0.1)));
    popMatrix();       //fin pate 4
*/


    pushMatrix();     //debut noir centre
    fill(0, 95);
    translate(x, y);
    rotate(2+(freq1*0.05)+angyeux);
    translate(0, 0);
    circle(0, 0, abs(size/1.3));
    popMatrix();       //fin pour noir centre

    pushMatrix();      //debut pour blanc oeil 1
    fill(255);
    translate(x, y);
    rotate((freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, 10+abs(freq1*0.2));
    popMatrix();       //fin pour blanc oeil 1

    pushMatrix();      //debut noir pour oeil 1
    fill(0);
    translate(x, y);
    rotate((freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, 5+abs(freq1*0.1));
    popMatrix();       //fin noir pour oeil 1


    pushMatrix();     //debut pour blanc oeil 2
    fill(255);
    translate(x, y);
    rotate(2+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, 10+abs(freq1*0.1));
    popMatrix();       //fin pour blanc oeil 2

    pushMatrix();     //debut noir pour oeil 2
    fill(0);
    translate(x, y);
    rotate(2+(freq1*0.03)+angyeux);
    translate(size/sizedivider, 0);
    circle(0, 0, 5+abs(freq1*0.1));
    popMatrix();       //fin noir pour oeil 2
    


    //println("angle"+angles[3]);

    ang+=0.04;
    if (x>width || x<0)vx=vx*-1;
    if (y>height || y<0)vy=vy*-1;
    if (t>tMax) {
      //freq1=random(-1,1);
      //freq2=random(-1,1);
      t=0;
      tMax=int(random(100, 200));
    }

    t++;
  }

  void sizelink() {
    if (size<=10) {
      sizedivider=2;
    }
    if (size>=11 && size<=20) {
      sizedivider=2;
    }
    if (size>=21 && size<=30) {
      sizedivider=2;
    }
    if (size>=31 && size<=50) {
      sizedivider=2;
    }
    if (size>=51 && size<=70) {
      sizedivider=3;
    }
    if (size>=71 && size<=90) {
      sizedivider=2;
    }
    if (size>=91 && size<=110) {
      sizedivider=2;
    }
  }
  
void dragSegment(int i, float xin, float yin) {
  float dx = xin - x2[i];
  float dy = yin - y2[i];
  float angle = atan2(dy, dx);  
  x2[i] = xin - cos(angle) * segLength;
  y2[i] = yin - sin(angle) * segLength;
  segment(x2[i], y2[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  stroke(203,245,245,50);
  strokeWeight(5);
  line(0, 0, segLength, 0);
  popMatrix();
}



}
