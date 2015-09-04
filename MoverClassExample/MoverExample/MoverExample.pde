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

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 10;
  }

  void update() {
    //velocity.add(acceleration);
    //velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 48, 48);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
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