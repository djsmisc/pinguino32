int compteur;		
int i;				

void setup(void)
{
   for (i=0;i<8;i++) 
	{
	pinmode(i,OUTPUT);		
	digitalwrite(i,LOW);			
	}
}



void loop(void)
{
for (compteur=0;compteur<8;compteur++)		
	{
	digitalwrite(compteur,HIGH);				
	if (compteur==0) digitalwrite(7,LOW);		
	else digitalwrite(compteur-1,LOW);			
	Delayms(500);							
	}
}

