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
    float randomX = map(noise(t), 0, 1, -0.1, 0.1);
    float randomY = map(noise(s), 0, 1, -0.1, 0.1);
    acceleration = new PVector(randomX, randomY);
    print(acceleration + "\n");
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