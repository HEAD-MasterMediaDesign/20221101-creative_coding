
void dibuja6() {
  float x, y;
  float x1,y1,x2,y2,x3,y3;
  
  stroke(#DB1A29, 255); //Color de linea // Rojo naranja
  strokeWeight(2); //Ancho de linea
  x=random(-60,60);
  y=random(-60,60);
  x1=random(-50,20);
  y1=random(-50,20);
  x2=random(-50,20);
  y2=random(-50,20);
  x3=random(-50,20);
  y3=random(-50,20);
  line ((random(20)), 0, x, y);
  fill(0, t*30);
  stroke(#008C72,30); // Verde Riviera
  triangle(y2, x1, y3, y1, x2, x3);
  

}
