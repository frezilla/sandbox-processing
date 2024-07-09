Cello[] cellos;

class Cello {
  PGraphics g;
  PImage image;
  float xPos;
  float xSpeed;
  
  Cello(String imagePath, float xSpeed) {
    this.image = loadImage(imagePath);
    this.g = createGraphics(1152, 324, P3D); 
    this.xSpeed = xSpeed;
    this.g.beginDraw();
    this.g.image(image, 0, 0);
    this.g.image(image, 576, 0);
    this.g.endDraw();
  }
  
  void update() {
    xPos = xPos - xSpeed;
    if (xPos < -576) {
      xPos = 0;
    }
    image(this.g, xPos, 0);
  }
}

void setup() {
  size(576, 324, P3D);
  frameRate(120);
  cellos = new Cello[6];
  cellos[0] = new Cello("01.png", 0.0);
  cellos[1] = new Cello("02.png", 0.15);
  cellos[2] = new Cello("03.png", 0.25);
  cellos[3] = new Cello("04.png", 0.50);
  cellos[4] = new Cello("05.png", 0.75);
  cellos[5] = new Cello("06.png", 1.00);
}

void draw() {
  cellos[0].update();
  cellos[1].update();
  cellos[2].update();
  cellos[3].update();
  cellos[4].update();
  cellos[5].update();
}
