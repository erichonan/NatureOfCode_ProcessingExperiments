Mover mover;
PVector up = new PVector(0.0,0.1);
PVector down = new PVector(0.0,-0.1);
void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);

  mover.update();
  mover.checkEdges();
  mover.display();
}

class Mover {

  float t = 3;
  float s = 50;
  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 1;
  }

  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    float scale = dir.mag();
    print("scale: " + scale);
    dir.normalize();
    //scale.mult(0.5); // get direction based on the difference between location and mouse
    dir.mult(scale * 2); // <-- I think this line is the key to solving example 1.8
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    t += 0.1;
    s += 0.1;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 48, 48);
  }

  void checkEdges() {

    if (location.x > width + 24) {
      location.x = -24;
    } else if (location.x < 0 - 24) {
      location.x = width + 24;
    }

    if (location.y > height + 24) {
      location.y = -24;
    } else if (location.y < 0 - 24) {
      location.y = height + 24;
    }
  }
  
  void accelerateUp() {
     velocity.add(acceleration);
     velocity.limit(topspeed);
  }
  
  void accelerateDown() {
    velocity.sub(acceleration);
    velocity.limit(topspeed);
  }
}