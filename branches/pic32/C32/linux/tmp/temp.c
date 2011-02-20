/*
 * LCD routines for use with pinguino board, based on LiquidCrystal lib from Arduino project.
 * By Marcus Fazzi (Anunakin)
 * Pins, Schematics and more info: 
 * http://pinguino.koocotte.org/index.php/LCD_Example
 * http://anunakin.blogspot.com/2010/08/pinguino-clock.html
 */


#define LED 1
long counter;

void setup(){
//
//
	
//
	lcd(0, 2, 3, 4, 5, 6, 0, 0, 0, 0); // RS, E, D4 ~ D8	
	
//
	begin(4, 0);
	
	/* Debug */
	pinmode(LED, OUTPUT);		// LED on pin 13
	
}
 
void loop()
{
//
	home();
//
	lcdPrint("Pinguino32X");	// Output char
		
	Delayms(500);
	while(1){
	home();
	lcdPrint("Hello World!");
	
	setCursor(0, 1);
	printNumber(counter, 10);
	
	digitalwrite(LED,HIGH);
	Delayms(250);
	digitalwrite(LED,LOW);
	Delayms(250);
	counter++;
	}
}


