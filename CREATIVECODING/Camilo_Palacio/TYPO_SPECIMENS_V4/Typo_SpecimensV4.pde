import geomerative.*;
import processing.pdf.*;
import ddf.minim.*;
//import processing.sound.*;
//import processing.video.*;
boolean record;
//SoundFile music;
//Movie myMovie;

//declara objetos. declare objects
PFont myFont;
RFont font;
String SampleText = "a";
RPoint[] pnts;
int indexDibujar=1;
int timer=0;
float vel=30;

Minim minim;
AudioPlayer groove;
PImage img;

void setup() {

  fullScreen(P3D, SPAN);
  //fullScreen(P2D);
  //size (4500,1080);
  textSize(16);

  minim = new Minim(this);
  groove = minim.loadFile("PAPAYA TROPICAL Shivaldamán.mp3", 1024);
  groove.loop();


  //myMovie = new Movie(this,"TESTVIDEO02.mp4");
  //myMovie.play();

  //music = new SoundFile(this, "15 The Drift Of Air Ver.2.mp3");
  //music.loop();
  // inicia la libreria y genera la fuente. Starts the library and generates the source
  RG.init(this);
  font = new RFont("botw-hylian.ttf", 500, RFont. LEFT) ;
///botw-hylian
//zuptype_SIM
  //img = loadImage("GRADIENTZ.jpg");
  //img.resize(width,height);

  // define la densidad de puntos. Defines the density of the points
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  refreshText();
  
  
  //size(685,400);
  //img = loadImage("VISUAL REFERENCE 09.png");
  


}
  



void refreshText() {
  if ( SampleText. length () > 0) {
    // genera un grupo de elementos graficos.Generates a group of graphic elements
    RGroup grp;
    // asignalos al texto. Assign them to the text
    grp = font.toGroup(SampleText);
    // coloca los puntos a lo largo del outline. Place the points along the contour
    pnts = grp.getPoints();
  }
}


void draw() {

  //image(img, 0,0);
  // instrucción para exportar a pdf. Instructions for exporting to pdf
  // (Asigna carpeta y nombre del archivo). Asign folder and file name
  if (record) {
    beginRecord(PDF, "pdf/txtln-####.pdf");
  }

  //background(255); // color de fondo. Background color
  //if (indexDibujar==1)loadImage("VISUAL REFERENCE 09.png");
  if (indexDibujar==1)background(#08070D);
  if (indexDibujar==2)background(#130000);
  if (indexDibujar==3)background(#02000D);
  if (indexDibujar==4)background(#010626);
  if (indexDibujar==5)background(#011526);
  if (indexDibujar==6)background(#091312);
  if (indexDibujar==7)background(#1A0226);
  if (indexDibujar==8)background(#0E0D29);
  if (indexDibujar==9)background(#0E0D29);
  if (indexDibujar==10)background(#08070D);

  //tint(255);
  //image(img,0,0);
  ////image(myMovie,0,200);

  //===============================================================
  //music curve
  // Shape 1 CIAN > left
    stroke(#4F9FE5);
  noFill();
  beginShape();
  float y=1100;
  float step=float(width)/groove.bufferSize();
  for (int i=0; i<groove.bufferSize(); i++) {
    float s = groove.left.get(i);
    vertex(i*step, y+s*800);
  }
  endShape();

  // Shape 1 MAGENTA > right
  blendMode(LIGHTEST);
  stroke(#DB568F);
  noFill();
  beginShape();
  for (int i=0; i<groove.bufferSize(); i++) {
    float s = groove.right.get(i);
    vertex(i*step, y+s*800);
  }
  endShape();

  // Shape 3 GREEN
  stroke(#00B396);
  noFill();
  beginShape();
  for (int i=0; i<groove.bufferSize(); i++) {
    float s = groove.right.get(i)+groove.left.get(i);;
    vertex(i*step, y+s*800/2);
  }
  endShape();
  
   // Shape 4 YELLOW
  stroke(#FFAE4A);
  noFill();
  beginShape();
  for (int i=0; i<groove.bufferSize(); i++) {
    float s = groove.right.get(i)+groove.left.get(i);;
    vertex(i*step, y+s*800/3);
  }
  endShape();
  
  
  //===============================================================


  fill(255, 220);
  textAlign(LEFT);
  text("A   M   E   R   I   N   D   I   A   N", 100, 180);
  text("T   Y   P   O   G   R   A   P   H   Y       S   P   E   C   I   M   E   N   S", 100, 200);
  text("P   A   P   A   Y   A       T   R   O   P   I   C   A   L", 100, 240);
  text("S   H   I   V   A   L   D   A   M   Á   N   ©", 100, 260);
  text("2     0     2     2", 3800, 200);

  translate (250, 800);  // posición del texto. Text position

  for (int i=0; i<pnts.length; i++) {
    pushMatrix();
    translate(pnts[i].x, pnts[i].y);
    if (indexDibujar==1)dibuja1();
    if (indexDibujar==2)dibuja2();
    if (indexDibujar==3)dibuja3();
    if (indexDibujar==4)dibuja4();
    if (indexDibujar==5)dibuja5();
    if (indexDibujar==6)dibuja6();
    if (indexDibujar==7)dibuja7();
    if (indexDibujar==8)dibuja8();
    if (indexDibujar==9)dibuja9();
    if (indexDibujar==10)dibuja10();
    popMatrix();
  }

  if (record) {
    endRecord();
    record = false;
  }
  //saveFrame("GIF/GROW-######.png");  //salva frames en png. Save frames in png

  if (timer>60*10) {
    indexDibujar=int(random(1, 9));
    timer=1;
  }
  timer++;
}



// cuando presionas la tecla e exporta como pdf. When you press the "e" key it exports as pdf
void keyPressed() {
  if (key=='e') {
    //record = true;
  }

  if (keyCode==LEFT)indexDibujar--;
  if (keyCode==RIGHT)indexDibujar++;
  if (keyCode==32)indexDibujar=int(random(1, 10));

  if (keyCode==BACKSPACE) {
    if (SampleText.length()>0)SampleText = SampleText.substring(0, SampleText.length()-1);
  }
  if (key>=char('a') && key<=char('z')) {
    SampleText += key;
  }
  refreshText();
}

// Called every time a new frame is available to read
//void movieEvent(Movie m) {
//  m.read();
//}
