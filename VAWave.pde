class VAWave extends VisualAction {
  float yoff = random(1);
  float initialX = random(PI)*2;
  int interval = 100;
  int thickness = 40;
  
  VAWave() {
  }

  void step() {
    super.step();
    progress += 0.01;
  }

  void display() {
    super.display();
    noStroke();
    fill(fillColor, 255*(1-progress));
    beginShape(); 

    float xoff = initialX; 
    for (float x = -thickness; x <= width+thickness; x += 10) {
      float y = sin(yoff+xoff)*interval;
      vertex(x, y+getHeight()/2-interval/2); 
      xoff += 0.05;
    }
    for (float x = width+thickness; x >= -thickness; x -= 10) {
      float y = sin(yoff+xoff)*interval;
      vertex(x, y+thickness+getHeight()/2-interval/2); 
      xoff -= 0.05;
    }

    yoff += 0.01;
    //vertex(width, height);
    //vertex(0, height);
    endShape(CLOSE);
  }
}
