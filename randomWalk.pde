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
    stroke(random(255), 0, 0, random(255));
    line(x, y, lineToX, lineToY);
    x = lineToX;
    y = lineToY;
  }
  
  void step() {
    float randXDist = random(-15, 15);
    float randYDist = random(-15, 15);  
    lineToX = (x + randXDist);
    lineToY = (y + randYDist);
    
    // if out of bounds, alternate sign to keep it within boundaries
    if(lineToX < 0 || lineToX > 640)
    {
      print("lineToX is out of bounds" + lineToX);
      lineToX *= -1;
      print("new lineToX" + lineToX);
    }
    
    if(lineToY < 0 || lineToY > 360)
    {
      print("lineToY is out of bounds" + lineToY);
      lineToY *= -1;
      print("new lineToY" + lineToY);
    }
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