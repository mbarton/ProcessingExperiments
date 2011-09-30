int _alpha = 0;
boolean alphad = false;
final int DELTA_ALPHA = 5;

void setup()
{
   background(64,64,64);  
   size(400,400); 
}

void draw()
{
  background(64,64,64);
  
  if(alphad)
   {
     //fill(255,0,0);
     _alpha += DELTA_ALPHA;
     if(_alpha >= 255)
       alphad = !alphad;  
   }
   else
   {
     //fill(0,255,0);
     _alpha -= DELTA_ALPHA;
     if(_alpha <= 0)
       alphad = !alphad;
   }   
  
   println(_alpha);
  
   stroke(64,64,64);
   fill(128,128,128, _alpha);
   rect(width/2-70, height/2-70, 140,140); 
}
