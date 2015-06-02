class VALine extends VisualAction {

  float lineStart = random(0,getHeight());
  
  VALine() {
  }

  void step() {
    super.step();
    progress += 0.03;
  }

  void display() {
    super.display();
    if(progress < 0.5){
      line(getWidth()*progress, lineStart, getWidth()*2*progress, lineStart);
    }else{
      line(getWidth()*progress, lineStart, getWidth(), lineStart);
    }
    
  }
}
