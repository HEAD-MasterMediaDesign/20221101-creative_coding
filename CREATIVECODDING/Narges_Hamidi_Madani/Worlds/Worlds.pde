int OFF_MAX = 300;

void setup() {
  fullScreen(P3D,SPAN);
}

void draw() {
  background(0);
  translate(width / 2, height / 2, -OFF_MAX);
  rotateX(frameCount * .001);
  rotateY(frameCount * .01);
  rotateZ(frameCount * .011);
  
  for (int xo = -OFF_MAX; xo <= OFF_MAX; xo += 100) {
    for (int yo = -OFF_MAX; yo <= OFF_MAX; yo += 100) {
      for (int zo = -OFF_MAX; zo <= OFF_MAX; zo += 100) {
        pushMatrix();
        translate(xo, yo, zo);
        rotateX(frameCount * .02);
        rotateY(frameCount * .02);
        rotateZ(frameCount * .02);
        fill(random(255));
        box((float) (20 + (Math.sin(frameCount / 30.0)) * 15));
        popMatrix();
      }
    }
  }
}

int colorFromOffset(int offset) {
  return (int) ((offset + OFF_MAX) / (2.0 * OFF_MAX) * 255);
}
