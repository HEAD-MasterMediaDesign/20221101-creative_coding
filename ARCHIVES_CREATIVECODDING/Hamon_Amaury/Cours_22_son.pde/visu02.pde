void visu02(float bg){
   background(bg);

  
  for(int i=1;i<amount;i++){  
    for(int j=0;j<height;j++){
      
      //float w= (width*4); 
      //float wave=sin(radians(frameCount)*20);
      float wave=sin(radians(frameCount)) * sinPower;
      noFill();
      stroke(255);
      strokeWeight(s2.getChannel(15)/5);
      
      push();
      translate(width/2, 0);
      //line(i*s2.getPower()+wave,0,i*s2.getPower()+wave,height);
      line(i*s2.getPower()+wave,0,i*s2.getPower()+wave,height);
      line(-i*s2.getChannel(15)*channelIntensity+wave,0,-i*s2.getChannel(15)*channelIntensity+wave,height);
      //line(-i*s2.getChannel(72),0,-i*s2.getChannel(72),height);
      //line(i*s2.getChannel(72),0,i*s2.getChannel(72),height);
      pop();
    }
  }
  
  

}
