void visu09(float bg) {
  float deg = radians(frameCount);
  fill(bg,45);
  noStroke();
  rectMode(CORNER);
  rect(0,0,width,height);

  for (int i=width/2; i>0; i-=50) {
    for (int j=0; j<height; j++) {

      //float w= (width*4);
      float wave = sin(deg) * sinPower;
      float wave2 = tan(deg) * tanPower;
      stroke(255);
      strokeWeight(2);

      push();
      translate(width/2, 0);
      rotateX(deg);
      line(i*8+wave, 0, i*8+wave, height/4);
      line(i*8+wave*2, height/4, i*8+wave*2, height/2);
      line(-i*8+wave2, height/4, -i*8+wave2, height/2);
      line(i*16+wave/8, height/2, i*16+wave/8, height);
      line(-i*16+wave/8, height/2, -i*16+wave/8, height);
      line(i*wave2/100+wave, 0, i*wave2/100+wave, -height);
      line(-i*wave2/100+wave, 0, -i*wave2/100+wave, -height);
      //line(-i*wave2/1000+s2.getChannel(60),0,-i*wave2/1000+s2.getChannel(60),-height);

      pop();
    }
  }
}
