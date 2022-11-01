void visu04(float bg) {
  float deg = radians(frameCount);
  fill(bg, 45);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);

  for (int i=1; i<width/2; i+=90) {
    for (int j=0; j<amount; j++) {
      
      
      


      //float w= (width*4);
      float wave = sin(deg)* sinPower;
      float wave2 = tan(deg) * tanPower;
      float wave3 = cos(deg) * cosPower;
      //y=1200;
      stroke(255);
      strokeWeight(2);

      push();
      translate(width/2, height/2);
      rotateX(deg);

      //line(width/2, height/2, width/2+wave, height/2+wave3);

      line(i+wave, 0, i+wave, y);
      line(i+wave, -y, i+wave, 0);
      
      line(-i+wave, 0, -i+wave, y);
      line(-i+wave, -y, -i+wave, 0);
      //rotateX(-deg*2);    
      //line(-i*8+wave, 0, -i*8+wave, y);
      //line(-i*8+wave, 0, -i*8+wave, y);
      //line(-i*8-wave, 0, -i*8-wave, -y);
      //line(-i*8+wave, 0, -i*8+wave, -y);

      //line(0, 0, i+wave, height/2);
      //line(i*8+wave*2, height/4, i*8+wave*2, height/2);
      //line(-i*8+wave2, height/4, -i*8+wave2, height/2);
      //line(i*16+wave/8, height/2, i*16+wave/8, height);
      //line(-i*16+wave/8, height/2, -i*16+wave/8, height);
      //line(i*wave2/100+wave, 0, i*wave2/100+wave, -height);
      //line(-i*wave2/100+wave, 0, -i*wave2/100+wave, -height);
      //line(-i*wave2/1000+s2.getChannel(60),0,-i*wave2/1000+s2.getChannel(60),-height);

      pop();
      
      //Drawing a circle based on sound power
      //push();     
      //line(width/2, height/2, width/2+wave*s2.getPower()/10, height/2+wave3*s2.getPower()/10);
      //pop();
    }
  }
}
