class Particles {

  int Y_AXIS = 1;
  int X_AXIS = 2;
  color b1, b2, c1, c2;
  //Particle Position Y
  float x;
  // Particle Position Y
  float y;
  //Particle velocity X
  float vx = random(-1, 1);
  // Particle velocity Y
  float vy = random(1, 2);

  // Particle color
  color couleur;
  float couleur2;
  float couleur3;
  float size1;
  int counter2;


  float x2;
  float y3;

  Particles(float posX, float posY) {
    //assign Particle position to fonction when called
    x = posX;
    y = posY;
    couleur = color(random(255));
  }

  int lightsCounter;
  void displayLights(int numberOfLights) {

    lightsCounter++;
    if (lightsCounter <= numberOfLights) {
    }

    float sin1 = sin((float)frameCount*0.009)*1;
    couleur2 = map(sin1, -1, 1, 0, 255);


    float sin2 = sin((float)frameCount*0.01)*100;
    float blinkingLights = map(sin2, -1, 1, 0, 255);
    //x+= vx;
    //translate(0, 0, 30);

    stroke(255, 50);
    line(x, y-300, x, y+couleur2/2);
    fill(255, 255, 255, blinkingLights);
    stroke(0, 255, 255);
    circle(x, y-300, couleur2*0.05);
  }

  void display(int loopnumber, int randomZ, boolean cityDisplay) {


    //float change2 = sin((float)frameCount*0.01)*100;
    // float change3 = sin((float)frameCount*0.001)*20;

    //float  buildingHeight = map(change3, -1, 1, 100, 150);
    int  buildingHeight = 400;
    // float couleur90 = map(change3, -1, 1, 125, 255);
    //float couleur3 = map(change3, -1, 1, 255, 0);

    // stroke(0, couleur90, couleur90, 10);
    //fill(0,couleur2,couleur2,-1*couleur2);
    //fill(20,20,20,couleur90);

    // counter2+=10;
    //println(loopnumber);

    int module = loopnumber%3;
    float buildingWidth = 15;

    if (module == 0) {
      buildingWidth = 50;
    }
    if (module ==1) {
      buildingWidth = 40;
    }
    if (module == 2 ) {
      buildingWidth = 20;
    }





    //random Z POS
    translate(0, 0, randomZ);

    //rotateX(mouseX);
    //rotateZ(loopnumber);

    //Buildings backlight blue


    pushMatrix();

    stroke(0, 255, 255);
    translate(0, 0, -10);
    //fill(0, 255, 255);
    noFill();

    if (cityDisplay) rect(x, y, buildingWidth, buildingHeight*2);
   


    //Buildings backlight white
    
    translate(0, 0, -10);
    //fill(255,50);
    noFill();
    stroke(255);
    if (cityDisplay) rect(x, y, buildingWidth, buildingHeight*2);
    popMatrix();

    //mainBuildings
    fill(0);
    stroke(255, 100);
    if (cityDisplay) rect(x, y, buildingWidth, buildingHeight*2);

    //windows
    for (int i = 0; i <= 40; i++) {
      if (cityDisplay) x2 = lerp(x, x, i/50.0);
     if (cityDisplay) y3 = lerp((y-buildingHeight)+10, y+buildingHeight, i/50.0);
      pushMatrix();
      int rectw = 3;
      int recth = 3;
      int restex = i % 3;

      if (restex == 0) {
        fill(255, 255, 255);
        recth = 3;
        rectw = 3;
       if (cityDisplay) x2 += buildingWidth/10;
      }
      if (restex ==1) {
        stroke(255, 255, 255);
        recth = 5;
        rectw = 2;
       if (cityDisplay) x2 -= buildingWidth/10;
      }
      if (restex ==2 ) {
        //noStroke();
        fill(255, 255, 255);
        recth = 5;
        rectw = 2;
        if (cityDisplay) x2 += buildingWidth/10;
      }

      
      translate(0, 0, 5);
      if (!cityDisplay) rectw = 0;
      if (!cityDisplay) recth = 0;
      rect(x2, y3, rectw, recth);
      popMatrix();
    }
  }
}
