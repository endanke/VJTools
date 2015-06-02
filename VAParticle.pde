// Using http://www.openprocessing.org/sketch/3897

class VAParticle extends VisualAction {

  ParticleSystem p = new ParticleSystem();

  VAParticle() {
  }

  void step() {
    super.step();
    progress += 0.03;
    p.update();
  }

  void display() {
    super.display();
    stroke(255, 255, 255, 255*(1-progress));
    p.render();
  }
}
