//4 screen
Jellyfish [] tabJelly = new Jellyfish[18];
Seaweed [] swArray = new Seaweed[5];
//1 screen
//Jellyfish [] tabJelly = new Jellyfish[5];
//Seaweed [] swArray = new Seaweed[2];
Flock flock;
Analysor s1;
int limit = 0;
color col = color(50, 168, 121);
int blue;
FloatList startXList = new FloatList();
FloatList startYList = new FloatList();
float startX = 0;
float startY = random(0, height);
int channel = 27;
float startTime = millis();
float currentTime = millis();
float soundAvg = 0;

void setup() {
  //size(1800, 1000, P2D);
  //smooth();
  //size(1920, 1080);
  fullScreen(P2D,SPAN);
  s1 = new Analysor(this, "wondrous-waters-119518.mp3", 60);
  for (int i=0; i<tabJelly.length; i++) {
    tabJelly[i] = new Jellyfish(random(width), random(height), s1);
  }

  for (int g = 0; g < swArray.length; g++) {
    startY = random(0, height);
    while (startY > 5 && startY < height-5) {
      startY = random(0, height);
      println(startY);
    }
    println("out");
    startYList.set(g, startY);
  }
  
  
  for (int f = 0; f < swArray.length; f++) {
    startX = width/swArray.length * (f+1);
    startXList.set(f, startX);
  }

  for (int i=0; i<swArray.length; i++) {
    swArray[i] = new Seaweed(tabJelly, startXList.get(i), startYList.get(i));
  }

  flock = new Flock();

  for (int i = 0; i < 900; i++) {
    flock.addBoid(new Boid(random(width), height/2));
  }
  //for (int i = 0; i < 150; i++) {
  //  flock.addBoid(new Boid(random(width), height/2));
  //}
}

int index=7;

void draw() {
  println(startTime);
  currentTime = millis();
  println("Temps écoulé : "+(currentTime-startTime)*10000+" secondes");
  
  background(0, 0, 50);

  //Seaweed
  strokeWeight(0.5);
  soundAvg = (s1.getChannelSmooth(27)+s1.getChannelSmooth(20))+s1.getChannelSmooth(15)/2;
  blue = (int) map(s1.getChannelSmooth(27), 0, 30, 0, 255);
  col = color(35, 128, blue, 200);
  //println(s1.getChannelSmooth(index)*10);

  for (int i = 0; i < swArray.length; i++) {
    swArray[i].display(col);
    swArray[i].jf = tabJelly[(int) random(0, tabJelly.length)];
  }


  //banc de poissons
  flock.run();

  //Jellyfish
  for (int i=0; i<tabJelly.length; i++) {
    tabJelly[i].display();
    tabJelly[i].touch(tabJelly);
  }

  index++;
  if (index>=36)index=7;
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
