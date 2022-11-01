class Seaweed {

  int maxCount = 10000; //max count of the cirlces
  int currentCount = 1;
  FloatList x = new FloatList();
  //float[] x = new float[maxCount];
  FloatList y = new FloatList();
  //float[] y = new float[maxCount];
  FloatList r = new FloatList();
  //float[] r = new float[maxCount];
  float startX = 0;
  float startY = 0;
  Jellyfish[] jfArray;
  Jellyfish jf;
  boolean down = false;
  color col;
  color transpCol;
  color changedColor;


  Seaweed(Jellyfish[] _jfArray, float _startX, float _startY) {
    this.startX = _startX;
    this.startY = _startY;
    


    this.x.set(0, startX);
    this.y.set(0, startY);
    this.r.set(0, random(5, 10));
    this.jfArray = _jfArray;
    this.jf = jfArray[(int)random(0, jfArray.length)];
    this.col = color(50, 168, 121); 
    this.transpCol = color(50, 168,121);
  }

  void display(color colVariation) {
    
    changedColor = colVariation;

    // create a random set of parameters

    float newR = random(3, 15);
    float newX = random(jf.posSmooth.x-5, jf.posSmooth.x+5);
    float newY = random(jf.posSmooth.y-5, jf.posSmooth.y+5);
    

    float closestDist = 100000000;
    int closestIndex = 0;
    // which circle is the closest?
    for (int i=0; i < currentCount; i++) {
      float newDist = dist(newX, newY, x.get(i), y.get(i));
      if (newDist < closestDist) {
        closestDist = newDist;
        closestIndex = i;
      }
    }
    // aline it to the closest circle outline
    float angle = atan2(newY-y.get(closestIndex), newX-x.get(closestIndex));

    x.set(currentCount, x.get(closestIndex) + cos(angle) * (r.get(closestIndex)+newR));
    y.set(currentCount, y.get(closestIndex) + sin(angle) * (r.get(closestIndex)+newR));
    r.set(currentCount, newR);


    if(x.size() > 800) down = true;
    if (down) {
      if(x.size() < 400) down = false;
      x.remove(0);
      y.remove(0);
      r.remove(0);
    } else {
      currentCount++;
    }


    // draw them
    for (int i=0; i < x.size(); i++) {
      fill(changedColor);
      ellipse(x.get(i), y.get(i), r.get(i)+4, r.get(i)+4);
      //fill(this.transpCol);
      //ellipse(x.get(i), y.get(i), r.get(i)+10, r.get(i)+10);
    }
    if (currentCount >= maxCount) noLoop();
  }
}
