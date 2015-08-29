import java.util.Random;

Random generator;

void setup()  {
  size(640, 640);
  background(255);
  generator = new Random(); 
}

void draw()  {
  float num = (float)generator.nextGaussian();
  float num2 = (float)generator.nextGaussian();
  float sd = 150;
  float mean = 320;
  
  float x = sd * num + mean;
  float y = sd * num2 + mean;
  
  noStroke();
  fill(0, 5);
  ellipse(x,y,16,16);
}