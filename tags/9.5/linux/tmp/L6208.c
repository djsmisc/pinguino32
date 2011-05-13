// driving L6208 card with Pinguino
// Jean-Pierre Mandon 2010

#define ENABLE 0
#define DECAY 1
#define CLOCK 2
#define CCW 3
#define HALF 4

unsigned int i;

void linear_acc(unsigned int nbstep)		// one step is 100 µS
// the goal is to achieve a 1000 RPM
{
unsigned int final_time_step,starting_time_step;

final_time_step=450;		// 150 µS * 400 = 1 root
starting_time_step=450+(nbstep*20);
for (i=starting_time_step;i>450;i-=20)
	{
	digitalWrite(CLOCK,1);
	delayMicroseconds(i-100);
	digitalWrite(CLOCK,0);
	delayMicroseconds(100);
	}
}

void setup()
{
for (i=0;i<4;i++)
	{
	pinMode(i,OUTPUT);
	digitalWrite(i,LOW);
	}
digitalWrite(ENABLE,HIGH);		// Enable power driver
digitalWrite(HALF,1);
}

void loop()
{
for (i=0;i<2000;i++)
	{
	digitalWrite(CLOCK,1);
	delay(2);
	digitalWrite(CLOCK,0);
	delay(2);
	}
		
digitalWrite(ENABLE,LOW);
while(1);
}

