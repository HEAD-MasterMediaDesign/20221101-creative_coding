//float rot=0;
float a = 0;
float s = 0;

ArrayList<CercleT> cerclesT = new ArrayList<CercleT>();
ArrayList<CercleTI> cerclesTI = new ArrayList<CercleTI>();
ArrayList<LineT> linesT = new ArrayList<LineT>();

boolean cercleTIActif=false;

/*void settings() {
 size(1920*2, 1080*2, P3D);
 }
 
 
 void setup() {
 
 surface.setLocation(0, 0);
 //pixelDensity(2);
 //frameRate(60);
 }*/
void Tunnel() {
  background(0);

  //CERCLES
  if (frameCount%5==0) {
    cerclesT.add(new CercleT());
    //println("yop");
  }

  for (int i=0; i<cerclesT.size(); i++) {
    cerclesT.get(i).draw();
  }

  for (int i=0; i<cerclesT.size(); i=i+1) {
    if (cerclesT.get(i).tailleT>(width*2)) {
      cerclesT.remove(i);
    }
  }

  //CERCLES INT
  if (cercleTIActif==true) {
    if (frameCount%5==0) {
      cerclesTI.add(new CercleTI());
      //println("yop");
    }

    for (int j=0; j<cerclesTI.size(); j++) {
      cerclesTI.get(j).draw();
    }
  }

  for (int i=0; i<cerclesTI.size(); i=i+1) {
    if (cerclesTI.get(i).tailleTI<0) {
      cerclesTI.remove(i);
    }
  }



  //LINES
  
    if (frameCount%6==0) {
    linesT.add(new LineT());
    //println("yop");
  }

  for (int k=0; k<linesT.size(); k++) {
    linesT.get(k).draw();
  }
  /*
  for (int d = 0; d<dist(0, 0, width, height); d = d+5) {
   
   a = a + 0.04;
   s = a+0.1;
   
   ellipseMode(CENTER);
   //scale(s);
   stroke(255);
   strokeWeight(0.5);
   noFill();
   ellipse(width/2, height/2, d^2, d^2);
   }*/
}
