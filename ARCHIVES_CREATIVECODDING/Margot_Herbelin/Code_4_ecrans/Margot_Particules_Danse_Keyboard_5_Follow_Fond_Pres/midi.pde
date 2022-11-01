import themidibus.*; //Import the library

MidiBus myBus;

void setupMidi() {
  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 2, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void drawMidi() {
}


//ici--------------------

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  try{
  
  if (pitch>=48 && pitch<=53) {
    for (int i=0; i<10; i++) {
      int index = int(random(antlow1.length));
      antlow1[index].freq1 = velocity*random(-1, 1);
      antlow1[index].freq2 = velocity*random(-1, 1);
      antlow1[index].pushed = true;
    }
  }
  if (pitch>=54 && pitch<=59) {
    for (int i=0; i<10; i++) {
      int index = int(random(antlow2.length));
      antlow2[index].freq1 = velocity*random(-1, 1);
      antlow2[index].freq2 = velocity*random(-1, 1);
      antlow2[index].pushed = true;
    }
  }
  if (pitch>=60 && pitch<=64) {
    for (int i=0; i<30; i++) {
      int index = int(random(antmedium1.length));
      antmedium1[index].freq1 = velocity*random(-1, 1);
      antmedium1[index].freq2 = velocity*random(-1, 1);
      antmedium1[index].pushed = true;
    }
  }
   if (pitch>=65 && pitch<=67) {
    for (int i=0; i<30; i++) {
      int index = int(random(antmedium2.length));
      antmedium2[index].freq1 = velocity*random(-1, 1);
      antmedium2[index].freq2 = velocity*random(-1, 1);
      antmedium2[index].pushed = true;
    }
   }
   if (pitch>=68 && pitch<=71) {
    for (int i=0; i<30; i++) {
      int index = int(random(antmedium3.length));
      antmedium3[index].freq1 = velocity*random(-1, 1);
      antmedium3[index].freq2 = velocity*random(-1, 1);
      antmedium3[index].pushed = true;
    }
  }
  if (pitch>=72 && pitch<=75) {
    for (int i=0; i<10; i++) {
      int index = int(random(anthigh1.length));
      anthigh1[index].freq1 = velocity*random(-1, 1);
      anthigh1[index].freq2 = velocity*random(-1, 1);
      anthigh1[index].pushed = true;
    }
   }
    
    if (pitch>=76 && pitch<=79) {
    for (int i=0; i<10; i++) {
      int index = int(random(anthigh2.length));
      anthigh2[index].freq1 = velocity*random(-1, 1);
      anthigh2[index].freq2 = velocity*random(-1, 1);
      anthigh2[index].pushed = true;
    }
  }

  /*
  for (int i=0; i<10; i++) {
   int index = int(random(antmedium.length));
   antmedium[index].freq1 = velocity*random(-1, 1);
   antmedium[index].freq2 = velocity*random(-1, 1);
   }
   */
   
  }catch(Exception e){
    println(e);
  }  

  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  if (pitch>=48 && pitch<=53) {
    for (int i=0; i<antlow1.length; i++) {
      antlow1[i].pushed = false;
    }
  }
  if (pitch>=54 && pitch<=59) {
    for (int i=0; i<antlow2.length; i++) {
      antlow2[i].pushed = false;
    }
  }
  if (pitch>=60 && pitch<=64) {
    for (int i=0; i<antmedium1.length; i++) {
      antmedium1[i].pushed = false;
    }
  }
  if (pitch>=65 && pitch<=67) {
    for (int i=0; i<antmedium2.length; i++) {
      antmedium2[i].pushed = false;
    }
  }
  if (pitch>=68 && pitch<=71) {
    for (int i=0; i<antmedium3.length; i++) {
      antmedium3[i].pushed = false;
    }
  }
  if (pitch>=72 && pitch<=75) {
    for (int i=0; i<anthigh1.length; i++) {
      anthigh1[i].pushed = false;
    }
  }
  if (pitch>=76 && pitch<=79) {
    for (int i=0; i<anthigh2.length; i++) {
      anthigh2[i].pushed = false;
    }
  }
}


void controllerChange(int channel, int number, int value)
{
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);

}
