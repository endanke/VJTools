class VAZoom extends VisualAction {

  boolean stroke = false;

  VAZoom() {
    if (int(random(2)) == 1) {
      stroke = true;
    }
  }

  void step() {
    super.step();
    progress += 0.03;
  }

  void display() {
    super.display();
    if (stroke) {
      noFill();
    } else {
      noStroke();
      fill(fillColor, 255*(1-progress));
    }
    rectMode(CENTER);
    rect(getWidth()/2, getHeight()/2, getWidth()*progress, getHeight()*progress);
    rectMode(CORNER);
  }
}
