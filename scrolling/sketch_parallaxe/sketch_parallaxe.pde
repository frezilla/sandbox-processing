Cello[] cellos;

class Cello {
  PGraphics g;
  PImage image;
  float xPos;
  float xSpeed;
  
  Cello(String imagePath, float xSpeed) {
    this.image = loadImage(imagePath);
    this.g = createGraphics(1280, 480, P3D); 
    this.xSpeed = xSpeed;
    this.g.beginDraw();
    this.g.image(image, 0, 0);
    this.g.image(image, 640, 0);
    this.g.endDraw();
  }
  
  void update() {
    xPos = xPos - xSpeed;
    if (xPos < -640) {
      xPos = 0;
    }
    image(this.g, xPos, 0);
  }
}

void setup() {
  size(640, 480, P3D);
  frameRate(60);
  cellos = new Cello[3];
  cellos[0] = new Cello("Sky_back_layer.png", 0.25);
  cellos[1] = new Cello("Vegetation_middle_layer.png", 1.0);
  cellos[2] = new Cello("Ground_front_layer.png", 5);
}

void draw() {
  cellos[0].update();
  cellos[1].update();
  cellos[2].update();
}
