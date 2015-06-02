class VAWave extends VisualAction {
  float yoff = random(1);

  VAWave() {
  }

  void step() {
    super.step();
    progress += 0.02;
  }

  void display() {
    super.display();
    noStroke();
    fill(255, 255, 255, 255*(1-progress));
    beginShape(); 

    float xoff = 0; 
    for (float x = 0; x <= width; x += 10) {
      float y = sin(yoff+xoff)*getHeight()/2;
      vertex(x, y+getHeight()/4); 
      xoff += 0.05;
    }
    xoff = 0;
    for (float x = width; x >= 0; x -= 10) {
      float y = sin(yoff+xoff)*getHeight()/2;
      vertex(x, y+10+getHeight()/4); 
      xoff += 0.05;
    }

    yoff += 0.01;
    //vertex(width, height);
    //vertex(0, height);
    endShape(CLOSE);
  }
}
