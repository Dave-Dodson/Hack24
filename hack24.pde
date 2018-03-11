import processing.video.*;
import java.io.*;
import java.util.*;
import java.lang.*;
import java.lang.Object;

import java.io.File;
import java.net.URI;
// import org.apache.http.HttpEntity;
// import org.apache.http.HttpResponse;
// import org.apache.http.client.HttpClient;
// import org.apache.http.client.methods.HttpPost;
// import org.apache.http.client.utils.URIBuilder;
// import org.apache.http.entity.FileEntity;
// import org.apache.http.impl.client.HttpClients;
// import org.apache.http.util.EntityUtils;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  saveFrame("dist/faceapi/face.jpeg");

  // HttpClient httpclient = HttpClients.createDefault();

  // try {
  //   URIBuilder builder = new URIBuilder("https://westeurope.api.cognitive.microsoft.com/face/v1.0/detect?/");
  //   builder.setParameter("returnFaceId", "true");

  //   URI uri = builder.build();
  //   HttpPost request = new HttpPost(uri);
  //   // request.setHeader("Content-Type", "application/octet-stream");
  //   request.setHeader("Ocp-Apim-Subscription-Key", "37a4833955ee4f919cbb56a28769e869");

  //   File file = new File("/home/saimun/sketchbook/hack24/face.jpeg");
  //   FileEntity reqEntity = new FileEntity(file, "application/octet stream");
  //   request.setEntity(reqEntity);

  //   HttpResponse response = httpclient.execute(request);
  //   HttpEntity entity = response.getEntity();
  //   println(entity.toString());

  //   if (entity != null) {
  //     println(EntityUtils.toString(entity));
  //   }
  // } catch (Exception e) {
  //   println(e.getMessage());
  // }

  // now with binary support
  // PostRequest post = new PostRequest("https://westeurope.api.cognitive.microsoft.com/face/v1.0/detect?/returnFaceId=true");
  // byte[] bytes = loadBytes("face.jpeg");
  // // byte[] bytes = new byte[10];
  // post.addHeader("Ocp-Apim-Subscription-Key", "37a4833955ee4f919cbb56a28769e869");
  // post.addData("application/octet-stream", bytes);
  // post.send();
  // println("Response Content: " + post.getContent());
  // println("Response Content-Length Header: " + post.getHeader("Content-Length"));

  // or from a file
  // post.addDataFromFile("image/jpeg", "/home/saimun/sketchbook/hack24/face.jpeg");

  // open(/home/saimun/sketchbook/hack24/faceapi.py);

  // exec("/home/saimun/sketchbook/hack24/faceapi.py");
  // println("1");
  // sendImageRequest("/home/saimun/sketchbook/hack24/faceapi.py");
  // exec("/usr/bin/python /home/saimun/sketchbook/hack24/faceapi.py");
  thread("script");
  delay(10000);
  // try {
  //   // Process p = new ProcessBuilder("/usr/bin/python", "/home/saimun/sketchbook/hack24/faceapi.py")gcc.start();
  // //   // Process p = new ProcessBuilder("/bin/bash", "-c", "python", "faceapi.py").start();
  // //   // String command = "bash", "-c", "python faceapi.py";
  //   // Process p = Runtime.getRuntime().exec(new String[] {"bash", "-c", "python faceapi.py"});
  //   Process p = Runtime.getRuntime().exec("/usr/bin/python /home/saimun/sketchbook/hack24/faceapi.py");
  //   exec("/usr/bin/python /home/saimun/sketchbook/hack24/faceapi.py");
  // //   Runtime.getRuntime().exec("python faceapi.py");
  // } catch (java.io.IOException e) {
  //   println("fail");
  // }
  // println("2");
  // delay(10000);
  // println(test2);

  // PImage img = loadImage("line.JPEG");
  // String [] img = binary(loadImage("/home/saimun/sketchbook/hack24/line.JPEG"));

  // byte b[] = loadBytes("face.jpeg");
  // String binary = b.toString();
  // println(binary);
  // saveBytes("bin", b);

  // String img[]
  // String imgArray[] = loadStrings("/home/saimun/sketchbook/hack24/line.jpeg");
  // String img = "";

  //println(imgArray.length);
  

//for (int i = 0; i < imgArray.length; i++){
  //  img += imgArray[i];
  //}


  // File img = new File("line.jpeg");
  // ByteArrayOutputStream baos = new ByteArrayOutputStream();
  // ImageIO.write(img, "jpeg", baos);
  // byte[] imgbytes = baos.toByteArray();

  // println(imgbytes.toString());

  // println(img);

  // println(str(b));
  // println(str(b));
  // delay(1000);

  // PostRequest post = new PostRequest("https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?/returnFaceId=true&returnFaceLandmarks=false");
  // post.addHeader("Content-Type", "application/octet-stream");
  // post.addHeader("ocp-apim-subscription-key", "effb53a98d3f444ab04cdeddb0fec774");
  // // post.addData("data", binary);
  // // post.addFile("data", img);
  // // post.addData("data", imgbytes.toString());
  // // post.addFile("data", "/home/saimun/sketchbook/hack24/line.JPEG");
  // post.addFile("data", "/home/saimun/sketchbook/hack24/bin");
  // // post.sendImageRequest("/home/saimun/sketchbook/hack24/face.jpeg");
  // // File file = new File ("home/saimun/sketchbook/hack24/face.jpeg");
  // // FileEntity reqEntity = new FileEntity(file, ContentType.APPLICATION_OCTET_STREAM);
  // // reqEntity.setChunked(false);
  // post.send();
  // println("Reponse Content: " + post.getContent());
  // println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));

  exit();

  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

// public void sendImageRequest(String im
                             // agePath)
// {
  // try {
    // HttpClient httpClient = new Defaul
  // tHttpClient();

    // File file = new File(imagePath);
    // FileInputStream fileInputStreamRea
      // der = new FileInputStream(file);
    // byte[] bytes = new byte[(int)file.
                            // length()];
    // fileInputStreamReader.read(bytes);
    // ByteArrayEntity reqEntity = new By
  // teArrayEntity(bytes, ContentType.APP
                // LICATION_OCTET_STREAM)
                // ;
    // request.setEntity(reqEntity);

    // HttpResponse response = httpClient
  // .execute(request);
    // HttpEntity entity = response.getEn
  // tity();
    // if (entity != null) {
      // this.responseResult = EntityUtil
  // s.toString(entity);
    // }
  // } catch(Exception e) {
    // System.out.println(e.getMessage())
      // ;
  // }
// }

void script() {
  launch("/home/saimun/sketchbook/hack24/dist/faceapi/faceapi");
  // try {
  //   //   // Process p = new ProcessBuilder("/bin/bash", "-c", "python", "faceapi.py").start();
  //   //   // String command = "bash", "-c", "python faceapi.py";
  //   // Process p = Runtime.getRuntime().exec(new String[] {"bash", "-c", "python faceapi.py"});
  //   // Process p = Runtime.getRuntime().exec("/usr/bin/python /home/saimun/sketchbook/hack24/faceapi.py");
  //   //   Runtime.getRuntime().exec("python faceapi.py");
  //   println("1");
  //   // Process p = new ProcessBuilder("/bin/bash", "-c", "python", "faceapi.py").start();
  //   println("2");
  // } catch (java.io.IOException e) {
  //   println(e);
  // }
}
