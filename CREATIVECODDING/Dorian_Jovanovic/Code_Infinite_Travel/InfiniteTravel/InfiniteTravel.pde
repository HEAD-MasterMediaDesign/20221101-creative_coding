import peasy.*;

PeasyCam cam;

Particles[] particlesArray = new Particles[800];
backLines[] backLinesArray = new backLines[0];
Analysor s1;

float lastDist = 1510000;


float[] randomPosY = new float[5100];
float[] randomPosX = new float[5100];

int[] randomScale = new int[5100];
int[] randomScaleSmall = new int[5100];


boolean showCity = false;
boolean [] scenes = new boolean [7];
int camSpeed = 300;

PShader blur;
float vx = 0.3;
float wesh;
int dim;
float travelSpeed;
float OriSpeed;

float rotA;
float doaflip;
float transition;

float distmaxCam = 150000;

boolean back = true;

float manualDist;


float freq1;

float circleSize =3000;

float bubbleCamDist = 321000.0;

float floorRectsDist = 610000;

float startingPoint = 0;

void setup() {

  fullScreen(P3D, SPAN);
  //size(1000,1000,P2D);
  frameRate(60);
  blur = loadShader("blur.glsl");
  s1 = new Analysor(this, "synthwave-goose-blade-runner-2049.mp3", 60);

  cam = new PeasyCam(this, 600);


  ////////camera controls

  /*
   println(cam.getLookAt()));
   println(cam.getDistance()));
   println(cam.getRotations()));
   
   //set data
   
   //set coordonnée(x,y,z,Distance)
   cam.lookAt(0.0,0.0,0.0,2412.0);
   
   //set rotation (x,y,z)
   cam.setRotations(0.0,0.0,0.0);
   */

  cam.lookAt(width/2, height/2, 0.0, 2412.0);





  background(0);
  //loading All Instances
  for (int i=0; i < particlesArray.length; i++) {
    //particlesArray[i] = new Particles(random(700, 1200), random(200, 500));
    particlesArray[i] = new Particles(random(-50, width), random(900, 1200));
  }

  for (int i=0; i < backLinesArray.length; i++) {
    backLinesArray[i] = new backLines((random(width)), random(900, height+500));
  }

  //randomPosX, RandomPosY
  for (int i=0; i < randomPosY.length; i++) {
    //particlesArray[i] = new Particles(random(700, 1200), random(200, 500));

    randomPosY[i] = random(-height*4, height*4);
  }

  for (int i=0; i < randomPosX.length; i++) {
    //particlesArray[i] = new Particles(random(700, 1200), random(200, 500));

    randomPosX[i] =random(-width*4, width*4);
  }


  for (int i=0; i < randomScale.length; i++) {
    //particlesArray[i] = new Particles(random(700, 1200), random(200, 500));

    randomScale[i] =int(random(10, 1000));
  }


  for (int i=0; i < randomScaleSmall.length; i++) {
    //particlesArray[i] = new Particles(random(700, 1200), random(200, 500));

    randomScaleSmall[i] =int(random(10, 500));
  }
}


void draw() {

  /////////Camera Cipping
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height),
    cameraZ/1.0, cameraZ*10000.0);
  //////// Printscreen with key == 's'
  printScreen();
  //////// Sins value for camera movement back and forth
  float sinTravel = sin((float)frameCount*0.005)*100;
  float sinAngle = sin((float)frameCount*0.00)*10;
  travelSpeed = map(sinTravel, 100, -100, 150000, 1);
  OriSpeed = map(sinAngle, -1, 1, -0.005, 0.005);
  //////// Debug
  //println(sinTravel);
  //println("camdist: "+ cam.getDistance());
  //cam.setRotations(0.0, OriSpeed, 0.0);
  //////// Camera movement with keys
  if (keyPressed == true) {
    if (key=='a') {
      rotA+=0.001;
      cam.setRotations(0.0, rotA, doaflip);
    }
    if (key=='d') {
      rotA-=0.001;
      cam.setRotations(0.0, rotA, doaflip);
    }
    if (key=='x') {
      doaflip+=0.05;
      //transition+=20;
      cam.setRotations(0.0, rotA, doaflip);
    }
    if (key=='u') {
      lastDist-=1500;
      //cam.lookAt(width/2, height/2, 0.0, manualDist);
      //cam.lookAt(width/2, height/2, 0.0, manualDist, (long)1);
      for (int i = 0; i<=100; i++) {
        //manualDist = lerp(0,-500,i/100);
      }
      //manualDist=0;
    }
    if (key=='j') {
      lastDist+=1500;
      //cam.lookAt(width/2, height/2, 0.0, manualDist, (long)1);
      for (int i = 0; i<=10; i++) {
        //manualDist += lerp(manualDist-500,manualDist,i/10);
      }
      //manualDist=0;
    }
  }

  
    
  
  if (lastDist>9000) {
    //lastDist-=300;
  } else {
    camSpeed = 50;
  }
  
  if(scenes[6]){
    camSpeed = 455;
  }
  
  if(scenes[5]){
  camSpeed = 410;
  }
  
  
  
  if(lastDist<308055&&lastDist>300000){
  camSpeed = 100;
  }
  
  if(scenes[3]){
  camSpeed = 100;
  }
  
  lastDist-=camSpeed;
  

  //lastDist-=300;
  cam.lookAt(width/2, height/2, 0.0, lastDist, (long)1);
  /////Camera automatic Mouvement Sin
  // cam.lookAt(width/2, height/2, 0, travelSpeed);
  //cam.lookAt(width/2, height/2, 0.0, manualDist);
  ///soundscam
  //cam.lookAt(width/2, height*0.75, 0, distmaxCam -=s1.getChannel(17)*100);

  /////Camera manual Mouvement


  //bubbleCamDist-=500;
  //cam.lookAt(width/2, height/2, 0, bubbleCamDist);
  //println(manualDist);
  //Bubbles dist: 321000.0
  //background(0);

  /////Camera data distance convertion to Float, for making elements following the camera
  double dZ = cam.getDistance();
  float fZ = (float)dZ;

  /////Front World Background
  rectMode(CENTER);
  pushMatrix();
  translate(0, 0, fZ-25000);
  fill(0, 100);
  noStroke();
  if (keyPressed) {
    if (key == 'l') {
      back = true;
    }
    if (key == 'p') {
      back = false;
    }
  }
  if (back) {
    rect(width/2, height/2, 1000000, 1000000);
  } else {
  }
  popMatrix();



  ////Infinite Travel
  //boolean [] valueForSwitch = funcMapValueForSwitch(bubbleCamDist);
  println("cam Z position: " + lastDist);
  showScenes(funcMapValueForSwitch(lastDist));
  /////Sound data analyse
  s1.runAnalyse();
  //s1.drawPreAnalyse(0, 0, width, 300);
  /////Lumière plafond
  for (int i = 0; i<100; i++) {
    pushMatrix();
    rotateX(PI/2);
    translate(0, 0, 0);
    fill(255, 255);
    noStroke();
    //rect(width/2, i*500, width/2, 20);
    popMatrix();
  }
  ///Floor Camera
  pushMatrix();
  translate(0, height, fZ-2000);
  rotateX(PI/2);
  fill(0, 35);
  //stroke(0, 255, 255);
  //rect(width/2, height/2, width, 30000);
  popMatrix();

  //second floor
  /* pushMatrix();
   translate(0, 900, fZ-2000);
   rotateX(PI/2);
   fill(0, 20);
   stroke(0, 255, 255);
   rect(width/2, 0, width/2, 30000);
   popMatrix();
   */
  /*for (int i=0; i < backLinesArray.length; i++) {
   backLinesArray[i].display(i, 20);
   }*/

  //filter(blur);

  //city floor
  pushMatrix();
  translate(0, height, 0);
  rotateX(PI/2);
  fill(0, 35);
  //stroke(0, 255, 255);
  rect(width/2, height/2, width, 20000);
  popMatrix();
  /// Buildings


  //// CITY SCENE
  pushMatrix();
  //translate(width/2,height/2);
  if (showCity) {
    for (int i=0; i < particlesArray.length; i++) {
      //particlesArray[i/10].displayLights(100);
      particlesArray[i].display(i, 10, showCity);
    }
  }
  popMatrix();
  fill(0);
  noStroke();




  //SCENE 8 SQUARES FAST PORTAL
  pushMatrix();
  translate(0, 0, 942000);
  for (int i = 0; i<1000; i++) {

    translate(0, 0, 300);
    //rotate(0.1);
    //fill(255);
    noFill();
    stroke(0, 255, 255);
    rect(width/2, height/2, 5000-(i*100), 5000-(i*100));
    //rotate(i/100);
  }
  popMatrix();
  //SCENE 8 SQUARES rotated FAST PORTAL
  pushMatrix();
  translate(0, 0, 1120000);
  for (int i = 0; i<1000; i++) {

    translate(0, 0, 300);
    //rotate(0.1);
    //fill(255);
    noFill();
    stroke(0, 255, 255);
    rect(width/2, height/2, 5000-(i*100), 10000-(i*100));
    //rotate(i/100);
  }
  popMatrix();


  //SCENE 8 SQUARES rotated FAST PORTAL
  pushMatrix();
  translate(0, 0, 1311000);
  for (int i = 0; i<1000; i++) {

    translate(0, 0, 300);
    rotate(0.1);
    //fill(255);
    noFill();
    stroke(0, 255, 255);
    rect(width/2, height/2, 5000-(i*100), 5000-(i*100));
    //rotate(i/100);
  }
  popMatrix();
}


void printScreen() {

  if (keyPressed == true) {
    if (key=='s') {
      save("Pictures/"+hour()+"."+minute()+"."+second()+"_"+day()+"."+month()+"_"+"InfiniteTravel.jpg");
    }
  }
}


boolean [] funcMapValueForSwitch (float numberToCheck) {

  
  if (numberToCheck>=0 && numberToCheck <= 20000) scenes[0] = true;
  else scenes[0] = false;

  if (numberToCheck>=15000 && numberToCheck <= 90000) scenes[1] = true;
  else scenes[1] = false;

  if (numberToCheck>=84000 && numberToCheck <= 162000) scenes[2] = true;
  else scenes[2] = false;

  if (numberToCheck>=120000 && numberToCheck <= 222000) scenes[3] = true;
  else scenes[3] = false;

  if (numberToCheck>=201000 && numberToCheck <= 327000) scenes[4] = true;
  else scenes[4] = false;

  if (numberToCheck>=310000 && numberToCheck <= 836500) scenes[5] = true;
  else scenes[5] = false;

  if (numberToCheck>=836500 && numberToCheck <= 942000) scenes[6] = true;
  else scenes[6] = false;

  println(scenes);
  return scenes;
}

void showScenes(boolean [] valueForSwitch) {

  if (valueForSwitch[0]) {
    println("Scene 1 IS printing");
    showCity = true;
  } else {
    showCity =false;
  }
  ///// BLUE RECTS PORTALS
  if (valueForSwitch[1]) {
    println("Scene 2 IS printing");
    pushMatrix();
    for (int i = 0; i<100; i++) {
      if (i==1)translate(0, 0, 15000);
      translate(0, 0, i*10);
      //fill(255);
      noFill();
      stroke(0, 255, 255);
      rect(width/2, height/2, 5000-(i*100), 5000-(i*100));
      rotate(i/100);
      stroke(255, 255, 255);
      //rect(width/2, height/2, width, height);
      stroke(0, 255, 255);
      //rect(width/2, height/2, width*3, height*3);
    }
    popMatrix();
  }

  ////SPIRALE WHITE RECT
  if (valueForSwitch[2]) {
    println("Scene 3 IS printing");
    pushMatrix();
    translate(width/2, height/2, 0);
    for (int i = 0; i<1000; i++) {
      if (i==1)translate(0, 0, 85000);
      translate(0, 0, 50);
      noFill();
      rotate(i/10);
      stroke(255, 255, 255);
      rect(width/2, height/2, 50, 50);
    }
    popMatrix();
  }

  ////SPIDER SCENE
  if (valueForSwitch[3]) {
    println("Scene 4 printing");
    pushMatrix();
    translate(width/2, height/2, 0);
    for (int i = 0; i<4000; i++) {
      if (i==1)translate(0, 0, 120000);
      translate(0, 5, 20);
      rotate(i/10);
      stroke(255, 50);
      line(width/2, height/2, 0, height);
      fill(255, 255, 255);
      stroke(0, 255, 255);
      // circle(width/2, height/2, 50);
    }
    popMatrix();
  }

  ////BUBBLES SCENE
  if (valueForSwitch[4]) {
    println("Scene 5 printing");
    //circle
    pushMatrix();
    for (int i = 0; i<4000; i++) {
      int zder;
      if (i==1)translate(0, 0, 200000);
      noFill();
      //circle(width/2, i+height/2, 1000);
      translate(0, 0, 20);
      if (i%2==0) {
        stroke(255, 255, 255);
      } else {
        stroke(0, 255, 255);
      }
      if (i%3==0) {
        zder = randomScaleSmall[i];
        noStroke();
        fill(255);
      } else {
        fill(0, 0, 0);
        zder = randomScale[i];
      }
      // noFill();
      strokeWeight(1);
      circle(randomPosX[i], randomPosY[i], zder);
      /* stroke(255);
       strokeWeight(0.5);
       line(randomPosX[i], randomPosY[i], randomPosX[i+1], randomPosY[i+1]);
       */
    }
    popMatrix();
    ////Squares beofre bubbles
    pushMatrix();
    // translate(0, -5000, 310000);
    translate(width/2, height/2, 301250);
    for (int i = 0; i<10; i++) {
      int size = 0;
      if (i%3==0) size = 200;
      fill(255);
      if (i%2==0) size = 50;
      fill(0);
      if (i%100==0) size = 3000;
      fill(0);
      translate(0, 0, 300);
      stroke(0, 255, 255);
      noFill();
      rect(0, 0, width, height);
    }
    popMatrix();
  }

  /////SCENE 6
  if (valueForSwitch[5]) {
    //Scene 6
    //println("Scene 6 printing");
    //// CIRCLES SKY
    pushMatrix();
    translate(0, -5000, 310000);
    for (int i = 0; i<1000; i++) {
      int size = 0;
      if (i%3==0) {
        size = 50+int(s1.getChannel(5));
        fill(0);
        stroke(0,255,255);
      }
      if (i%2==0) {
        size = 50;
        
        fill(s1.getChannel(5));
        stroke(0,255,255,s1.getChannel(5));
      }
      if (i%80==0) {
        size = 3000;
        fill(0);
      }
      translate(0, 0, 500);
      stroke(0, 255, 255);
      circle(randomPosX[i], randomPosY[i], size);
    }
    popMatrix();

    //Squares floor
    pushMatrix();
    translate(-width, height, 310000);
    //translate(-10025, height, 10000);
    rotateX(PI/2);
    for (int x = 0; x<300000; x+=1000) {
      //if (x==0)translate(0, 0, 327000);
      for (int y = 0; y<50000; y+=1000) {
        // if (y==0)translate(0, 0, 327000);
        fill(0);
        stroke(0, 255, 255);
        if (x%1000==0) {
        } else {
          noFill();
        }
        rect(y, x, 1000, 1000);
      }
    }
    popMatrix();
    //Scene 6
    /////BROKEN FLOOR
    pushMatrix();
    translate(-width, height-50, 610000);
    //translate(-10000, height, 3000);
    rotateX(PI/2);
    for (int x = 0; x<300; x++) {
      //if (x==0)translate(0, 0, 327000);
      for (int y = 0; y<30; y++) {
        // if (y==0)translate(0, 0, 327000);
        fill(0);
        stroke(0, 255, 255);
        if (x%1==0) {
          rotate(1*x);
        } else {
        }
        rect(y*1000, x*1000, 1000, 1000);
      }
    }
    popMatrix();
  }

  //Scene 7 Start at 836500.0
  if (valueForSwitch[6]) {
    //SCENE 7
    pushMatrix();
    translate(0, 0, 836500);
    for (int i = 0; i<400; i++) {
      int size = 5000;
      stroke(0, 255, 255);
      fill(0);
      if (i%3==0) {
        size = 5000;
        stroke(0, 255, 255);
        fill(0);
      }
      if (i%2==0) {
        size = 5000;
        stroke(0, 255, 255);
        fill(0);
      }
      if (i%5==0) {
        size = 5000;
        stroke(255, 255, 255);
        fill(0);
      }

      translate(0, 0, 200);
      //rotate(0.1);
      for (int w = 0; w<5; w++) {
        circle(randomPosX[i], (height*4), size-w*400);
      }
    }
    popMatrix();
  }
  //Scene 7 end at 942000.0


  //Scene 8 start at 942000.0
}
