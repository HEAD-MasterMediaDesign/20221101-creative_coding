int mode=0;


PImage land;
Analysor sl;
void setup() {
  //size(1080, 600);
  fullScreen(P2D,SPAN);
  sl = new Analysor(this, "Bandura1.mp3", 60);
  //background(0);
  land = loadImage("Madonna.png");
 land.resize(1449, 805);
 imageMode(CENTER);

  //frameRate(1000);
  setup4();
}

void draw() {

  if (millis()<8000) {
    mode=1;
  } else if (millis()<30000 ) {
    mode=2;
  } else if (millis()<35000) {
    mode=4;
  } else if (millis()<50000) {
    mode=3;
  } else if (millis()<55000) {
    mode=4;
  } else if (millis()<70000) {
    mode=6;
  } else if (millis()<75000) {
    mode=4;
  } else if (millis()<90000) {
    mode=7;
  } else if (millis()<95000) {
    mode=4;
  } else if (millis()<120000) {
    mode=8;
  } else if (millis()<125000) {
    mode=4;
  } else if (millis()<145000) {
    mode=9;
  } else if (millis()<165000) {
    mode=4;
  } else if (millis()<169955 ) {  
    background(0, 15, 30);
    mode=-1;
  } else if (millis()<180000 ) {
    //background(0, 15, 30);
    mode=5;
  }

  if (mode==1) {
    draw1();
  }
  if (mode==2) {
    draw2();
  } else if (mode==3) {
    draw3();
  } else if (mode==4) {
    draw4();
  } else if (mode==5) {
    draw5();
  } else if (mode==6) {
    draw6();
  } else if (mode==7) {
    draw7();
  } else if (mode==8) {
    draw8();
  } else if (mode==9) {
    draw9();
  }



  println(millis()+"  "+"mode : "+mode);
}


void keyPressed() {
  if (keyCode==LEFT)mode--;
  if (keyCode==RIGHT)mode++;
}
