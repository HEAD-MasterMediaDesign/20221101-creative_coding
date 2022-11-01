
//aquí dibuja.
void dibuja10() {
  
  color col;
  col = color (random(255),random(200), random(100));
  
  fill(col);
  blendMode(LIGHTEST);
  strokeWeight(2); //Ancho de linea
  stroke(col,255); //Color de linea // Azul electrico
  line(0,0,mouseY/+2,mouseY/+2);
  
     
}
