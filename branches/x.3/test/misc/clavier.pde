#define ESC					27
#define DEL					51
#define HAUT				65
#define BAS					66
#define DROITE				67
#define GAUCHE				68
#define UNDERSCORE		95
#define MAX_STRINGLEN	40

void setup()
{
}

void loop()
{
	u8 numBytesRead;
	u8 n, t=0, i=0, eol=0; // end of line
	char mk, ek, tk;
	char chaine[MAX_STRINGLEN]; // static so full with 0
	char buffer[64]; // always get a full packet
	
	for (n=0; n<MAX_STRINGLEN; n++)
	 chaine[n]='\0';

	CDC.printf("ready.\r\n");
	do {
		// wait for a key pressed
		do {
			tk = chaine[i];
			t = bounds(t+1, 0, 50000);
			numBytesRead = CDC.read(buffer);
			if (t==0 && chaine[i] != UNDERSCORE)
				chaine[i] = UNDERSCORE;
			else
				chaine[i] = tk;
			CDC.printf("%d - %s\n", i, chaine);
		} while (!numBytesRead);
		chaine[i] = tk;
		mk = buffer[0]; // main keystroke
		ek = buffer[1]; // extended keystroke
		//CDC.printf("mc=%d, ec=%d\r\n", mc, ec);
		if (mk==ESC || mk==91) // touches directionnelles
		{
			switch (ek)
			{
				case HAUT:
					// rappel anciennes commandes
				case BAS:
					// rappel anciennes commandes
				case DEL:
					i = bounds(i-1, 0, eol);
					// reculer toute la chaine
					break;
				case DROITE:
					i = bounds(i+1, 0, eol);
					break;
				case GAUCHE:
					i = bounds(i-1, 0, eol);
					break;
			}
		}
		else
		{
			chaine[i] = mk;
			CDC.printf("%d - %s\r", i, chaine);
			i = bounds(i+1, 0, MAX_STRINGLEN);
			if (i > eol) eol = i;
			chaine[i] = '\0';
		}
	} while (mk != '\r');		// until RETURN is hit
	CDC.printf("\r\n");

	chaine[i-1]   = '\n';
	chaine[i] = '\0';
}
