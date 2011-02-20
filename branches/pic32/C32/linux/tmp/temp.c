int compteur;		// definit une variable entiere pour le compteur
int i;				// variable servant a l'initialisation

void setup(void)
{
   for (i=0;i<8;i++) 
	{
	pinmode(i,OUTPUT);		// definit les broches 0 a 7 en sortie
	digitalwrite(i,LOW);			// fixe un niveau 0 sur les sorties
	}
}



void loop(void)
{
for (compteur=0;compteur<8;compteur++)		// pour compteur variant de 0 a 7
	{
	digitalwrite(compteur,HIGH);				// allume la led compteur
	if (compteur==0) digitalwrite(7,LOW);		// si led courante=0 eteindre la led 7
	else digitalwrite(compteur-1,LOW);			// sinon eteindre la led d'indice -1
	Delayms(500);							// attendre 500 milli-Secondes
	}
}

