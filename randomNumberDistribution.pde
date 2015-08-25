int [] randomCounts;
int [] colors;

//The idea is to change the color based the last update 
void setup() {
  size(640,240);
  randomCounts = new int[20];
  colors = new int[20];
  background(255);
  frameRate(24);
}

void draw() {
  //background(255);
  
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  stroke(0);
  int w = width/randomCounts.length;
  
  for (int x = 0; x < randomCounts.length; x++) {
    if(index == x) {
      colors[x]+=3;
    } else {
      colors[X]-= 3;
    }
    fill(colors[X]);
    rect(x*w,height-randomCounts[x], w-1,randomCounts[x]);
  }
}