void visu01(float bg) {
  fill(255);
  stroke(255, s2.getChannel(4));
  
  background(bg);
  for (int i=1; i<amount; i++) {
//  float wave=tan(radians(frameCount*i))*height/20;
    float wave=tan(radians(frameCount*i))*tanPower/100;

    push();
    translate(i-wave, 0);
    rect(width/2, height/2,s2.getChannel(15)*channelIntensity, height);
    pop();
  }
}
