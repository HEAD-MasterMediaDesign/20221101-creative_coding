// Transform property set tweening library //<>//
// Save different transitions
// Have 10 different ways to animate

// Interesting values

// seed 5499
// scl 0.09
// rad 1.5
// periodicFuncScale 1

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import controlP5.*;
import java.time.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

OpenSimplexNoise noise;
ControlP5 cp5;

// Recording
String recordingName;
boolean recording = false;
boolean pRecording = false;
float numFrames = 600;
int startFrame = 0;

// Video export does not work with resolutions that widths are not divisible by 2
/*
  360 degrees
 Diameter: 8 m
 Resolution 180:  4500 x 1080 – 4.16
 Resolution 360: 11000 x 2000 – 5.5
 
 Resolution thing 7680 x 1440 – 5.3
 
 */

// vid.avi -s 800x800 -sws_flags neighbor -sws_dither none -vcodec rawvideo vid2.avi

final int instagramMinW = 500;
final int instagramMinH = 888;

final int instagramW = 1080;
final int instagramH = 1920;

//final int circularScreenW = 4500;
//final int circularScreenH = 1080;

//final int circularScreenW = 7680;
final int circularScreenW = 10240;
final int circularScreenH = 1440;

//float ratio = 1;
//int W = instagramMinW;
//int H = instagramMinH;

float ratio = 1;
int W = circularScreenW;
int H = circularScreenH;

int displayW = (int)(W * ratio);
int displayH = (int)(H * ratio);

PGraphics b; // b for buffer

// Audio
Minim minim;
AudioOutput out;
Oscil wave;
AudioRecorder audioRecorder;

ArrayList<controlP5.Controller> controllers;

int seed = 12345;
float scl = 0.018;
float rad = 1.3;

int cols = 1;
int rows = 1;

float mx = 0.5;
float my = 0.5;

boolean periodicFuncDebug = true;
float offScl = 0.15;
float periodicFuncScale = 1;
float dotSizePct = 0.01;

boolean cp5Visible = true;

// Animation
// Has 10 slots for states
// Change - load next one and transition with anki

int animIndex;

float offMultX = 20;
float offMultY = 20;
float bgFill = 50;

void toggleCP5Visible() {
  cp5Visible = !cp5Visible;
  if (cp5Visible) {
    cp5.show();
  }
  if (!cp5Visible) {
    cp5.hide();
  }
}

int lastLoad = 0;

AniSequence seq;
int sequenceCount = 9;
float delayHack = 0;

void sequence() {
  /*
  if (1 == 1) {
  return;
  }*/
  println("Load sequence");
  
  ArrayList<String> sequences = new ArrayList<String>();
  
  for (int i = 0; i < sequenceCount; i++) {
    var fn = String.format("data/%d.json", i);
    String pl = jsonFileToPropertyList(fn);
    sequences.add(pl);
  }
  
  //Ani.to(this, 1, propertyList, Ani.SINE_IN_OUT, "onEnd:transitionFinished");
  
  seq = new AniSequence(this);
  seq.beginSequence();
  
  seq.add(Ani.to(this, 0.01, sequences.get(0), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 12, sequences.get(1), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  
  seq.add(Ani.to(this, 0.1, sequences.get(1), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  
  seq.add(Ani.to(this, 2, "delayHack:0" ));
  
  seq.add(Ani.to(this, 10, sequences.get(2), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  
  seq.add(Ani.to(this, 8, "delayHack:0" ));
  
  // Shake
  seq.add(Ani.to(this, 1, sequences.get(1), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 4, "delayHack:0" ));
  
  seq.add(Ani.to(this, 1, sequences.get(2), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 4, "delayHack:0" ));
  
  seq.add(Ani.to(this, 1, sequences.get(1), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 4, "delayHack:0" ));
  
  seq.add(Ani.to(this, 1, sequences.get(2), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 4, "delayHack:0" ));

  seq.add(Ani.to(this, 1, sequences.get(5), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
    seq.add(Ani.to(this, 4, "delayHack:0" ));

  seq.add(Ani.to(this, 1, sequences.get(6), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));

  seq.add(Ani.to(this, 10, "delayHack:0" ));
  
  
  seq.add(Ani.to(this, 1, sequences.get(7), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 5, "delayHack:0" ));

// 

  seq.add(Ani.to(this, 15, sequences.get(8), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 5, "delayHack:0" ));
  
   seq.add(Ani.to(this, 1, sequences.get(7), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 5, "delayHack:0" ));
  
   seq.add(Ani.to(this, 1, sequences.get(0), Ani.SINE_IN_OUT, "onEnd:transitionFinished"));
  seq.add(Ani.to(this, 5, "delayHack:0" ));
  
  seq.endSequence();
  seq.start();
  //println(sequences.get(0));
}

void transitionFinished(Ani theAni) {
  var fn = String.format("data/%d.json", animIndex);
  int now = millis();
  if (now - lastLoad > 1000) {
    println("Load data from " + fn);
    lastLoad = millis(); //<>//
    cp5.loadProperties(fn); //<>//
  }
}

void keyPressed() {
  println(keyCode);

  int numCode = keyCode - 48;
  if (numCode >= 0 && numCode < 10) {
    animIndex = numCode;
    // Load the json file if exists
    println("Load params");
    var fn = String.format("data/%d.json", animIndex);
    println(fn);
    //cp5.loadProperties(fn);
  }

  if (keyCode == 67) // c - control p5
  {
    toggleCP5Visible();
  }

  if (keyCode == 76) // l
  {
    var fn = String.format("data/%d.json", animIndex);
    println("Load data from " + fn);
    //cp5.loadProperties(fn);
    String propertyList = jsonFileToPropertyList(fn);

    Ani.to(this, 1, propertyList, Ani.SINE_IN_OUT, "onEnd:transitionFinished");
  }

  if (keyCode == 83) // s
  {
    println("Save current data");
    var fn = String.format("data/%d.json", animIndex);
    println("Save data to " + fn);
    cp5.saveProperties(fn);
  }


  if (keyCode == 68) // d
  {
    periodicFuncDebug = !periodicFuncDebug;
  }
}

void setupCP5() {
  cp5 = new ControlP5(this);

  int pl = 10; // padding left
  int pt = 10; // padding top
  int w = 100;
  int h = 14;
  int gap = 4;

  ArrayList<controlP5.Controller> sliders = new ArrayList<controlP5.Controller>();
  controllers = new ArrayList<controlP5.Controller>();

  Slider scaleSlider = cp5.addSlider("scl", 0.001, 0.099);
  scaleSlider.setDefaultValue(0.018);
  controllers.add(scaleSlider);
  sliders.add(scaleSlider);

  Slider seedSlider = cp5.addSlider("sliderSeed", 10000, 99999);
  seedSlider.setDefaultValue(12345);
  controllers.add(seedSlider);
  sliders.add(seedSlider);

  Slider radSlider = cp5.addSlider("rad", 0.01, 5);
  radSlider.setDefaultValue(1.3);
  controllers.add(radSlider);
  sliders.add(radSlider);

  Slider periodicFuncScaleSlider = cp5.addSlider("periodicFuncScale", 0.01, 10);
  periodicFuncScaleSlider.setDefaultValue(0.5);
  controllers.add(periodicFuncScaleSlider);
  sliders.add(periodicFuncScaleSlider);

  Slider dotSizePctSlider = cp5.addSlider("dotSizePct", 0, 0.01);
  dotSizePctSlider.setDefaultValue(0.1);
  controllers.add(dotSizePctSlider);
  sliders.add(dotSizePctSlider);

  Slider colsSlider = cp5.addSlider("cols", 1, 300 * 7.1);
  colsSlider.setDefaultValue(5);
  controllers.add(colsSlider);
  sliders.add(colsSlider);

  Slider rowsSlider = cp5.addSlider("rows", 1, 300);
  rowsSlider.setDefaultValue(5);
  controllers.add(rowsSlider);
  sliders.add(rowsSlider);




  Slider offMultXSlider = cp5.addSlider("offMultX", 0, 1000);
  offMultXSlider.setDefaultValue(20);
  controllers.add(offMultXSlider);
  sliders.add(offMultXSlider);

  Slider offMultYSlider = cp5.addSlider("offMultY", 0, 1000);
  offMultYSlider.setDefaultValue(20);
  controllers.add(offMultYSlider);
  sliders.add(offMultYSlider);


  Slider bgFillSlider = cp5.addSlider("bgFill", 0, 255);
  bgFillSlider.setDefaultValue(255);
  controllers.add(bgFillSlider);
  sliders.add(bgFillSlider);


  Slider numFramesSlider = cp5.addSlider("numFrames", 10, 1000);
  numFramesSlider.setDefaultValue(255);
  controllers.add(numFramesSlider);
  sliders.add(numFramesSlider);



  Slider mxSlider = cp5.addSlider("mx", 0.01, 1.0);
  mxSlider.setDefaultValue(0.5);
  controllers.add(mxSlider);
  sliders.add(mxSlider);

  Slider mySlider = cp5.addSlider("my", 0.01, 1.0);
  mySlider.setDefaultValue(0.5);
  controllers.add(mySlider);
  sliders.add(mySlider);


  Slider offsetScaleSlider = cp5.addSlider("offScl", 0.001, 0.015);
  rowsSlider.setDefaultValue(1);
  controllers.add(offsetScaleSlider);
  sliders.add(offsetScaleSlider);


  var sameParamsButton = cp5.addButton("saveParamsDefault");
  controllers.add(sameParamsButton);
  sliders.add(sameParamsButton);

  var loadParamsButton = cp5.addButton("loadParams");
  controllers.add(loadParamsButton);
  sliders.add(loadParamsButton);

  var recordSketchButton = cp5.addButton("recordSketch");
  controllers.add(recordSketchButton);
  sliders.add(recordSketchButton);

  /*
  var debugRadio = cp5.addRadioButton("radioDebug");
   debugRadio.addItem("debug", 1);
   debugRadio.setPosition(pl, pt + (h + gap) * controllers.size());
   debugRadio.setSize(w, h);
   */
  /*
  var resolutionRadio = cp5.addRadioButton("resolutionPreset");
   resolutionRadio.addItem("IG vs 360", 1);
   resolutionRadio.setPosition(pl, pt + (h + gap) * (controllers.size() + 1));
   resolutionRadio.setSize(w, h);
   */

  for (int i = 0; i < sliders.size(); i++) {
    controlP5.Controller c = sliders.get(i);
  }

  for (int i = 0; i < controllers.size(); i++) {
    controlP5.Controller c = controllers.get(i);
    c.setSize(w, h);
    c.setPosition(pl, pt + h * i + gap * i);
  }
}

class CustomWaveForm implements Waveform {
  float value(float v) {
    //return sin(TAU * v);
    /*
    println(v);
     println(res);*/
    float res = periodicFunction(v, 0, 0, 0);
    return res;
  }
}

float offset(float x, float y)
{
  //return offScl*dist(x, y, W/2, H/2);
  // radial offset
  //return offScl * dist(x, y, W/2, H/2) / max(W, H) * 100;

  // min distance to corner
  //return offScl * dist(x, y, max(x, W/2), max(y, H/2)) / max(W, H) * 100;

  return offScl * x % 2 * 100;

  //return offScl * max(W/2, x) * 100;
}

float periodicFunction(float p, float seed, float x, float y)
{
  return  periodicFuncScale * (float)noise.eval(seed+rad*cos(TAU*p), rad*sin(TAU*p), scl*x, scl*y);
}

void drawDots() {
  float sw2screen = 1.0 / ratio;

  b.beginDraw();

  float t = 1.0 * frameCount/numFrames;

  b.fill(0, bgFill);
  b.noStroke();
  b.rect(0, 0, W, H);

  b.strokeCap(SQUARE);

  b.stroke(255);
  b.strokeWeight(10 * sw2screen * dotSizePct * min(displayW, displayH) );
  b.strokeCap(ROUND);

  //b.strokeWeight(6);

  float _mx = W * mx;
  float _my = H * my;

  for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      float x = map(i, 0, max(cols-1, 1), _mx, W-_mx);
      float y = map(j, 0, max(rows-1, 1), _my, H-_my);

      float dx = offMultX * periodicFunction(t + offset(x, y), 0, x, y);
      float dy = offMultY * periodicFunction(t + offset(x, y), 123, x, y);

      //dx = 0;
      //dy = 0;
      float s = 10 * sw2screen * dotSizePct * min(displayW, displayH);
      //b.strokeWeight( 1 / ( dx + dy)  * 10 * sw2screen * dotSizePct * min(displayW, displayH) );

      b.point((int)x+dx, (int)y+dy);
    }
  }

  b.endDraw();

  drawRecording();
}

void setup() {
  //surface.setResizable(true);

  b = createGraphics(W, H, P2D);
  b.smooth(8);

  noise = new OpenSimplexNoise(12345);
  Ani.init(this);

  minim = new Minim(this);
  out = minim.getLineOut();

  CustomWaveForm customWaveForm = new CustomWaveForm();

  wave = new Oscil( 10, 1f, customWaveForm );
  //dotSizePct
  //wave = new Oscil( map(), 1f, customWaveForm );
  wave.patch(out);

  setupCP5();
  //frameRate(60);
  sequence();
}

void settings() {
  //size(displayW, displayH, P2D);
  fullScreen(P2D, SPAN);
  noSmooth();

  //smooth(8);
  //fullScreen(2);
  //noSmooth();
  //pixelDensity(2);
};

void draw() {

  drawDots();
  image(b, 0, 0, width, height);

  // HACK
  //s.changeValue(scl);

  wave.setFrequency(constrain(map(dotSizePct, 0.55, 0.01, 10, 22), 10, 22));
  if (periodicFuncDebug) {
    drawPeriodicFunction();
  }
}

float getValue(int x) {
  float delta = 1.0 / W;
  float t = delta * x;
  float samplingX = cos(t * TAU) * rad + W * 0.5;
  float samplingY = sin(t * TAU) * rad + H * 0.5;
  float val = (float)noise.eval(scl * samplingX, scl * samplingY);
  float normalized = (val + 1) / 2;
  return normalized;
}
