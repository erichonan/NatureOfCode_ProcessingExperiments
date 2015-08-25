class Walker {
  float x;
  float y;
  float lineToX;
  float lineToY;
  
  Walker() {
    x = width/2;
    y = height/2;
    lineToX = x - 1;
    lineToY = y - 1;
  }
  
  void display() {
    //float randColor = random(1.0);
    stroke(random(255), random(255), 0, random(255));
    line(x, y, lineToX, lineToY);
    x = lineToX;
    y = lineToY;
  }
  
  void step() {
    float randXDist = random(-2, 2);
    float randYDist = random(-2, 2);
    
    // if out of bounds, alternate sign to keep it within boundaries
    if((lineToX += randXDist) < 0 || (lineToX += randXDist) > 640)  {
        print("lineToX is out of bounds" + lineToX + "\n");
        randXDist *= -1;
        print("new lineToX" + lineToX + "\n");
    }
    
    if((lineToY += randYDist) < 0 || (lineToY += randYDist) > 360)  {
      print("lineToY is out of bounds" + lineToY + "\n");
      randYDist *= -1;
      print("new lineToY" + lineToY + "\n");
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