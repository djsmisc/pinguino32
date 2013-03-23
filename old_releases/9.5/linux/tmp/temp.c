//
//

char caractere;
char chaine[5]={'T','E','S','T',0};

void setup()
{
serial_begin(9600);
}

void loop()
{
serial_write("TEST\n\r");
if (serial_available()) {
					 serial_write("caractere");
					 caractere=serial_read();
					 serial_write(chaine);
					 serial_write(&caractere);
					 }
}

