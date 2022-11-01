float backMode1=0;

void visu01() {
  fill(255, 5);
  stroke(255, s2.getChannel(4)/2);

  strokeWeight(3);
  rectMode(CENTER);
  //background(s2.getChannel(4)/2);
  background(backMode1);
  rect(width/2, height/2, s2.getChannel(10)*4, s2.getChannel(10)*4, rectangle*2);
  rect(width/2, height/2, s2.getChannel(30)*4, s2.getChannel(34)*4, rectangle*6);

  strokeWeight(s2.getChannel(30)/2);
  rect(width/2, height/2, s2.getChannel(30)*100, s2.getChannel(34)*100, rectangle*6);

  //
  
}
