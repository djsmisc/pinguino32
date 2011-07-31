//
//
//
//

int i;
int caractere,caractere1,caractere2;

void setup()
{
//
for (i=0;i<8;i++) 	{
				pinmode(i,OUTPUT);
				digitalwrite(i,LOW);
				}
//
serial1init(9600);
}

void loop()
{
//
if (serial1available())
	{
//
	caractere=serial1read();
	if (caractere=='W')
		{
//
		Delayms(3);
//
		if (serial1available()) caractere1=serial1read();
		else 	{
//
				serial1flush();
//
				goto end;
				}
		Delayms(3);
		if (serial1available()) caractere2=serial1read();
		else  	{
				serial1flush();
				goto end;
				}
//
		if ((caractere1>=0x30)&&(caractere2>=0x30))
			{
			caractere1-=0x30; 
			caractere2-=0x30;		
			}
		else goto end;
//
		digitalwrite(caractere1,caractere2);
//
		serial1print("bonjour\n\r");
		end:
		
		}
	}
}
