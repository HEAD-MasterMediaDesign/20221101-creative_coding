class backLines {



  float x;
  float y;

  float vy = 0.2;
  color couleur;

  backLines(float posX, float posY) {

    x = posX;
    y = posY;

    couleur = color(random(255), 0, random(255));
  }

  void display(int loopnumber, int randomZ) {

    
    
    stroke(0, 255, 255);

    stroke(couleur);
    
   

    //x+=vx;

    //line(x,y,x+100,y-10);
     

     

    for (int x2=0; x2 < 100; x2++) {
      int restex = x2 % 3;
      noFill();
      pushMatrix();
      stroke(couleur);
      
     // line(x, y-500*x2, 400, y-500*x2);
      popMatrix();

      //y+=vy/3;


      if (restex == 0) {
        //stroke(235, 8, 105);
        stroke(couleur);
      }
      if (restex ==1) {

        stroke(couleur);
      }
      if (restex ==2) {
        //stroke(244, 79, 202);
        stroke(couleur);
      }

      // line(x,y+x2*100,x+width,y+x2*100);

      stroke(0, 255, 255);

      //line(200, 100+x2*10, 400, 100+x2*10);

      //line(200, 100+x2*10, 400, 100+x2*10);
    }
    
    
  }
}
