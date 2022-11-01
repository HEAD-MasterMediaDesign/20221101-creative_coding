/////////////////////////////////////////////
//sketch 3
float a_4 = 0.0;
float s_4 = 0.0;

float a_5 = 0.0;
float s_5 = 0.0;

void draw3() {
 background(0,15,30);
  
  pushMatrix();
  translate(width/2,height/2);
  fill(255);
  
  
  for(int a=0; a<360; a+=6){
    float x = random(99,318);
    float xx = random(39,238);
    pushMatrix();
    rotate(radians(a));
    strokeCap(CORNER);
    strokeWeight(1);
    stroke(random(0),random(214),random(198));
    line(x, 0, xx, 0);
    popMatrix();
  }
   popMatrix();
   
   pushMatrix();
    a_4 = a_4 + 0.01;
    s_4 = cos(a_4)*1;
   translate(width/2,height/2);
  fill(0);
    ellipse(0,0,10,10);
    
  scale(s_4);

  for(int a=0; a<360; a+=6){
    float x = random(241,545);
    float xx = random(349,470);
    pushMatrix();
    rotate(radians(a));
    strokeCap(CORNER);
    strokeWeight(1);
    stroke(random(396),random(687),random(593));
    line(x, 0, xx, 0);
    popMatrix();
  }
  popMatrix();
  
  pushMatrix();
    a_5 = a_5 + 0.01;
    s_5 = cos(a_5)*2;
   translate(width/2,height/2);
  fill(255);
  
  scale(s_5);
  for(int a=0; a<360; a+=6){
    float x = random(241,545);
    float xx = random(349,470);
    pushMatrix();
    rotate(radians(a));
    strokeCap(CORNER);
    strokeWeight(2);
    stroke(random(83),random(170),random(290));
    line(x, 0, xx, 0);
    popMatrix();
  }
  popMatrix();
}
