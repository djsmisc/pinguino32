// Serial.printf and sprintf Demo
// Régis Blanchot 2010

char *string = "Hello world!";

void setup()
{
	Serial2.begin(115200);
}

void loop()
{
	Serial2.printf("%s\r\n", string);
}
