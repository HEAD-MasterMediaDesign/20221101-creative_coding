void visu11(float bg) {
  background(bg,255);
  fill(#F1F1F1, 200);
  noStroke();

  float waveX = sin(radians(frameCount))* s2.getChannel(32)*channelIntensity/100;
  float waveY = cos(radians(frameCount))* s2.getChannel(32)*channelIntensity/100;
  
  float tilesX = int(map(waveX,-1,1,1,16));
  float tilesY = int(map(waveY,-1,1,1,9));

  float tileW = width/tilesX;
  float tileH = height/tilesY;

  translate(tileW / 2, tileH / 2);

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      push();
      translate(x * tileW, y * tileH);
      ellipse(0, 0, tileW, tileH);
      pop();
    }
  }
}
