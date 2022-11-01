float dia = 400;

float a_20 = 0.0;
float s_20 = 0.0;

color[] colArray1 = {
    color(118, 46, 46),
    color(144, 57, 57),
    color(153, 59, 59),
    color(181, 72, 72),
    color(204, 78, 78),
    color(226, 81, 81),
  };

void setup9(){

  size(1080,600);
 
  strokeCap(CORNER);
  stroke(colArray1[int(random(5))]);
  frameRate(30);
  
}

void draw9(){
  background( 0, 15, 30);
  
  a_20 = a_20 + 0.01;
  s_20 = cos(a_20)*1.7;
  pushMatrix();
  
  translate(width/2,height/2);
  scale(s_20);
  for (int a=0; a<360; a+=30){
    rotate(frameCount / 200.0);
    pushMatrix();
    rotate(radians(a));
    fill(#762E2E);
    for (int r=0; r<130; r+=20){
      ellipse(sin(radians(r))*dia, cos(radians(r))*dia, sin(radians(-r))*dia, cos(radians(-r))*dia);
    }
    popMatrix();
  }
  
  popMatrix();
}
