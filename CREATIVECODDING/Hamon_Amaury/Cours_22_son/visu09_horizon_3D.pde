void visu09(float bg) {
  background(bg, 255);
  noFill();
  stroke(s2.getChannel(32)*16);
  strokeWeight(1);
  fill(s2.getChannel(4)*channelIntensity);
  rectMode(CENTER);
  float space = -250;
  int amount = 10;
  float wave= sin(radians(frameCount))*sinPower/1000;
  int [] v = {1, 2, 3, 4, 5};

  //push();
  ////noStroke();

  //rotateX(radians(frameCount)/2);
  //rect(0, -height/2, s2.getChannel(15)*width/4, height/2);
  //rect(0, height/2, s2.getChannel(15)*width/4, -height/2);
  //box(2*s2.getChannel(15),500,500);

  //pop();

  //push();
  //translate(width/4,height/2);
  //box(s2.getChannel(15)+x/100,250,250);
  //pop();

  //push();
  //translate(width/4*3,height/2);
  //box(s2.getChannel(15)+x/100,250,250);
  //pop();
  //if (frameCount%40==0) {
  //  rectangles.add(new Rectangle());
  //}

  //for (int i=0; i<rectangles.size(); i++) {
  //  rectangles.get(i).draw();
  //}

  for (int i=-10000; i<10000; i+=200) {
    for (int j=250; j<1000; j+=250) {
      //for(int i=0;i<boxes.size();i++){
      //  boxes.get(i).draw();
      //}
      push();
      translate(i+frameCount*wave/3, height/2, -250);
      box(channelIntensity*s2.getPower(), height, z);
      pop();

      push();
      translate(i+frameCount*wave/2, height/2+(wave*i)/4, -500);
      box(channelIntensity*s2.getPower(), height, z);
      pop();

      push();
      translate(i+frameCount*wave/4, height/2, -750);
      box(channelIntensity*s2.getPower(), height, z);
      pop();

      push();
      translate(i+frameCount*wave/5, height/2, -1000);
      box(channelIntensity*s2.getPower(), height, z);
      pop();

      //push();
      //translate(i+frameCount*wave/2, height/2, -1250);
      //box(s2.getPower()/2, height*0.55, 250);
      //pop();

      //push();
      //translate(i+frameCount*wave/2, height/2, -1500);
      //box(s2.getPower()/2, height*0.55, 1000);
      //pop();
    }
  }
}
