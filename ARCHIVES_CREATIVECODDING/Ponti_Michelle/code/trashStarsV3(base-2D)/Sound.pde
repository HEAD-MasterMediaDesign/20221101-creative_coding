import ddf.minim.analysis.*;
import ddf.minim.*;
import javax.sound.sampled.*;

public class Analysor {

  boolean debug=true;

  //------------------------------------------------------------
  //>> MINIM AND ANALYSIS SYSTEM
  //------------------------------------------------------------
  private PApplet app;
  Minim minim;  

  BeatDetect beat;

  FFT fftLin;
  String path;
  int echan;

  AudioPlayer jingle;
  AudioInput in;

  AudioSource source; 

  float senbility=1;
  float [] tabChannel;
  boolean [] pointer;

  //------------------------------------------------------------
  //>> CONSTRUCTOR FOR MP3
  //------------------------------------------------------------
  Analysor(PApplet app, String path, int echan) {
    this.app=app;
    this.path=path;
    this.echan=echan;
    minim = new Minim(app);

    jingle = minim.loadFile(path);
    jingle.loop();
    
    initAnalysor();
  }
  //------------------------------------------------------------
  //>> CONSTRUCTOR FOR LINE IN
  //------------------------------------------------------------
  Analysor(PApplet app, int echan) {
    this.app=app;
    this.path=path;
    this.echan=echan;
    minim = new Minim(app);

    in = minim.getLineIn();

    initAnalysor();
  }

  void initAnalysor() {
    if (jingle!=null)source = jingle;
    if (in!=null)source = in;

    fftLin = new FFT( source.bufferSize(), source.sampleRate());
    //fftLin.linAverages(echan);
    fftLin.logAverages( echan, 10 );

    beat = new BeatDetect();
    beat.detectMode(BeatDetect.FREQ_ENERGY);
    beat.setSensitivity(500);

    this.app.registerMethod("keyEvent", this);
    //noSmooth();
    pointer = new boolean[fftLin.avgSize()];
    tabChannel = new float[fftLin.avgSize()];
    for (int i=0; i<pointer.length; i++)pointer[i]=false;
  }
  //-------------------------------------------------------------
  //  RUN SYSTEM
  //-------------------------------------------------------------
  void runAnalyse() {
    beat.detect(source.mix);
    if (jingle!=null)fftLin.forward( jingle.mix );
    if (in!=null)fftLin.forward( in.mix );
    
    for(int i=0;i<tabChannel.length;i++)tabChannel[i]=fftLin.getAvg(i)*senbility;
    
  }
  //-------------------------------------------------------------
  //  DRAW PRE ANALYSE DU SYSTEME
  //-------------------------------------------------------------
  int margeH=90;
  int margeV=30;

  void drawPreAnalyse(int x, int y, int w, int h) {
    if (debug) {
      //--------------------------------------------------
      //  FOND NOIR
      //--------------------------------------------------
      strokeWeight(1);
      pushStyle();
      rectMode(CORNER);
      noStroke();
      fill(0);
      rect(x, y, w, h);

      fill(255);
      text("Graphic Analyser \nHelper Class for student "+"\nSensibility : "+senbility, x+20, y+20);

      text("Power : "+int(getPower()),x+margeH+500,y+margeV/2+10);
      rect(x+margeH+600,y+margeV/2,getPower(),10);

      float sLarg=float(w-margeV*2)/fftLin.avgSize();

      for (int i = 0; i < fftLin.avgSize (); i++) {
        // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
        stroke(100);
        line(int(margeV+x+i*sLarg), y+h-margeH, int(margeV+x+i*sLarg), y+h-margeH-100);
        fill(255);
        noStroke();
        rect(int(margeV+x+i*sLarg), y+h-margeH, int(sLarg), - fftLin.getAvg(i)*senbility);

        //--------------------------------------------------
        //  affichage Fréquence
        //--------------------------------------------------
        pushMatrix();
        translate(int(margeV+x+i*sLarg), int(y+h-margeH+40));
        rotate(PI/2);
        text(int(fftLin.getAverageCenterFrequency(i)), 0, 0);
        popMatrix();

        //--------------------------------------------------
        //  affichage colonne
        //--------------------------------------------------
        if (pointer[i]==false) {
          fill(0, 255, 255);
        } else {
          fill(255, 40, 40);
        }

        pushMatrix();
        if (i%2==0) {
          translate(int(margeV+x+i*sLarg), int(y+h-margeH+20));
        } else {
          translate(int(margeV+x+i*sLarg), int(y+h-margeH+25));
        }
        text(i, 0, 0);
        popMatrix();
      }

      popStyle();
    }

    for (int i=0; i<pointer.length; i++)pointer[i]=false;
  }

  //--------------------------------------------------
  //  Student method usefull
  //--------------------------------------------------
  float getChannel(int cha) {
    pointer[cha]=true;
    return fftLin.getAvg(cha)*senbility;
  }
  int getNbreChannel() {
    return fftLin.avgSize();
  }

  boolean getBeat() {
    return beat.isOnset();
  }
  
  boolean getSnare() {
    return beat.isSnare();
  }
  
  float getPower(){
    float result=0;
    for(int i=0;i<tabChannel.length;i++)result+=tabChannel[i]*senbility;
    result/=tabChannel.length;
    return result;
  }
  
  //--------------------------------------------------
  //  setter
  //--------------------------------------------------
  void volume(float vol){
    source.setVolume(vol);
  }
  
  void changeMixerChannel(int channel){
        Mixer.Info[] mixerInfo;
        mixerInfo = AudioSystem.getMixerInfo();
      
      Mixer mixer = AudioSystem.getMixer(mixerInfo[channel]);
      minim.setInputMixer(mixer);
      in = minim.getLineIn(Minim.STEREO);
  }
  
  //--------------------------------------------------
  //  keyEvent
  //--------------------------------------------------
  public void keyEvent(KeyEvent e) {
   // println(e.getKeyCode());
    if (e.getAction()==e.RELEASE && e.getKeyCode()==32) {
      debug=!debug;
    }
    if (e.getAction()==e.RELEASE && e.getKeyCode()==38) {
      senbility+=.5;
    }
    if (e.getAction()==e.RELEASE && e.getKeyCode()==40) {
      senbility-=.5;
    }
  }


  //----------------------------------------------------------------------------------------------------
}
