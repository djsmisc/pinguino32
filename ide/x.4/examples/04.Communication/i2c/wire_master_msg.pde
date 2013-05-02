#define TR7 TRISBbits.TRISB7
#define LA7 LATBbits.LATB7
#define TR6 TRISBbits.TRISB6
#define LA6 LATBbits.LATB6

u8 I2C_address=0x2C; //A2 write A3 read (8bits address-R/W bit included)

u8 Line[128];  /* Serial Console input buffer */
static void get_line (u8 *buff, u8 len)
{
	u8 c, i;

	i = 0;
	for (;;) {
		c = Serial.getKey();
		if (c == '\r') break;
		if ((c == '\b') && i) i--;
		if ((c >= ' ') && (i < len - 1))
				{
         buff[i++] = c;
         Serial.printf("%c",c);
       }
	}
	buff[i] = 0;
	Serial.printf("\r\n");
}

void setup()
{
u8 c;
TR7=0;
LA7=0;
TR6=0;
LA6=0;

  Wire.begin(0);
  Serial.begin(9600);
}
void loop()
{
  u8 *ptr;
  u8 c;
// entering commands
  Serial.printf("\r\n>");
  get_line(Line, sizeof(Line));
  ptr = Line;
  delay(100);
  switch (*ptr++)
  {
    case 'v' :

//version request
  Wire.beginTransmission(I2C_address);
	Wire.write(0x80);
	Wire.endTransmission(1);
   delay(100);
 	Wire.requestFrom(I2C_address,2); //
  Serial.printf("<");
	while(Wire.available())    // slave may send less than requested
    { 
      c = Wire.read(); // receive a byte as character
      Serial.printf("%2X",c);         // print the character
    }
  break;
  
    case 'l' : // led on request
    {
       c = *ptr;
       Wire.beginTransmission(I2C_address);
	     Wire.write(0x90);
       Wire.write(c);
      	Wire.endTransmission(1);
      break;
    }
    case 's' :
// led on status

	Wire.beginTransmission(I2C_address);
	Wire.write(0x90);
 	Wire.endTransmission(1);
  delay(100);
	Wire.requestFrom(I2C_address,1);
	while(Wire.available())    // slave may send less than requested
    { 
      c = Wire.read(); // receive a byte as character
      Serial.printf("<%2X",c);         // print the character
    }
    break;
    case 'e' : // echo request
       c=*ptr;
	Wire.beginTransmission(I2C_address);
	Wire.write(c);
 	Wire.endTransmission(1);
  delay(100);
	Wire.requestFrom(I2C_address,1);
	while(Wire.available())    // slave may send less than requested
    { 
      c = Wire.read(); // receive a byte as character
      Serial.printf("<%c",c);         // print the character
    }
    break;
   } 

}
