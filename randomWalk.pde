import java.util.Random;

class Walker {
  float x;
  float y;
  float lineToX;
  float lineToY;
  float range;
  Random generator;
  
  Walker() {
    range = 22;
    x = width/2;
    y = height/2;
    lineToX = x - 1;
    lineToY = y - 1;
    generator = new Random();
  }
  
  void display() {
    // so I need to create a gaussian number that distributes between 0 and 20
    float num = (float)generator.nextGaussian();
    float sd = 1;
    float mean = 4;
    range = sd * num + mean;
    print(range + "\n");
    stroke(random(150,255), random(100,255), 0, random(100, 255));
    line(x, y, lineToX, lineToY);
    x = lineToX;
    y = lineToY;
  }
  
  void step() {
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