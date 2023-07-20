Star[] stars;
int nbStars;

class Star {
  float extent;
  float xPos, yPos;
  float xSpeed, ySpeed;
  
  Star(int xPos, int yPos, float xSpeed, float ySpeed, float extent) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.extent = extent;
  }
  
  boolean isAlive() {
    return xPos > 0 && xPos < width && yPos > 0 && yPos < height;
  }
  
  void setColor() {
    int absXSpeed = (int) Math.abs(xSpeed);
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
    } else {
      fill(#FFFFFF);
    }
  }
  
  void update() {
    xPos += xSpeed;
    yPos += ySpeed;
    setColor();
    circle(xPos, yPos, extent);
  }
}

void setup() {
  size(640, 480);
  noStroke();
  frameRate(60);
  nbStars = (int) random(100, 150);
  stars = new Star[nbStars];
  for (int i = 0; i< nbStars; i++) {
    stars[i] = createStar((int) random(width));
  }
}

void draw() {
  background(0);
  
  ArrayList<Integer> indexesToRemove = new ArrayList<>();
    
  for (int i = 0; i < stars.length; i++) {
    Star currentStar = stars[i];
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
   return createStar(width);
}

Star createStar(int x) {
  int y = (int) random(height);
  float xSpeed = random(-2, -0.2); 
  return new Star(x, y, xSpeed, 0.0, (int) random(2, 7));
}
