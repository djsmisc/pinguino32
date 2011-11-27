//Mini robot by MaG 25/10/2011
// +-----+
// |servo|--------- PWM Servo control ---> to pinguino pin.
// | |--------- +5V
// | o |--------- GND
// | | 
// +-----+

int led;

void setup(void)
{
	servo.attach(12);
	servo.attach(11);
	led=7;
	pinMode(led,OUTPUT);
}

void loop()
{
	servo.write(12,180); // Moteur droit !!!!!! ==> trajectoire rectiligne 12>180 & 11>70.
	servo.write(11,70); // Moteur gauche !!!!!! ==> Fixe à 125 pile.
	delay(2000);

	servo.write(12,70); 
	servo.write(11,180);
	delay(2000);

	servo.write(12,180);
	servo.write(11,180);
	delay(2000);

	servo.write(12,70); 
	servo.write(11,70);	
	delay(3000);

	servo.write(12,125); // avec un delay, permet d'arreter servo le temps voulu.
	servo.write(11,125);

	digitalWrite(led,HIGH); // led high
	delay(4000); // wait 5 seconds
	digitalWrite(led,LOW);

	servo.write(12,180);
	servo.write(11,180);
	delay(800);
}