#include <MeggyJrSimple.h>     //Required code line 1 of 2

void setup(){
  MeggyJrSimpleSetup();        //Required code line 2 of 2
}

int dotX = 2;
int dotY = 2;
int goalX = random(8);
int goalY = random(8);
int wallX = random(7);
int wallY = random(7);
int score = 0;

void loop(){
  DrawPx(dotX, dotY, 1);      //allows controls to move dot
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
  delay(50);
  ClearSlate();

  DrawPx(goalX, goalY, 5);                  //Draws blue dot
  DrawWall();
  DisplaySlate();
  
  
  if (dotX == goalX && dotY == goalY){      //When red dot touches blue dot, the blue dot and wall are reset
   Tone_Start(ToneC3, 100);
   score ++;
   ClearSlate();
   delay(100);
   do{
     goalX = random(8);
     wallX = random(7);
   }
   while (dotX == goalX && dotX == wallX && wallX == goalX);
  do {
    goalY = random(8);
    wallY = random(7);
  }
   while (dotY == goalY && dotY == wallY && wallY == goalY);
  
   DrawPx(goalX, goalY, 5); 
  }

  if (ReadPx(dotX,dotY) == 4){          //sets dot back to (0,0) if it touches the wall
    dotX = 0;
    dotY = 0;
  
  if (score == 1)
    SetAuxLEDs(1);
  if (score == 2)
    SetAuxLEDs(4);
  if (score == 3)
    SetAuxLEDs(8);
  if (score == 4)
    SetAuxLEDs(15);
  if (score == 5)
    SetAuxLEDs(31);
  if (score == 6)
    SetAuxLEDs(63);
  if (score == 7)
    SetAuxLEDs(127);
  if (score == 8)
    SetAuxLEDs(254);
  if (score == 9){
    SetAuxLEDs(0);
    score = 0;
    ClearSlate();
    delay(200);
  }
} 
  
}             //ends loop
  
  
void DrawWall(){                    //wall drawing
  DrawPx(wallX, wallY, 4);  
  DrawPx(wallX+1, wallY, 4);
  DrawPx(wallX+2, wallY, 4);
  DrawPx(wallX+3, wallY, 4);
  DrawPx(wallX, wallY+1, 4);
}

