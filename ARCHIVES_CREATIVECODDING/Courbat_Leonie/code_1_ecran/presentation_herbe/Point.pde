class Point{
  
  //pour choper les coordonnées du point
  float px;
  float py;
  
  float x;
  float y;
  float timer=0;  
  /*gère la déformation des cercles (déplace x et y par rapport à la position
  * qu'ils devraient normalement avoir*/
  float amp=100;
  color col;
  
  Point(float px,float py){
    this.px=px;
    this.py=py;
    timer=random(100);
    //col = color(255,random(255));
  }
  void run(){
    //gère la vitesse d'ondoiement des formes
    timer+=0.01;
    x = px+noise(timer)*amp;
    //le +100 créer un décalage sinon x et y sont sur le même noise
    y = py+noise(timer+100)*amp;
  }
}
