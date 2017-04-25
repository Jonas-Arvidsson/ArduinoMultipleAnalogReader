import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;
 
import processing.serial.*;
 
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
 
public class processing extends PApplet {
 
 
 
//VARIABLER
Serial myPort;        // The serial port

 
boolean run = false;
int data = 0;
 
float[] B = new float[8];


int z = 0;
 
 
public void setup () {
  // set the window size:
 
 
  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());
 
  myPort = new Serial(this, Serial.list()[0], 9600);
 
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
 
  // set inital background:
  background(255 , 255, 255);
  
 
}
public void draw () {
 
  


}
 
 
public void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
 
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    String[] SA = split(inString,".");
   
    try {
    for(int i = 0; i< SA.length; i++) {
    B[i] = map(PApplet.parseFloat(SA[i]),0,1023,0,h);
    if(run){
      data = data + (int)B[i];
      //println(data);
    }
  
    }
    }
    catch(RuntimeException e) {
       println("Error");
    }
   

 
  }
}

  public void settings() {  size(1250,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}