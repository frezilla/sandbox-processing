BlockFont blockFont;
PGraphics g;

class BlockFont {
  
  final PImage img = loadImage("font.png");  
  final int nbTilesHeight = 4;
  final int nbTilesWidth = 32;
  final int tileHeightPx = 32;
  final int tileWidthPx = 18;
  
  PImage getPart(int x, int y) {
    int xInit = x * tileWidthPx;
    int yInit = y * tileHeightPx;
    PImage returnImage = img.get(xInit, yInit, tileWidthPx, tileHeightPx);
    return returnImage; //<>//
  }
  
}

void setup() {
  size(640, 480, P3D);
  frameRate(120);
  blockFont = new BlockFont();
}

void draw() {
  background(0);
  image(blockFont.getPart(5, 1), 0, 100);
}
