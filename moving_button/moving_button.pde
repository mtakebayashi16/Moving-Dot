#include <MeggyJrSimple.h>     //Required code line 1 of 2

void setup(){
  MeggyJrSimpleSetup();        //Required code line 2 of 2
}

int dotX = 2;
int dotY = 2;
int goalX = random(8);
int goalY = random(8);

void loop(){
  DrawPx(dotX, dotY, 1);
  CheckButtonsDown();
  if (Button_Up)
    dotY ++;
  if (Button_Down)
    dotY --;
  if (Button_Left)
    dotX --;
  if (Button_Right)
   dotX ++; 
  
  if (dotY > 7)         //keeps buttons on screen
    dotY = 7;
  if (dotY < 0)
    dotY = 0;
  if (dotX > 7)
    dotX = 7;
  if (dotX < 0) 
    dotX = 0;
  
  DisplaySlate();
  delay(100);
  ClearSlate();

  DrawPx(goalX, goalY, 5);
  DisplaySlate();
  
  if (dotX == goalX && dotY == goalY){
   Tone_Start(ToneC3, 100);
   ClearSlate();
   delay(100);
   do{
     goalX = random(8);
   }
   while (dotX == goalY);
  do {
    goalY = random(8);
  }
   while (dotY == goalY);
  
   DrawPx(goalX, goalY, 5); 
  }
  
}             //ends loop
  

