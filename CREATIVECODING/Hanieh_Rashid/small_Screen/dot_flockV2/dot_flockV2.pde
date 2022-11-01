
Flock flock;

PImage [] image = new PImage[6];
String [] path = {
  "1.png",
  "2.png",
  "3.png",
  "4.png",
  "5.png",
  "6.png"
};

PGraphics layer;

void setup() {
  //size(800, 800, P2D );
 fullScreen(P2D,SPAN);
 layer = createGraphics(width,height,P2D);
 layer.beginDraw();
 layer.clear();
 layer.endDraw();
 
  flock = new Flock();
  for (int i=0; i<image.length; i++) {
    image[i] = loadImage(path[i]);
    image[i].resize(width, height);
    // Add an initial set of boids into the system
  }

  for (int i = 0; i < 1000; i++) {
    flock.addDot(new Dot(height, width, image[0]));
  }
}

void draw() {
  background(0);
  image(layer,0,0);
  flock.run();
  
  fill(255,0,0);
  text("f: "+frameRate+"\n  width:"+width+"  height:"+height,20,40);
}


void keyPressed(){
  for (int n = 0 ; n <= flock.dots.length.image; n++){
    for (int i = 0; i < flock.dots.size(); i++) {
      flock.dots.get(i).image=image[n];
  }

 layer.beginDraw();
 layer.clear();
 layer.endDraw();
}
