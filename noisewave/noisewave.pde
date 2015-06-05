float yoff = 0.0;       
int frameCheck = 0;

PShape segments;

void setup() {
  size(1024, 768);
  colorMode(HSB, 255);
  
  segments = createShape(GROUP);
  segments.addChild(generateSegment(0));
  segments.disableStyle();
}

void draw() {
  background(40);
  fill(40);
  strokeWeight(2);
  
  stroke(frameCount%255,255,150);
  shape(segments);
  segments.translate(0, -0.5);

  if (frameCount - frameCheck > 50) {
    if (segments.getChildCount() > 50) {
      segments.removeChild(0);
    }
    segments.addChild(generateSegment(segments.getChildCount()*20));
    frameCheck = frameCount;
  }
}

PShape generateSegment(float distance) {
  PShape segment;
  segment = createShape();
  segment.beginShape(); 
  segment.stroke(255);
  segment.strokeWeight(2);
  segment.fill(20);

  float xoff = 0;      
  float localYoff = yoff;
  float peakCenter = width/2+random(width/2)-width/4;
  for (float x = -10; x <= width+10; x += 10) {
    if (random(10) > 9) {
      localYoff += random(20) - random(20);
    }
    float noise = noise(xoff, localYoff);
    if (x < peakCenter/2 || x > (peakCenter + peakCenter/2)) {
      noise /= 5;
    } else {
      float midDist = abs(peakCenter-x)/peakCenter;
      noise /= ((midDist+0.1)*5);
    }
    float y = map(noise, 1, 0, 200, 300); 

    // Még egy kis random szögelés
    /*
    if(random(10) > 9){
     y -= random(20);
     }
     */
    segment.vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01 + random(2);
  segment.vertex(width, height*2);
  segment.vertex(0, height*2);
  segment.endShape(CLOSE);
  segment.translate(0, height/2 + distance);
  segment.disableStyle();
  return segment;
}
