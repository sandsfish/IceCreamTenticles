import de.looksgood.ani.*;

int rectSize = 50;
int originalRectSize = rectSize;
int maxRectSize = 100;
int currentSize = 50;
int noiseScale = 20;
float offsetX, offsetY;

void setup()
{
  size(700, 394, OPENGL);
  Ani.init(this);
  offsetX = 0;
  offsetY = 0;
}

void draw()
{
  translate(noise(frameCount, frameCount) * noiseScale + offsetX, noise(frameCount, frameCount) * noiseScale + offsetY);
  pushMatrix();
     rotate(radians(frameCount % 360));
     rect(0, 0, rectSize, rectSize);
  popMatrix();
}

void keyPressed()
{
  doSomething();
}

void mouseMoved()
{
  changeSomething(PApplet.map(mouseX, 0, width, 0, 1), PApplet.map(mouseY, 0, height, 0, 1));
}

void doSomething()
{
  println("do something");
  currentSize = (maxRectSize == currentSize) ? originalRectSize : maxRectSize;
  Ani.to(this, 2.0, "rectSize", currentSize);
  // Ani.to(this, .5, "rectSize", originalRectSize);
}

void changeSomething(float x, float y)
{
  println(x + ", " + y);
  offsetX = width - (x * width);
  offsetY = height - (y * height);
}
