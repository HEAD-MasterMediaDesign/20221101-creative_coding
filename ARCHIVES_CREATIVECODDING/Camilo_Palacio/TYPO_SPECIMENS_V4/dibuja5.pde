

void dibuja5() {
  blendMode(EXCLUSION);
  noStroke();
  fill(#02A676, t*30); // Verde Riviera
  x = (int)random(-15, 20);
  y = (int)random(-15, 20);
  t = (int)random(4, 20);
  ellipse(x, y, t, t);
  noStroke();
  //fill(#FF6C2E, t*30); // Naranja
  ellipse(x, y, t, t);
  stroke(#F4A617,10); // Amarillo
  line(x, y, t+40, t+40);
  
}
