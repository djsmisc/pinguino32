// ITDB02_Graph_Demo (C)2010 Henning Karlsen
// web: http://www.henningkarlsen.com/electronics
//
// Pinguino32X(PIC32) port by Marcus Fazzi
// blog: http://vivaphp.net
//
//
// This program is a demo of how to use the library with the
// ITDB02-2.4 module.
//
// This program requires the ITDB02_Graph (8bit mode).
//
//

void setup()
{
  srand(234);
  // Setup the LCD
  TFT24.InitLCD(PORTRAIT);
}

int rnd(int num) {
	return (int)(rand()%num);
}

void loop()
{
  int buf[238];
  int x, x2;
  int y, y2;
  int r, i;

// Clear the screen and draw the frame
  TFT24.clrScr();

  TFT24.setColor(255, 0, 0);
  TFT24.fillRect(0, 0, 239, 13);
  TFT24.setColor(64, 64, 64);
  TFT24.fillRect(0, 306, 239, 319);
  TFT24.setColor(255, 255, 255);
  TFT24.setBackColor(255, 0, 0);
  TFT24.print("ITDB02 240x320 - Pinguino32X", CENTER, 1,0);
  //TFT24.setColor(255, 128, 128);
  TFT24.setColor(255,255,0);
  TFT24.setBackColor(64, 64, 64);
  TFT24.print("H.Karlsen/M.Fazzi", LEFT, 307,0);
  TFT24.print("(C)2011", RIGHT, 307,0);
  //TFT24.setColor(255,255,0);
  //TFT24.print("Pinguino", CENTER, 307,0);

  TFT24.setColor(0, 0, 255);
  TFT24.drawLine(0, 14, 239, 14);
  TFT24.drawLine(0, 14, 0, 305);
  TFT24.drawLine(239, 14, 239, 305);
  TFT24.drawLine(0, 305, 239, 305);

// Draw crosshairs
  TFT24.setColor(0, 0, 255);
  TFT24.setBackColor(0, 0, 0);
  TFT24.drawLine(119, 15, 119, 304);
  TFT24.drawLine(1, 159, 238, 159);
  for (i=9; i<240; i+=10)
    TFT24.drawLine(i, 157, i, 161);
  for (i=19; i<300; i+=10)
    TFT24.drawLine(117, i, 121, i);
  
// Draw sin-, cos- and tan-lines  
  TFT24.setColor(0,255,255);
  TFT24.print("Sin", 5, 15,0);
  for (i=1; i<238; i++)
  {
    TFT24.drawPixel(i,159+(sin(((i*1.51)*3.14)/180)*100));
  }
  
  TFT24.setColor(255,0,0);
  TFT24.print("Cos", 5, 27,0);
  for (i=1; i<238; i++)
  {
    TFT24.drawPixel(i,159+(cos(((i*1.51)*3.14)/180)*100));
  }

  TFT24.setColor(255,255,0);
  TFT24.print("Tan", 5, 39,0);
  for (i=1; i<238; i++)
  {
    TFT24.drawPixel(i,159+(tan(((i*1.51)*3.14)/180)));
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);
  TFT24.setColor(0, 0, 255);
  TFT24.setBackColor(0, 0, 0);
  TFT24.drawLine(119, 15, 119, 304);
  TFT24.drawLine(1, 159, 238, 159);

// Draw a moving sinewave
  x=1;
  for (i=1; i<6902; i++)
  {
    x++;
    if (x==239)
      x=1;
    if (i>239)
    {
      if ((x==119)||(buf[x-1]==159))
        TFT24.setColor(0,0,255);
      else
        TFT24.setColor(0,0,0);
      TFT24.drawPixel(x,buf[x-1]);
    }
    TFT24.setColor(0,255,255);
    y=159+(sin(((i*1.4)*3.14)/180)*(100-(i / 100)));
    TFT24.drawPixel(x,y);
    buf[x-1]=y;
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some filled rectangles
  for (i=1; i<6; i++)
  {
    switch (i)
    {
      case 1:
        TFT24.setColor(255,0,255);
        break;
      case 2:
        TFT24.setColor(255,0,0);
        break;
      case 3:
        TFT24.setColor(0,255,0);
        break;
      case 4:
        TFT24.setColor(0,0,255);
        break;
      case 5:
        TFT24.setColor(255,255,0);
        break;
    }
    TFT24.fillRect(30+(i*20), 70+(i*20), 90+(i*20), 130+(i*20));
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some filled, rounded rectangles
  for (i=1; i<6; i++)
  {
    switch (i)
    {
      case 1:
        TFT24.setColor(255,0,255);
        break;
      case 2:
        TFT24.setColor(255,0,0);
        break;
      case 3:
        TFT24.setColor(0,255,0);
        break;
      case 4:
        TFT24.setColor(0,0,255);
        break;
      case 5:
        TFT24.setColor(255,255,0);
        break;
    }
    TFT24.fillRoundRect(150-(i*20),70+(i*20), 210-(i*20), 130+(i*20));
  }
  
  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some filled circles
  for (i=1; i<6; i++)
  {
    switch (i)
    {
      case 1:
        TFT24.setColor(255,0,255);
        break;
      case 2:
        TFT24.setColor(255,0,0);
        break;
      case 3:
        TFT24.setColor(0,255,0);
        break;
      case 4:
        TFT24.setColor(0,0,255);
        break;
      case 5:
        TFT24.setColor(255,255,0);
        break;
    }
    TFT24.fillCircle(60+(i*20),100+(i*20), 30);
  }
  
  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some lines in a pattern
  TFT24.setColor (255,0,0);
  for (i=15; i<304; i+=5)
  {
    TFT24.drawLine(1, i, (i/1.22)-10, 304);
  }
  TFT24.setColor (255,0,0);
  for (i=304; i>15; i-=5)
  {
    TFT24.drawLine(238, i, (i/1.22)-11, 15);
  }
  TFT24.setColor (0,255,255);
  for (i=304; i>15; i-=5)
  {
    TFT24.drawLine(1, i, 251-(i/1.22), 15);
  }
  TFT24.setColor (0,255,255);
  for (i=15; i<304; i+=5)
  {
    TFT24.drawLine(238, i, 250-(i/1.22), 304);
  }
  
  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some rand circles
  for (i=0; i<100; i++)
  {
    TFT24.setColor(rnd(255), rnd(255), rnd(255));
    x=32+rnd(175);
    y=45+rnd(212);
    r=rnd(30);
    TFT24.drawCircle(x, y, r);
  }

  delay(2000);

  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some rand rectangles
  for (i=0; i<100; i++)
  {
    TFT24.setColor(rnd(255), rnd(255), rnd(255));
    x=2+rnd(236);
    y=16+rnd(287);
    x2=2+rnd(236);
    y2=16+rnd(287);
    TFT24.drawRect(x, y, x2, y2);
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

// Draw some rand rounded rectangles
  for (i=0; i<100; i++)
  {
    TFT24.setColor(rnd(255), rnd(255), rnd(255));
    x=2+rnd(236);
    y=16+rnd(287);
    x2=2+rnd(236);
    y2=16+rnd(287);
    TFT24.drawRoundRect(x, y, x2, y2);
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(2,16,238,304);

  for (i=0; i<100; i++)
  {
    TFT24.setColor(rnd(255), rnd(255), rnd(255));
    x=2+rnd(236);
    y=16+rnd(289);
    x2=2+rnd(236);
    y2=16+rnd(289);
    TFT24.drawLine(x, y, x2, y2);
  }

  delay(2000);
  
  TFT24.setColor(0,0,0);
  TFT24.fillRect(1,15,238,304);

  for (i=0; i<10000; i++)
  {
    TFT24.setColor(rnd(255), rnd(255), rnd(255));
    TFT24.drawPixel(2+rnd(236), 16+rnd(289));
  }

  delay(2000);

  TFT24.fillScr(0, 0, 255);
  TFT24.setColor(255, 0, 0);
  TFT24.fillRoundRect(30, 100, 209, 219);
  
  TFT24.setColor(255, 255, 255);
  TFT24.setBackColor(255, 0, 0);
  TFT24.print("That's it!", CENTER, 133,0);
  TFT24.print("Restarting in a", CENTER, 159,0);
  TFT24.print("few seconds...", CENTER, 172,0);
  
  TFT24.setColor(0, 0, 0);
  TFT24.setBackColor(0, 0, 255);
  TFT24.print("Runtime: (msecs)", CENTER, 290,0);
  TFT24.printNumI(millis(), CENTER, 305);
  
  delay (10000);
}

