void visu06(float bg) {
  background(bg);
  fill(255);
  stroke(255, s2.getChannel(4)/2);

  float w= width/amount;
  //rectMode(CENTER);
  for (int i=1; i<amount; i++) {
    float wave=tan(radians(frameCount*i))*tanPower;
    float wave2=sin(radians(frameCount))*sinPower;
    push();
    translate(i*w-wave*0.05,0 );
    rect(i, 0,s2.getChannel(15)*channelIntensity,height/8 );
    rect(i*wave, height/8,s2.getChannel(24)*channelIntensity,height/8 );
    rect(i*wave/8, height/8*2,s2.getChannel(48)*channelIntensity,height/8 );
    rect(i*wave/48, height/8*3,s2.getChannel(54)*channelIntensity,height/8 );
    rect(i-wave, height/8*4,s2.getChannel(37)*channelIntensity,height/8 );
    rect(i*wave/24, height/8*5,s2.getChannel(15)*channelIntensity,height/8 );
    rect(i/wave2, height/8*6,s2.getChannel(43)*channelIntensity,height/8 );
    rect(8*i-wave, height/8*7,s2.getChannel(22)*channelIntensity,height/8 );
    rect(6*i-wave2, height,s2.getChannel(65)*channelIntensity,height/8 );
    
    
    
    
    pop();
    
    //push();
    //translate(i*8*(w-wave/10), height/8*2);
    //rect(i, height/8,s2.getPower()*2,height/8*2 );
    //pop();
    
    //push();
    //translate(i*8*(w-wave/10), 0);
    //rect(i, height/8*3,s2.getPower()*2,height/8*4 );
    //pop();
  
    //push();
    //translate(i*8*(w-wave/10), 0);
    //rect(i, height/8*4,s2.getPower()*2,height/8*5 );
    //pop();
  }
}
