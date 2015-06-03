import java.util.*; 
import ddf.minim.*;
 
Minim minim;
AudioInput in;
 
ArrayList<VisualAction> actions;
color backgroundColor = color(192, 64, 0);
int timeCheck = 0;
boolean randomEnabled = false;
PImage leftHalf;

void setup() {
  size(400, 400);
  if (frame != null) {
    frame.setResizable(true);
  }
  
  frameRate(30);

  minim = new Minim(this);
  in = minim.getLineIn();
  in.enableMonitoring();

  actions = new ArrayList();
  actions.add(new VAZoom());
} 

void draw() {
  background(backgroundColor);

  for (int i = actions.size () - 1; i >= 0; i--) {
    VisualAction va = actions.get(i);
    fill(255, 255, 255, 100);
    stroke(255);
    va.step();
    va.display();
    if (va.finished) {
      actions.remove(i);
    }
  }

  if (randomEnabled) {
    if (millis() - timeCheck > 100) {
      println("ok");
      doActionWithIndex(int(random(7)));
      timeCheck = millis();
    }
  }
  
  // Stuff for audio wave visualisation
  /*
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
  */
  // Stuff for kaleidoscopic effects
  /*
  leftHalf = get(0, 0, width/2, height);
  translate(width, 0);
  scale(-1, 1);
  image(leftHalf, 0, 0);
  */
  println("fps: " + frameRate);
}

void keyPressed() {
  switch(key) {
  case ' ':
    doActionWithIndex(0);
    break;
  case 'a':
    doActionWithIndex(1);
    break;
  case 's':
    doActionWithIndex(2);
    break;
  case 'd':
    doActionWithIndex(3);
    break;
  case 'f':
    doActionWithIndex(4);
    break;
  case 'g':
    doActionWithIndex(5);
    break;
  case 'h':
    doActionWithIndex(6);
    break;
  default:
    break;
  }
}

void doActionWithIndex(int index) {
  switch(index) {
  case 0:
    backgroundColor = color(random(255), random(255), random(255));
    break;
  case 1:
    actions.add(new VALine());
    break;
  case 2:
    actions.add(new VACircles());
    break;
  case 3:
    actions.add(new VATiles());
    break;
  case 4:
    actions.add(new VAParticle());
    break;
  case 5:
    actions.add(new VAZoom());
    break;
  case 6:
    actions.add(new VAWave());
    break;
  default:
    break;
  }
}
