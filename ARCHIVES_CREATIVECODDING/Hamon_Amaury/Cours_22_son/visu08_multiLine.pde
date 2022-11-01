float zcam=0;

void visu08(float bg) {
  camera(
  width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)+zcam, 
  width/2.0, height/2.0, zcam, 
  0, 1, 0);
  
  //zcam-=2;
  
  background(bg);
  noFill();
  stroke(255);
  strokeWeight(1);
  fill(s2.getChannel(4)*2);
  rectMode(CENTER);
  float space = -250;
  
  //Gélatine style
  //float wave= tan(radians(frameCount)*2);
  //float wave2= sin(radians(frameCount)*8);

  //Default style
  float wave= tan(radians(frameCount)*tanPower);
  float wave2= sin(radians(frameCount)*sinPower);


  int [] v = {1, 2, 3, 4, 5};

  for (int i=-10000; i<10000; i+=200) {
    for (int j=250; j<1000; j+=250) {
      //for(int i=0;i<boxes.size();i++){
      //  boxes.get(i).draw();
      //}
      push();
      translate(i+frameCount+wave*20*wave2, height/2+(wave2*i)/4, -250);
      box(s2.getPower(), height, 200);
      pop();

      push();
      translate(i+frameCount+wave*8*wave2, height/2+(wave2*i)/8, -500);
      box(s2.getPower(), height, 200);
      pop();

      push();
      translate(i+frameCount+wave*10*wave2, height/2+(wave2*i)/16, -750);
      box(s2.getPower(), height, 200);
      pop();

      push();
      translate(i+frameCount+wave*4*wave2, height/2+(wave2*i)/10, -1000);
      box(s2.getPower(), height, 200);
      pop();





      //for(int i=width/2;i>0;i-=50){
      //  for(int j=0;j<height;j++){

      //    //float w= (width*4);
      //    float wave=sin(radians(frameCount*height)*20);
      //    noFill();
      //    stroke(255);
      //    strokeWeight(s2.getChannel(15)/3);

      //    push();
      //    translate(width/2, 0);
      //    line((i*wave*1.1)+frameCount,0,(i*wave*1.1)+frameCount,height);
      //    line((-i*wave*1.1)-frameCount,0,(-i*wave*1.1)-frameCount,height);

      //    //line(i*s2.getChannel(15)/8,0,i*s2.getChannel(15)/8,height);
      //    //line(-i*s2.getChannel(15)/8,0,-i*s2.getChannel(15)/8,height);
      //    pop();
    }
  }
}
