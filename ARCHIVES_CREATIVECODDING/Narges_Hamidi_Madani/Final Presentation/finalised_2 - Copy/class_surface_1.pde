class Surface {
  Motif [][] motifs = new Motif[repeatNum][repeatNum];
  float x;
  float y;
  float z;
  PVector rotation;
  Analysor analysor;
  String posName;
  
  Surface(PShape motifShape, float x, float y, float z, PVector rotation, Analysor analysor, String posName) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotation = rotation;
    this.analysor= analysor;
    this.posName = posName;
    for (int i = 0; i < repeatNum; i++) {
      for (int j = 0; j< repeatNum; j++) {
        motifs[i][j] = new Motif(motifShape, i, j, this.analysor, this.posName);
      }
    }
  }

  void draw() {
    pushMatrix();
    rotateX(radians(this.rotation.x));
    rotateY(radians(this.rotation.y));
    rotateZ(radians(this.rotation.z));
    translate(x, y, z);
    for (int i = 0; i < repeatNum; i++) {
      for (int j = 0; j < repeatNum; j++) {
        motifs[i][j].draw();
      }
    }
    popMatrix();
  }

  void random(boolean top) {
    for (int i = 0; i < repeatNum; i++) {
      for (int j = 0; j < repeatNum; j++) {
        motifs[i][j].fallTop = motifs[i][j].fall = false;
        //motifs[i][j].randomMotif(top);
      }
    }
  }

  void fall(boolean top) {
    for (int i = 0; i < repeatNum; i++) {
      for (int j = 0; j < repeatNum; j++) {
        if (top) {

          motifs[i][j].fallTop = true;
        } else {
          motifs[i][j].fall = true;
        }
      }
    }
  }
  void transition(boolean horizontal) {
    for (int i = 0; i < repeatNum; i++) {
      for (int j = 0; j < repeatNum; j++) {
        motifs[i][j].transition = true;
         motifs[i][j].horizontal = horizontal;
        motifs[i][j].fall= motifs[i][j].fallTop= false;
      }
    }
  }
}
