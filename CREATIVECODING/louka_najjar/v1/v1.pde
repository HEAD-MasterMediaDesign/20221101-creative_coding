import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Sun sun;

void setup() {
  size(1200, 800, P3D);
  sun = new Sun();  
  Ani.init(this);
  Ani.to(sun, 2, "radius", 5, Ani.BOUNCE_OUT);
}

int col = 0;

void draw() {
  
  fill(col);
  //fill(1, 13, 41);
  rect(0, 0, width, height);
  //#010D29
  //#02091a
  
  translate(width/2, height/2);
  sun.update();
}
