/////////////////////////////////////////////
//sketch 4
void setup5(){
  
}

void draw5() {
  sl.runAnalyse();
  pushMatrix();
  //image(land,0,0);


  for (int i=0; i<21; i++) {
  
    int x = int(random(width));
    int y = int(random(height));
    color col = land.get(x, y);

    col = color(red(col), green(col)-0, blue(col));

    //noStroke();
    //fill(col);
    //rect(x,y,20,20);

    noStroke();
    stroke(col);
    strokeWeight(random(1, 4));
    line(x, y, x+random(-20, 20), y+random(-20, 20));
  }
  color col2 = land.get(mouseX, mouseY);
  println("r:"+red(col2)+" g:"+green(col2)+" b:"+blue(col2));
  popMatrix();
}
