import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

static class VideoExporter
{
  public static String getLatestGitLog(PApplet applet) {
    ProcessBuilder processBuilder = new ProcessBuilder();
    processBuilder.directory(new File(applet.sketchPath()));
    String gitLog = "git describe --always";
    processBuilder.command("zsh", "-c", gitLog);

    try {
      Process process = processBuilder.start();

      BufferedReader reader =
        new BufferedReader(new InputStreamReader(process.getInputStream()));

      String acc = "";
      String line;
      while ((line = reader.readLine()) != null) {
        acc += line;
      }

      int exitCode = process.waitFor();
      return acc.strip();
    }
    catch (Exception e) {
      println("Catch all exception");
      println(e);
    }
    return "";
  }

  // Git commit + time
  public static String defaultFileName(PApplet applet) {
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd_HH-mm-ss");
    LocalDateTime now = LocalDateTime.now();
    
    return "%s-%s".formatted(dtf.format(now), VideoExporter.getLatestGitLog(applet));
  }

  public static void generateGif(PApplet applet, String fileName) {
    String png2gif = "/usr/local/bin/mogrify -format gif *.png";
    String gifsicle = "/usr/local/bin/gifsicle --delay=2 --loop *.gif > %s.gif".formatted(fileName);
    String saveRes = "mv " + fileName + ".gif temp.bak";
    String rmGif = "rm *.gif";
    String restoreRes = "mv temp.bak " + fileName + ".gif";
    String makeGif = "%s && %s && %s && %s && %s".formatted(png2gif, gifsicle, saveRes, rmGif, restoreRes);

    VideoExporter.executeCommand(applet, makeGif);
  }
  
  public static void generateVideo(PApplet applet, String fileName) {
    String makeVideo = "/usr/local/bin/ffmpeg -y -framerate 60 -pattern_type glob -i '*.png' -preset veryslow -tune animation -c:v libx264 -pix_fmt yuv420p -crf 23 -f mp4 %s.mov".formatted(fileName);
    VideoExporter.executeCommand(applet, makeVideo);
    
    String makeVideoLoop5 = "/usr/local/bin/ffmpeg -y -stream_loop 5 -i %s.mov -c copy %s-loop05.mov".formatted(fileName, fileName);
    VideoExporter.executeCommand(applet, makeVideoLoop5);
    
    String makeVideoLoop10 = "/usr/local/bin/ffmpeg -y -stream_loop 10 -i %s.mov -c copy %s-loop10.mov".formatted(fileName, fileName);
    VideoExporter.executeCommand(applet, makeVideoLoop10);
  }
  
  public static void cleanupImages(PApplet applet, String folderName) {
    String cleanup = "mkdir -p %s && mv *.png %s".formatted(folderName, folderName);
    VideoExporter.executeCommand(applet, cleanup);
  }

  public static void executeCommand(PApplet applet, String command) {
    ProcessBuilder processBuilder = new ProcessBuilder();
    processBuilder.directory(new File(applet.sketchPath()));
    
    println("Executing command: %s".formatted(command));
    processBuilder.command("zsh", "-c", command);

    try {
      Process process = processBuilder.start();

      BufferedReader reader =
        new BufferedReader(new InputStreamReader(process.getInputStream()));

      String line;
      while ((line = reader.readLine()) != null) {
        System.out.println(line);
      }

      int exitCode = process.waitFor();

      System.out.println("\nExited with code : " + exitCode);
      if (exitCode != 0) {
        println("Failed to generate the documentation.");
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    catch (InterruptedException e) {
      e.printStackTrace();
    }
    catch (Exception e) {
      println("Catch all exception");
      println(e);
    }
  }
}
