u16 value=0;

void setup()
{
serial1init(9600);
}

void loop()
{
serial1printf("DEBUT");
value=analogRead(13);
serial1printf("TEST %d",value);
while(1);
}

