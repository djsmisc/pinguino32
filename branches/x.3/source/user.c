

const int stepsPerRevolution = 48;	
int stepCount = 0;						

void setup()
{
	
	serial1init(9600);
	
	Stepper_init(stepsPerRevolution, 0,1,2,3);            
}

void loop()
{
	
	int sensorReading = analogRead(A0);
	
	int motorSpeed = map(sensorReading, 0, 1023, 0, 100);
	
	if (motorSpeed > 0)
	{
		Stepper_setSpeed(motorSpeed);
		
		Stepper_step(stepsPerRevolution/100);
	} 
}


