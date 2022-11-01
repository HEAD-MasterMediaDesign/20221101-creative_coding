
void Hermann (){
  background (0);
  
  for (float x=0; x<width; x=x+spacingCint) {
    strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/3);
    stroke(255);
    line(x, 0, x, height);

    for (float y=0; y<height; y=y+spacingCint) {
      strokeWeight((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/3);
      stroke(255);
      line(0, y, width, y);
    }
  }
//DISQUES

  if (((s1.getChannel(5)+s1.getChannel(22)+s1.getChannel(35))/3)>50) {
    background (0);

    if (timer<60) {
      noStroke();
      fill(255);
    } else {
      fill(0);
    }
    noStroke();
    circle(width/2, height/2, (height/6)/*800*/*5*(s1.getChannel(5))*0.005);


    noStroke();
    fill(0);
    circle(width/2, height/2, (height/2)/*500*/*((s1.getChannel(6))/180));

    noStroke();
    fill(255);
    circle(width/2, height/2, 10);

    timer++;
    if (timer>11)timer=0;
  }

}
