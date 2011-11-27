// pinguino print numbers example
// Jean-Pierre Mandon 2010
// pinguino printf numbers example
// Régis Blanchot 2011

int number;

void setup()
{
}

void loop()
{
	number=3200;
	// Arduino or Pinguino
	CDC.print("Decimal 3200=");
	CDC.print(number, DEC);
	CDC.print("\n\r");
	// Only Pinguino
	CDC.printf("Decimal 3200=%d\n\r", number);

	number=253;
	// Arduino or Pinguino
	CDC.print("Hexadecimal 253=");
	CDC.print(number, HEX);
	CDC.print("\n\r");
	// Only Pinguino
	CDC.printf("Hexadecimal 253=%x\n\r", number);

	number=156;
	// Arduino or Pinguino
	CDC.print("Binary 156=");
	CDC.print(number, BIN);
	CDC.print("\n\r");
	// Only Pinguino
	CDC.printf("Binary 156=%b\n\r", number);

	number=236;
	// Arduino or Pinguino
	CDC.print("Octal 236=");
	CDC.print(number, OCT);
	CDC.print("\n\r");
	// Only Pinguino
	CDC.printf("Octal 236=%o\n\r", number);

	number=65;
	// Arduino or Pinguino
	CDC.print("Byte 65=");
	CDC.print(number, BYTE);
	CDC.print("\n\r");
	// Only Pinguino
	CDC.printf("Byte 65=%d\n\r", number);
}
