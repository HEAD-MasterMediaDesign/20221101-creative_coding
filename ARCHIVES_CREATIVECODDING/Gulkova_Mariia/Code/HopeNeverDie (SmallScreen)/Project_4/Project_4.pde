int mode=0;


PImage land;
Analysor sl;
void setup() {
  size(1080, 600);
  sl = new Analysor(this, "Bandura1.mp3", 60);
  //background(0);
  land = loadImage("Madonna.png");
  land.resize(1080, 600);

  //frameRate(1000);
  setup4();
}

void draw() {

  if (millis()<2000) {
    mode=1;
  } else if (millis()<20000 ) {
    mode=2;
  } else if (millis()<25000) {
    mode=4;
  } else if (millis()<40000) {
    mode=3;
  } else if (millis()<45000) {
    mode=4;
  } else if (millis()<60000) {
    mode=6;
  } else if (millis()<65000) {
    mode=4;
  } else if (millis()<80000) {
    mode=7;
  } else if (millis()<85000) {
    mode=4;
  } else if (millis()<100000) {
    mode=8;
  } else if (millis()<105000) {
    mode=4;
  } else if (millis()<125000) {
    mode=9;
  } else if (millis()<145000) {
    mode=4;
  } else if (millis()<149955 ) {  
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
