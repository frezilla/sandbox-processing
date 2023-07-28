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
  
  void setColor() {
    int absXSpeed = (int) Math.abs(speed);
    if (absXSpeed < 0.4) {
      fill(#707070);
    } else if (absXSpeed < 0.6) {
      fill(#808080);
    } else if (absXSpeed < 0.8) {
      fill(#909090);
    } else if (absXSpeed < 1.0) {
      fill(#A0A0A0);
    } else if (absXSpeed < 1.2) {
      fill(#B0B0B0);
    } else if (absXSpeed < 1.4) {
      fill(#C0C0C0);      
    } else if (absXSpeed < 1.6) {
      fill(#D0D0D0);
    } else if (absXSpeed < 1.8) {
      fill(#E0E0E0);
    } else if (absXSpeed < 2.0) {
      fill(#F0F0F0);
    } else if (absXSpeed < 2.2) {
      fill(#F4F4F4);
    } else if (absXSpeed < 2.4) {
      fill(#F8F8F8);
    } else if (absXSpeed < 2.6) {
      fill(#FAFAFA);
    } else if (absXSpeed < 2.8) {
      fill(#FCFCFC);
    } else {
      fill(#FFFFFF);
    }
  }
  
  void update() {
    extentPos += speed;
    
    x = cos(angle) * extentPos + xPos;
    y = sin(angle) * extentPos + yPos;
    setColor();
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
  float speed = random(0.2, 20); 
  float angle = random(0, TWO_PI);
  float extentPos = random(10, 100);
  float extent = random(2, 8);
  return new Star(speed, angle, extentPos, extent);
}
