void visu08() {
  background(s2.getChannel(4)/4, 255);
  noFill();
  stroke(s2.getChannel(42)*8);
  strokeWeight(1);
  fill(s2.getChannel(15)*4);
  rectMode(CENTER);

  push();
  //noStroke();
  translate(width/2, height/2);

  rotateX(radians(frameCount)/2);
  rect(0, -height/2, s2.getChannel(15)*width/4, height/2);
  rect(0, height/2, s2.getChannel(15)*width/4, -height/2);
  box(2*s2.getChannel(15),500,500);

  pop();
  
  push();
  translate(width/4,height/2);
  box(4*s2.getChannel(15),250,250);
  pop();
  
  push();
  translate(width/4*3,height/2);
  box(4*s2.getChannel(15),250,250);
  pop();
}
