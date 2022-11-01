void visu09() {
  fill(255);
  stroke(255, s2.getChannel(4)/2);

  float amount=10;
  float w= height/amount;
  background(s2.getChannel(4)/4, 255);
  for (int i=1; i<amount; i++) {
    float wave=tan(radians(frameCount*i))*height/10;
    push();
    translate(width, i*w-wave*0.05);
    rect(0, i,width, s2.getChannel(15));
    pop();
    
    push();
    translate(0, i*8*(w-wave));
    rect(0, i,width, s2.getChannel(15)*2);
    pop();
  }
}
