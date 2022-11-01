int x, y, t;

void dibuja4() {
  blendMode(LIGHTEST);
  noStroke();
  fill(#7C05F2, t*30); // Violeta
  x = (int)random(-10, 50);
  y = (int)random(-10, 50);
  t = (int)random(5, 20);
  ellipse(x, y, t, t);
  stroke(#D93250); // Rojo Magenta
  line(x, y, t+30, t+20);
  
}
