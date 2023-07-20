Star[] stars;
int nbStars;

class Star {
  float angle;
  float extent;
  float extentPos;
  float speed;
  float xPos, yPos;
  float x, y;
  
  Star(float speed, float angle, float extentPos, float extent) {
    this.angle = angle;
    this.extent = extent;
    this.extentPos = extentPos;
    this.speed = speed;
    this.xPos = width/2;
    this.yPos = height/2;
  }
  
  boolean isAlive() {
    return x > 0 && x < width && y > 0 && y < height;
  }
  
  void update() {
    extentPos += speed;
    
    x = cos(angle) * extentPos + xPos;
    y = sin(angle) * extentPos + yPos;
    
    circle(x, y, extent);
  }
  
}

void setup() {
  size(640, 640);
  noStroke();
  frameRate(60);
  nbStars = (int) random(50, 100);
  stars = new Star[nbStars];
  for (int i = 0; i < nbStars; i++) {
    stars[i] = createStar();
  }
}

void draw() {
  background(0);
 
  ArrayList<Integer> indexesToRemove = new ArrayList<>();
  
  for (int i = 0; i < nbStars; i++) {
    Star currentStar= stars[i];
    currentStar.update();
    if (!currentStar.isAlive()) {
      indexesToRemove.add(i);
    }
  }
  
  if (!indexesToRemove.isEmpty()) {
    for (Integer index : indexesToRemove) {
      stars[index] = createStar();
    }
  }
  
}

Star createStar() {
  float speed = random(0.2, 3); 
  float angle = random(0, TWO_PI);
  float extentPos = random(30, 100);
  return new Star(speed, angle, extentPos, 5);
}
