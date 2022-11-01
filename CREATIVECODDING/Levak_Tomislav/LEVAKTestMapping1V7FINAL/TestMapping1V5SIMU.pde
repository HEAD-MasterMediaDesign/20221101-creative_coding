Analysor s1;
float spacingCint= sqrt((pow(width,2))+(pow(height,2)))/3;
//float spacing=50;

int timer=0;
float ang=0;
//float rot=0;
int mode=1;

/*void settings(){
  size(1920*2,1080*2,P3D);
}*/


void setup() {
  //size(1500,200,P3D);
  fullScreen(P3D,SPAN);
  //surface.setLocation(0,0);
  //surface.
  
  //s1 = new Analysor(this, "Heavee - 8 Bit Shit.mp3", 60);
  s1 = new Analysor(this, "DO U WANNA B MINE - DJ RASHAD X DJ SPINN X DJ PAYPAL (RSP).mp3", 60);
}

void draw() {
  //background(0);
  s1.runAnalyse();
  s1.drawPreAnalyse(0, 0, width, 300);

if (mode==1){
Hermann();
}

else if (mode==2){
Shape();
}
else if (mode==3){
Cascade();
}
else if (mode==4){
Tunnel();
}
else if (mode==5){
Coeur();
Coeur2();
}
}
