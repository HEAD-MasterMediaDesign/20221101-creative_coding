void visu03(float bg) {
  noStroke();
  fill(bg,15);
  rectMode(CORNER);
  rect(0,0,width,height);
    
  fill(255);
  stroke(255);
  

  float w= width/amount;
  float wave=tan(radians(frameCount))*tanPower;
  float wave2=sin(radians(frameCount))*sinPower;

  for (int i=1; i<amount; i++) {
    push();
    translate(width/2, height/2);
    rectMode(CENTER);
    //rect(wave2-wave, 0, s2.getPower(), height);
    rect(wave2+wave*i*1.15, 0, i*wave2/1000, height);
    rect(-wave2-wave*-i*1.25, 0, i*wave2/1000, height);

    pop();
  }
}
