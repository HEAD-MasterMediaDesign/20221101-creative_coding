float a_3 = 0.0;
float s_3 = 0.0;

void draw1() {

  background(0, 15, 30);

  a_3 = a_3 + 0.02;
  s_3 = cos(a_3)*1;
  
  pushMatrix();
  
  translate(width/2, height/2);
  scale(s_3);
  fill(#D12323);
  ellipse(0, 0, 1400, 1400);
  fill(#762E2E);
  ellipse(0, 0, 800, 800);
  fill(0);
  ellipse(0, 0, 50, 50);
  popMatrix();
  
}
