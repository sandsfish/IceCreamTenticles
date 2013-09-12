import de.looksgood.ani.*;

int rectSize = 50;
int originalRectSize = rectSize;
int maxRectSize = 100;
int noiseScale = 20;

void setup()
{
  size(700, 394, OPENGL);
  Ani.init(this);
}

void draw()
{
  translate(noise(frameCount, frameCount) * noiseScale, noise(frameCount, frameCount) * noiseScale);
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
  Ani.to(this, .5, "rectSize", maxRectSize);
  Ani.to(this, .5, "rectSize", originalRectSize);
}

void changeSomething(float x, float y)
{
  println(x + ", " + y);
}
