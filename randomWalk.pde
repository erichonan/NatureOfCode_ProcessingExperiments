class Walker {
  float x;
  float y;
  float lineToX;
  float lineToY;
  float range;
  
  Walker() {
    range = 22;
    x = width/2;
    y = height/2;
    lineToX = x - 1;
    lineToY = y - 1;
  }
  
  void display() {
    stroke(random(150,255), random(100,255), 0, random(100, 255));
    line(x, y, lineToX, lineToY);
    x = lineToX;
    y = lineToY;
  }
  
  void step() {
    float left = x > mouseX ? 0 : -range/2;
    print("left " + left);
    float right = x < mouseX ? range/2 : 0;
    print("right " + right);
    float top = y > mouseY ? range/2 : 0;
    print("top " + top);
    float bottom = y < mouseY ? 0 : range/2;
    print("bottom " + bottom);
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