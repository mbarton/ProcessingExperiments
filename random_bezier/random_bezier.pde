float[] a = {25,25};
float[] b = {100,25};
float[] c = {200,25};
int mod = 0;

void setup()
{
  background(64,64,64);
  size(400,400);
  smooth();
}

void draw()
{
  switch(mod)
  {
     case 0:
       a[0] = mouseX;
       a[1] = mouseY;
       break;
     case 1:
       b[0] = mouseX;
       b[1] = mouseY;
       break;
     case 2:
       c[0] = mouseX;
       c[1] = mouseY;
       break;
     default:
        // NO
       break; 
  }
 
  background(64,64,64);
  stroke(255);
  noFill();
  beginShape();
     vertex(50,75);
     bezierVertex(a[0],a[1],b[0],b[1],c[0],c[1]);
  endShape(); 
  
  fill(255);
  ellipse(a[0], a[1], 5, 5);
  ellipse(b[0], b[1], 5, 5);
  ellipse(c[0], c[1], 5, 5);
}

void mousePressed()
{
  mod = (mod + 1) % 3; 
}
