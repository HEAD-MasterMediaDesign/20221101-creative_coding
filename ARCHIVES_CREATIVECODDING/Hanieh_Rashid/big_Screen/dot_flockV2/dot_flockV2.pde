
Flock flock;
import ddf.minim.*;

Minim minim;
AudioSample son;
PImage [] image = new PImage[1];
String [] path = {
  "1_1.png"
  
  
};

PGraphics layer;

void setup() {
  //size(800, 800, P2D );
 fullScreen(P2D,SPAN);
 minim = new Minim(this);
 son = minim.loadSample("son.wav", 2048);
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





  for (int i = 0; i < flock.dots.size(); i++) {
    flock.dots.get(i).image=image[0];
  }


son.trigger();
}
