
//aquí dibujas lo que quieras.
void dibuja8() {


  strokeWeight(1); //Ancho de linea
  stroke(random(100), random(100), random(100));
  noFill();
  ellipse(0, 0, mouseY/+5, mouseY/+5);
}
