class VATiles extends VisualAction {

  int res = 5;

  VATiles() {
  }

  void step() {
    super.step();
    progress += 0.03;
  }

  void display() {
    super.display();
    noStroke();
    fill(255, 255, 255, 255*(1-progress));
    rectMode(CENTER);
    float wstep = getWidth()/res;
    float hstep = getHeight()/res;
    for (int i = 0; i < res; ++i) {
      for (int j = 0; j < res; ++j) {
        rect(wstep*i+wstep/2, hstep*j+hstep/2, wstep*progress, hstep*progress);
      }
    }
    rectMode(CORNER);
  }
}
