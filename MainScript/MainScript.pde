float [][] terrain;
int cols;
int lines;
int sizeCell;
int widthNeeded;
int heightNeeded;

float xTime;
float yTime;

void setup(){
  size(600, 600, P3D);
  sizeCell = 20;
  widthNeeded = 0;
  heightNeeded = 0;
  cols = width/sizeCell + 1 + widthNeeded;
  lines = height/sizeCell + 1 + heightNeeded;
  
  terrain = new float[cols][lines];
  xTime = random(10000);
  yTime = random(10000);
}

void draw (){
  background(0);
  stroke(255);
  noFill();
  
  translate(0, height/3);
  rotateX(PI/3);
  
  float currXTime = xTime;
  float currYTime = yTime;
  
  for(int y=0; y<lines; y++){
    currXTime = xTime;
    for(int x=0; x<cols; x++){
      terrain[x][y] = map(noise(currXTime, currYTime), 0, 1, -100, 100);
      currXTime += 0.07;
    }
    currYTime += 0.07;
  }
  
  for(int y=0; y<lines-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++){
      vertex(x*sizeCell, y*sizeCell, terrain[x][y]);
      vertex(x*sizeCell, (y+1)*sizeCell, terrain[x][y+1]);
    }
    endShape();
  }
  
  yTime -= 0.03;
}
