float phi = 0;
float phid = PI/200;
float tau = PI/2;
float taud = PI/400;
float tau_max = tau + (taud * 100);
float tau_min = tau - (taud * 100);
boolean taudir = true;

void setup()
{
  size(300,300);
  background(64,64,64);
  smooth();
}

void draw()
{
  background(64,64,64);
  stroke(255);
  arc(width/2, height/2, 140, 140, phi-(tau/2), phi + (tau/2));  
  phi += phid;
  
  if(taudir)
  {
    tau += taud;
    if(tau >= tau_max)
     taudir = !taudir; 
  }
  else
  {
    tau -= taud;
    if(tau <= tau_min)
     taudir = !taudir;
  }
}
