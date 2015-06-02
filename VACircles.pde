class VACircles extends VisualAction {

  ArrayList<CircleData> circles;

  VACircles() {
    circles = new ArrayList();
    for(int i = 0; i < 10; i++){
      circles.add(new CircleData(random(-getWidth()/2,getWidth()/2),random(-getHeight()/2,getHeight()/2)));
    }
  }

  void step() {
    super.step();
    progress += 0.03;
    for (CircleData data : circles) {
      data.x = getWidth()/2 +data.targetX * progress;
      data.y = getHeight()/2 + data.targetY * progress;
    }
  }

  void display() {
    super.display();
    noStroke();    
    fill(255, 255, 255, 255*(1-progress));
    for (CircleData data : circles) {
      ellipse(data.x, data.y, data.size, data.size);
    }
  }
}

class CircleData {
  float x = 0;
  float y = 0;
  float size = random(10,50);
  float targetX = 0;
  float targetY = 0;
  
  
  CircleData(float targetX, float targetY){
    this.targetX = targetX;
    this.targetY = targetY;
    x = getWidth()/2;
    y = getHeight()/2;
  }
  
}
