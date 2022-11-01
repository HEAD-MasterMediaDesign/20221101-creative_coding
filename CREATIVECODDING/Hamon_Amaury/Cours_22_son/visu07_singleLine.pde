
void setup07() {

  //int shapeamount = 100 ;

  //for(int i=0;i<shapeamount;i++){
  //    boxes.add(
  //      new BoxSound(i, shapeamount*i,height/2,0)
  //    );
  //}
}



void visu07(float bg) {
  background(bg);

  camera(
  width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)+zcam, 
  width/2.0, height/2.0, zcam, 
  0, 1, 0);
  
  //zcam-=2;
  
  float frequency = 100;
  float depth = -250;
  float rows = 10;

  for (int i=0; i<rows; i++){
    if (frameCount%frequency==0) {
      boxes.add(new BoxSound(100, x, height/2, depth*i));
    }
  }


  for (int i=0; i<boxes.size(); i++) {
    boxes.get(i).boxWidth = 100;
    boxes.get(i).x += 1;
    boxes.get(i).draw();
    //getting lost in the horizon
    for(int j=0; j<boxes.size();j++){
      //boxes.get(i).z -= 1;
    }

    //Pew pew
    //for(int j=0; j<boxes.size();j++){
    //  boxes.get(i).z -= 250;
    //  boxes.get(i).draw();
    //}
    if (boxes.get(i).x>width+500) {
      boxes.remove(i);
    }
  }
}
