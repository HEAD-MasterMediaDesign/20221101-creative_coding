class Source {
  int index = 0;
  PImage [] textures;
  float x;
  float y;
  float restart = 0;
  int timer=0;
  int size = 0;
  ArrayList<Particule> particules; // appelle la classe de particule dans la source

  Source(float x, float y, PImage [] textures, int number) {
    this.x=x;
    this.y=y;
    this.textures=textures;
    particules = new ArrayList<Particule>();
  }


  void display() {
    
    for (int i=0; i<particules.size(); i++) {
      particules.get(i).draw();
    }

    for (int i=0; i<particules.size(); i++) {
      if (particules.get(i).life<0) {
        particules.remove(i);
      }
    }

    if (timer>2) {
      index = int(random(textures.length));
      particules.add(new Particule(x, y, textures[index]));  //display des particules depuis la source
      timer=0;
    }
    timer++;
  }
}
