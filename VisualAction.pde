class VisualAction{
  
  boolean finished = false;
  float progress = 0;
  
  VisualAction(){
  
  }
  
  void step(){
    if(progress >= 1){
      finished = true;
    }
  }
  
  void display(){
    
  }
  
}
