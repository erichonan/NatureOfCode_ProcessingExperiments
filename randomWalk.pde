import java.util.Random;

class Walker {
  float x;
  float y;
  float lineToX;
  float lineToY;
  float range;
  Random generator;
  float r1;
  float r2;
  float probability;
  
  Walker() {
    range = 22;
    x = width/2;
    y = height/2;
    lineToX = x - 1;
    lineToY = y - 1;
    generator = new Random();
  }
  
  void display() {
    stroke(random(150,255), random(100,255), 0, random(100, 255));
    line(x, y, lineToX, lineToY);
  }
  
  void step() {
    x = lineToX;
    y = lineToY;
    
    float left = -range;
    float right = range;
    float top = -range;
    float bottom = range;
    float randXDist = random(left, right);
    float randYDist = random(top, bottom);
    
    // if out of bounds, alternate sign to keep it within boundaries
    if((lineToX += randXDist) < (-range) || (lineToX += randXDist) > (width + range))  {
        randXDist *= -1;
    }
    
    if((lineToY += randYDist) < (-range) || (lineToY += randYDist) > (height + range))  {
      randYDist *= -1;
    }
    
    lineToX = (x + randXDist);
    lineToY = (y + randYDist);
    
        Boolean pickAgain = true;
    for(int i = 0; i < 10; i++) {
      r1 = random(0, 100);
      probability = r1;
      r2 = random(0, 10);
      
      if(r2*r2 >= probability) {
        range = r2;
        pickAgain = false;
        print("range found: " + range + " r1=" + r1 + "r2=" + r2 + "\n");
      } else {
        print("range discarded. r1=" + r1 + " r2=" + r2 + "\n");
      }
    }
    // so I need to create a gaussian number that distributes between 0 and 20
    /*float num = (float)generator.nextGaussian();
    float sd = 1;
    float mean = 4;
    range = sd * num + mean;*/
  }
}

void setup() {
  size(640,360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}

Walker w;