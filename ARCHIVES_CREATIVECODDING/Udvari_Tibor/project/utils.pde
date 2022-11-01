

String jsonFileToPropertyList(String fn) {
  JSONObject json = loadJSONObject(fn);
  //println(json);

  var propertyList = "";
  var properties = (String[]) json.keys().toArray(new String[json.size()]);
  for (int i = 0; i < properties.length; i++) {

    try {
      String k = properties[i];
      float val = json.getJSONObject(k).getFloat("value");

      propertyList += String.format(Locale.ENGLISH, "%s:%.20f", k.substring(1), val);
      if (i < properties.length - 1) {
        propertyList += ",";
      }
    }
    catch (Exception e) {
      println("Exception " + e);
    }
  }
  return propertyList;
}

void drawRecording() {
  if (!recording) return;

  int currentFrame = frameCount - startFrame;

  if (currentFrame < numFrames)
  {
    b.save(recordingName + "_" + String.format("%03d", currentFrame) + ".png");
  }
  if (currentFrame >= numFrames)
  {
    println("All frames have been saved");
    VideoExporter.generateVideo(this, recordingName);
    VideoExporter.cleanupImages(this, recordingName);

    launch("%s/%s.mov".formatted(sketchPath(), recordingName));

    recording = false;
    // launch terminal things
  }
}

void drawNoise() {
  b.loadPixels();

  for (int x = 0; x < W; x++) {
    for (int y = 0; y < H; y++) {
      float val = (float)periodicFunction(0f, 0f, (float)x, (float)y);
      color c = color(map(val, -1, 1, 0, 1) * 255);

      b.pixels[y * W + x] = c;
    }
  }

  b.updatePixels();
}

void recordSketch() {
  println("Record sketch");
  String fn = VideoExporter.defaultFileName(this);
  recordingName = fn;

  startFrame = frameCount + 1;
  recording = true;
  saveParamsDefault();
}

void saveParamsDefault() {
  String fn = VideoExporter.defaultFileName(this);
  saveParams(fn);

  var fnAnim = String.format("data/%d.json", animIndex);
  saveParams(fnAnim);
}

void saveParams(String fn) {
  println("Save params");

  cp5.saveProperties();
  cp5.saveProperties(fn);
}

void loadParams() {
  println("Load params");
  cp5.loadProperties();
}

public void sliderSeed(int value) {
  noise = new OpenSimplexNoise(value);
}

void radioDebug(int val) {
  periodicFuncDebug = val > 0;
}

// --- Control P5 ---

/*
void scl(float v){
 //scl=v;
 println("update");
 Ani.to(this, 3, "scl:"+v, Ani.SINE_IN_OUT);
 //s.setValue(scl);
 }
 */

void setScl(float v) {
  println(v);
}

void resolutionPreset(int is360) {
  return;
  /*
  if (is360 > 0) {
   ratio = 0.3;
   W = circularScreenW;
   H = circularScreenH;
   } else if ( is360 < 0) {
   ratio = 1;
   W = instagramMinW;
   H = instagramMinH;
   }
   
   displayW = (int)(W * ratio);
   displayH = (int)(H * ratio);
   
   b = createGraphics(W, H, P2D);
   b.smooth(8);
   surface.setSize(displayW, displayH);*/
}

// This draws only one line, not everything
void drawPeriodicFunction() {
  stroke(255, 255, 255);
  strokeWeight(1);
  for (int i = 0; i < displayW; i++) {
    float val1 = (float)periodicFunction((float)(i + 0) / displayW, 0f, 1f, 1f);
    float val2 = (float)periodicFunction(((float)i + 1) / displayW, 0f, 1f, 1f);
    val1 = map(val1, -1, 1, 0, 1);
    val2 = map(val2, -1, 1, 0, 1);

    // draw line between them
    line(i, val1 * displayH, i+1, val2 * displayH);
  }
}
