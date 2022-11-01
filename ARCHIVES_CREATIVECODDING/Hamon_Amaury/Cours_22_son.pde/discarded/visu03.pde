void visu03(){
  float wave=tan(radians(frameCount)*height/20);
  stroke(255);
  background(s2.getChannel(4)/4, 255);
  strokeWeight(1);
  noFill();
  
  push();
  translate(width/2, height/2);
  sphere(s2.getChannel(15)*20);
  sphereDetail(10);
  rotateX(frameCount);
  //rotateY(mouseY);
  pop();
  stroke(100);
  
  
  push();
  translate(width/4*3, wave/2*height/20);
  sphere(s2.getChannel(4)*2);
  pop();

  push();
  translate(width/4*3, wave/2*height);
  sphere(s2.getChannel(4)*2);
  pop();

  
  push();
  translate(width/4, wave*height/20);
  sphere(s2.getChannel(4)*2);
  pop();
  
  push();
  translate(width/4, wave/2*height);
  sphere(s2.getChannel(4)*2);
  pop();

  
  }
