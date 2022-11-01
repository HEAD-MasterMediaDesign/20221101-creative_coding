import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus 
 

void setupmidi(){
  myBus = new MidiBus(this, 18, 0);
  MidiBus.list(); // List all devices
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  if(number==58 && value==127){
    mode--;
    //if(mode==1)mode=12;  
  }
  
  if(number==59 && value==127){
    mode++;
    //if(mode==12)mode=1;
  }
 
  
 
  //Potards
  if(number==16){
    amount = map(value,0,127,1.1,20);
    if(mode==2)amount = map(value,0,127,1.1,10);
    if(mode==6)amount = map(value,0,127,10,20);
  }
  if(number==17){
    channelIntensity = map(value,0,127,0.1,8);
    if(mode==5) channelIntensity = map(value,0,127,0,8);

  }
  if(number==18){
    size = map(value, 0,127,1,100);
    if(mode==5)size = map (value,0,127,100,500);
  }
  if(number==19){
    sinPower = map(value,0,127,100,8000);
    if(mode==2|mode==3)sinPower = map(value,0,127,100,2700);
    if(mode==4){
      sinPower = map(value,0,127,0,100);
      cosPower = sinPower;
      

    }
  }
  if(number==20){
    tanPower = map(value,0,127,100,8000);
  }
  if(number==21){
  }
  if(number==22){
  }
  if(number==23){
  }
  
  //Sliders
  if(number==0){
    bgPower = map(value,0,127,0.1,4);
  }
  if(number==1){
    x = map(value,0,127,0,width);
    if(mode==5)x = map(value,0,127,0,width);    
  }
  if(number==2){
    y = map(value,0,127,0,height);
    if(mode==5)y = map(value,0,127,0,height);    

  }
  if(number==3){
    z = map(value,0,127,0,2000);

  }
  if(number==4){
  }
  if(number==5){
  }
  if(number==6){
  }
  if(number==7){
  }
  if(number==8){
  }
  
  //R Buttons -> Scenes from 1 to n
  if(number==64)mode=1;
  if(number==65)mode=2;
  if(number==66)mode=3;
  if(number==67)mode=4;
  if(number==68)mode=5;
  if(number==69)mode=6;
  if(number==70)mode=7;
  if(number==71)mode=8;
  if(number==48)mode=9;
  if(number==49)mode=10;
  if(number==50)mode=11;
  if(number==51)mode=12;
  if(number==16){
    //backMode1=map(value,0,128,0,255);
  }
}
