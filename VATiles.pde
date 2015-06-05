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
    fill(fillColor, 255*(1-progress));
    float wstep = getWidth()/res;
    float hstep = getHeight()/res;
    for (int i = 0; i < res; ++i) {
      for (int j = 0; j < res; ++j) {
        rect(wstep/2+wstep*i-wstep*progress/2, hstep/2+hstep*j-hstep*progress/2, wstep*progress, hstep*progress);
      }
    }
  }
}
