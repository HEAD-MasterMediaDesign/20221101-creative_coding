
Flock flock;

PImage [] image = new PImage[2];
String [] path = {
  "mahsa.png",
  "nika.png"
};


PGraphics pg;

void setup() {
  //size(800, 800, P2D );
 fullScreen(P2D,SPAN);
  flock = new Flock();

  pg = createGraphics(width,height);


  for (int i=0; i<image.length; i++) {
    image[i] = loadImage(path[i]);
    image[i].resize(width, height);
    // Add an initial set of boids into the system
  }

  for (int i = 0; i < 100; i++) {
    flock.addDot(new Dot(height, width, image[0]));
  }
}

void draw() {
  background(50);
  image(pg, 0, 0);
  flock.run();
  
  fill(255,0,0);
  text(frameRate,20,40);
}


void keyPressed(){
  for (int i = 0; i < flock.dots.size(); i++) {
    flock.dots.get(i).image=image[1];
  }
  
  pg.beginDraw();
  pg.clear();
  pg.endRaw();
}
