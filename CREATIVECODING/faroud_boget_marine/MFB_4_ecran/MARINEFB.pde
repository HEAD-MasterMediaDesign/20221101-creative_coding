PGraphics p1;
PGraphics p2;


ArrayList<poin> tabpoin = new ArrayList<poin>();
Courbe [] tabCourbe = new Courbe[30];
Analysor s1;
Courbe c;

void setup() {
  //fullScreen (P3D, SPAN);
  //size(1300, 800, P3D);
  fullScreen(P3D,SPAN);
  background(0);
  s1 = new Analysor(this, "son.mp3", 60);
  noStroke();
  p1 = createGraphics(width, height, P3D);

  for (int j=0; j<tabCourbe.length; j++) {
    tabCourbe[j] = new Courbe(random(width), 0, random(1000), random(300), 40, random(1));
    tabCourbe[j].py = random(height);
  }
  
  for (int j=0; j<10000; j++) {
    tabpoin.add(new poin(random(width), random(height), random(5), random(5)));
  }
}


void draw() {

  //background(0);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
  s1.runAnalyse();
  s1.drawPreAnalyse(0, 0, width, 300);

  for (int a=0; a<40; a++) {
    float r=map(s1.getChannel(a), 0, 1, -10, 10);

    for (int i=0; i<tabCourbe.length; i++) {
      tabCourbe[i].nombres[a]=r;

      fill(0, 0);
      color col = color(
        map(a, 0, 40, 0, 255),
        map(s1.getChannel(a), 0, 1, -10, 10),
        200,
        80);
      tabCourbe[i].tabColor[a]=col;
    }
  }

  for (int j=0; j<tabpoin.size(); j++) {
    tabpoin.get(j).draw();
  }
  
  for (int j=0; j<tabpoin.size(); j++) {
    if(tabpoin.get(j).life<0)tabpoin.remove(j);
  }

  for (int i=0; i<tabCourbe.length; i++) {
    tabCourbe[i].draw();
  }
  
   
   
   if(tabpoin.size()<10000){
      tabpoin.add(new poin(random(width), random(height), random(5), random(5)));
   }
}
