class Line{
  float x,y;
  
  Line(float x,float y){
    this.x=x;
    this.y=y;
  }
  
  color[] colArray = {
    color(25, 165, 190),
    color(95, 170, 200),
    color(120, 190, 210),
    color(170, 210, 230),
    color(205, 225, 245),
    color(220, 240, 250),
  };
    

  void draw() {
    pushMatrix();
    translate(width/2,height/2);
  float mag = 100;
  float s = 5;
  noStroke();
  for (int i = 0; i < 100; i++){
    float w = map(sin(radians(frameCount)),-1,1,-100,100);
    float wave1 = map(tan(radians(frameCount * 0.8 + i +w)), -1, 1, -100, 100);
    float wave2 = map(cos(radians(frameCount + i)), -1, 1, -mag, mag);
   
    float c = map(sin(radians(frameCount * 5 + i)), -1, 1, 0, 255);
    fill(colArray[int(random(5))],c);
    ellipse(wave1, wave2, s,s);
    }
    popMatrix();
  }
}
