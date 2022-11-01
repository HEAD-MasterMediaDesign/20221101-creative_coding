float a_9 = 0.0;
float s_9 = 0.0;

float a_10 = 0.0;
float s_10 = 0.0;

float a_11 = 0.0;
float s_11 = 0.0;

float a_12 = 0.0;
float s_12 = 0.0;

float a_13 = 0.0;
float s_13 = 0.0;

float a_14 = 0.0;
float s_14 = 0.0;

float a_15 = 0.0;
float s_15 = 0.0;

int d = 100;
int p1 = d;
int p2 = p1+d;
int p3 = p2+d;
int p4 = p3+d;


void setup6() {
  size(1080, 600);
  
  noStroke();
  
  rectMode(CENTER);
  
 
}

void draw6() {
  
  background(0,15,30);
  
  a_9 = a_9 + 0.02;
  s_9 = cos(a_9)*1;
  
  a_10 = a_10 + 0.03;
  s_10 = cos(a_10)*1.2;
  
  a_11 = a_11 + 0.04;
  s_11 = cos(a_11)*1.3;
  
  a_12 = a_12 + 0.04;
  s_12 = cos(a_12)*1.4;
  
  a_13 = a_13 + 0.04;
  s_13 = cos(a_13)*1.5;
  
  a_14 = a_14 + 0.05;
  s_14 = cos(a_14)*1.6;
  
  a_14 = a_14 + 0.05;
  s_14 = cos(a_14)*1.7;
 
 pushMatrix();
  translate(width/2, height/2);
  
  scale(s_9); 
  
  stroke(#D12323);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);
  
  scale(s_10);
  stroke(random(255));
  line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);
  
  scale(s_11); 
  
  stroke(#D12323);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);

scale(s_12); 
  
  stroke(#D12323);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);

scale(s_13); 
  
  stroke(#D12323);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);

scale(s_14); 
  
  stroke(random(255));
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);
 
 scale(s_15); 
  
  stroke(#D12323);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2);
line(p3, p2, p3, p3);
popMatrix();

}
