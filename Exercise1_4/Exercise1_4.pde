import java.util.Random;

Random generator;

void setup()  {
  size(640, 640);
  background(50);
  generator = new Random(); 
}

void draw()  {
  float num = (float)generator.nextGaussian();
  float num2 = (float)generator.nextGaussian();
  float sd = 80;
  float mean = 300;
  
  float x = sd * num + mean;
  float y = sd * num2 + mean;
  
  noStroke();
  float color1 = abs((float)generator.nextGaussian() * 255);
  float color2 = abs((float)generator.nextGaussian() * 255);
  print(color1 + "\n");
  fill(color1, color2, 100, 80);
  ellipse(x,y,16,16);
}