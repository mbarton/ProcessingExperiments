int[] alphas = {128,128,128,128,128};
boolean[] alphad = {true,false,true,false,true};
float[] ballX = new float[5];
float[] ballY = new float[5];

void setup()
{
 size(400,400);
 stroke(255);
 smooth();
 background(64,64,64); 
 
 for(int i = 0; i < ballX.length; i++)
 {
    ballX[i] = random(0, width);
    ballY[i] = random(0, height); 
 }
}

void draw()
{
  for(int i = 0; i < ballX.length; i++)
  {
     stroke(255,255,255,alphas[i]);
     ellipse(ballX[i], ballY[i], 50,50); 
     
     System.out.println(alphas[i]);
     if(alphad[i])
     {
         if(alphas[i] <= 0)
         {
             alphad[i] = !alphad[i];
         }
         alphas[i] -= 1;
     }
     else
     {
        if(alphas[i] >= 255)
        {
           alphad[i] = !alphad[i]; 
        }
        alphas[i] += 1; 
     }
  }
}
