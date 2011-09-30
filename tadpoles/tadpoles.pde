final int[] BG = {165,180,255};
final int POLE_VEL = 1;

final int N_POLES = 40;

final int NEW_POLE_DELAY = 20;
int new_pole_counter = 0;

ArrayList poles = new ArrayList();

final float DELTA_POLE_DRIFT = 1;
final float POLE_DRIFT_MAX = 10;

class Pole
{
   float[] pos = {0,0};
   float drift = 0;
   boolean drift_d = true; 
}

void add_pole()
{
    float[] pos = {0, random(0, height*2)};
    Pole pole = new Pole();
    pole.pos = pos;
    poles.add(pole); 
}

void cull_nonvisible_poles()
{
    for(int i = poles.size() - 1; i >= 0; i--)
    {
       float[] pole = ((Pole)poles.get(i)).pos;
       if(pole[0] > width + 60 || pole[1] < -60)
       {
          println("Merked pole");
          poles.remove(i); 
       }
    } 
}

void setup()
{
    size(500,500);
    smooth();
    
    add_pole();
}

void drift_pole(Pole p)
{
  if(p.drift_d)
  {
    p.drift += DELTA_POLE_DRIFT;
    if(p.drift >= POLE_DRIFT_MAX)
      p.drift_d = !p.drift_d;
  }
  else
  {
    p.drift -= DELTA_POLE_DRIFT;
    if(p.drift <= (-1 * POLE_DRIFT_MAX))
      p.drift_d = !p.drift_d;
  } 
}

void draw()
{
  background(BG[0], BG[1], BG[2]);
  noStroke();  
  
  cull_nonvisible_poles();

  stroke(255);
  
  for(int i = 0; i < poles.size(); i++)
  {
      Pole p = (Pole)poles.get(i);
      drift_pole(p);
    
      float[] ppos = p.pos;
      float x = ppos[0];
      float y = ppos[1];
      float pole_drift = p.drift;
      
      float[] bp_a = {x-20+pole_drift, y+20+pole_drift};
      float[] bp_b = {x-10+pole_drift, y+30+pole_drift};
      float[] bp_c = {x-40+pole_drift, y+60+pole_drift};
      
      noFill();
      beginShape();
        vertex(x,y);
        bezierVertex(bp_a[0], bp_a[1], bp_b[0], bp_b[1], bp_c[0], bp_c[1]);
      endShape();
      
      fill(255);
      ellipse(x, y, 10, 10);
      
      ppos[0] += POLE_VEL;
      ppos[1] -= POLE_VEL;
  }
  
  if(new_pole_counter >= NEW_POLE_DELAY && poles.size() < N_POLES)
  {
     add_pole();
     new_pole_counter = 0; 
  }
  else
  {
     new_pole_counter++; 
  }
}
