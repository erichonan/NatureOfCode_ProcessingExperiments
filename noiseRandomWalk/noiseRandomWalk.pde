import java.util.Random;

class Walker {
  float x,y;
  float tx,ty;
  
  Walker() {
    x = 320;
    y = 180;
    tx = 0;
    ty = 10000;
  }
  
  void display() {
    stroke(random(150,255), random(100,255), 0, random(100, 255));
    point(x,y);
  }
  
  void step() {
    /* So I need to be able to pick a number between say -5 and 5. This number will
    determine how far the step will go left or right. Then I need another number that
    is between -5 and 5. This number will determine how far up or down the step will
    travel up or down. Now I want these numbers between -5 and 5 to be based off of
    perlin noise. So how do I go about doing that? Well I'll apply the perlinNoise
    generated values to the existing x and y position. the x and y positions need to
    start in the middle of the page.
    
    Another quick note is that I should update the boundary method so that I can add
    it to any class and reverse any values that are out of bounds. This would be
    helpful for the current script.
    */
    
    x += map(noise(tx), 0, 1, -3, 3);
    y += map(noise(ty), 0, 1, -3, 3);
    
    print("x: " + x + " y: " + y);
    tx += 0.01;
    ty += 0.01;
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