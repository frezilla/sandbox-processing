MyPlot[] plots = new MyPlot[4];

class MyPlot {
  int directionX;
  int directionY;
  float currentSpeedX;
  float currentSpeedY;
  float maxSpeedX;
  float maxSpeedY;
  float xPos;
  float yPos;
  
  MyPlot(float maxSpeedX, float maxSpeedY, float directionX, float directionY, float xPos, float yPos) {
    this.directionX = (directionX < 0) ? -1 : 1;
    this.directionY = (directionY < 0) ? -1 : 1;
    
    this.maxSpeedX = max(abs(maxSpeedX), 0.1);
    this.maxSpeedY = max(abs(maxSpeedY), 0.1);
    
    changeCurrentSpeedX();
    changeCurrentSpeedY();
    
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void changeCurrentSpeedX() {
    this.currentSpeedX = random(0.1, this.maxSpeedX);
  }
  
  void changeCurrentSpeedY() {
    this.currentSpeedY = random(0.1, this.maxSpeedY);
  }
  
  void update() {
    xPos += directionX * currentSpeedX;
    yPos += directionY * currentSpeedY;
    
    if (xPos < 0 || xPos > 640) {
      directionX = -1 * directionX;
      changeCurrentSpeedX();
      xPos += directionX * currentSpeedX;
    }    

    if (yPos < 0 || yPos > 480) {
      directionY = -1 * directionY;
      changeCurrentSpeedY();
      yPos += directionY * currentSpeedY;
    }
  }
}

void setup() {
  plots[0] = new MyPlot(random(10.0), random(10.0), random(-1, 1), random(-1, 1), random(0, 640), random(0, 480));
  plots[1] = new MyPlot(random(10.0), random(10.0), random(-1, 1), random(-1, 1), random(0, 640), random(0, 480));
  plots[2] = new MyPlot(random(10.0), random(10.0), random(-1, 1), random(-1, 1), random(0, 640), random(0, 480));
  plots[3] = new MyPlot(random(10.0), random(10.0), random(-1, 1), random(-1, 1), random(0, 640), random(0, 480));


  size(640, 480, P2D);
  frameRate(30);
}

void draw() {
  background(0); //<>//
  stroke(255);
  fill(#E38B39);
  triangle(
    plots[0].xPos, plots[0].yPos,
    plots[1].xPos, plots[1].yPos,
    plots[2].xPos, plots[2].yPos
  );
  stroke(125);
  fill(255);
  triangle(
    plots[0].xPos, plots[0].yPos,
    plots[1].xPos, plots[1].yPos,
    plots[3].xPos, plots[2].yPos
  );  
  plots[0].update();
  plots[1].update();
  plots[2].update();
  plots[3].update();
} //<>//
