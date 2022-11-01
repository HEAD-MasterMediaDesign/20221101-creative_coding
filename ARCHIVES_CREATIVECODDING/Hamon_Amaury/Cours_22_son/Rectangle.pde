class Rectangle {

  
  float x, y;
  int rot=0;
  int a=0;
  float vx = 0 ;
  float vy = 0 ;

  Rectangle() {
    x=width/2;
    y=height/2;
  }

  void draw() {
    stroke(255);
    strokeWeight(1);
    //strokeWeight(s2.getChannel(4)*1.05);    
    strokeCap(PROJECT);
    strokeJoin(BEVEL);
    
    noFill();
    rect(x, y, vx, vy);
    //pushMatrix();
    //translate(vx/2,vy/2);
    //beginShape();
    //vertex(x,y);
    //vertex(x+vx,y);
    //vertex(x+vx,y+vy);
    //vertex(x,y+vy);
    //endShape(CLOSE);
    //popMatrix();
    
    vx += float(width) / 150.0;
    vy += float(height) / 150.0;

    //vx=mouseX;
    //vy=mouseY;

    pushMatrix();
    translate(x, y);
    rotate(radians(rot));
    //line(0, 0, x, y);
    popMatrix();

    //rot = rot + 1;
    //a = a +3;

    //rect(x+taille/2,y,30,30);
  }
}
