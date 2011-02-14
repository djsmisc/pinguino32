//
//

int i;
int caractere;

void setup()
{
for (i=0;i<8;i++) 	{
				pinmode(i,OUTPUT);
				digitalwrite(i,LOW);
				}
serial1init(9600);
}

void loop()
{
if (serial1available())
	{
	digitalwrite(0,HIGH);
	caractere=serial1read();
	serial1printf("test");
	if (caractere=='A') digitalwrite(1,digitalread(1)^1);
	}
}


