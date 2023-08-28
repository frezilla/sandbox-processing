int[][] fire;
int currentStep;
int nbSteps;
color[] palette;
PGraphics fireG;

void setup() {
  size(320, 200, P2D);
  frameRate(60);
  
  fire = new int[height][width];
  
  currentStep = 0;
  nbSteps = 0;
  
  colorMode(HSB, 255, 255, 255);
  palette = new color[256];
  for (int i = 0; i < 256; i++) {
    color c = color((i/3), 255, Math.min(255, i*2));
    palette[i] = c;
  }
  
  fireG = createGraphics(320, 200, P2D);
}

void draw() {
  drawFire();
  image(fireG, 0, 0);
}

void drawFire() {
  fireG.beginDraw();
  //fireG.background(0);
  if (currentStep == nbSteps) {
    currentStep = 0;
    nbSteps = (int) random(5);
  
    for (int x = 0; x < width; x++) {
      fire[height-1][x] = (int) (random(32768) % 256);
    }
  } else {
    currentStep++;
  }
  
  for (int y = 0; y < height - 1; y++) {
    for (int x = 0; x < width; x++) {
      fire[y][x] = ((
        fire[(y + 1) % height][(x - 1 + width) % width]
        + fire[(y + 2) % height][x % width]
        + fire[(y + 1) % height][(x + 1) % width]
        + fire[(y + 3) % height][x % width])
        * 64) / 257;
    }
  }
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      fireG.stroke(palette[fire[y][x]]);
      fireG.point(x, y);
    }
  }
  fireG.endDraw();
}
