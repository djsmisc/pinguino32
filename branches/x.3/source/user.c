




byte string[10]={0,0,'A','B','C','D','E','F','G','H'};	


byte I2C_address=0x51;						
byte address_to_read[2]={0,0};
int i;

void setup()
{
init_I2C();
serial1init(9600);
for (i=0;i<8;i++) i2c_buffer[i]=0;
}

void loop()
{
serial1print("try to write 8 char to eeprom\n\r");
i=I2C_write(I2C_address,string,10);
I2C_STOP();
if (i==1)
	{
	serial1print("write OK, hit a key to read\n\r");
	serial1flush();
	while (!serial1available());
	}
else 
	{
	serial1print("Error while writing to eeprom, reset\n\r");
	serial1print(i);
	while(1);
	}
serial1print("try to read 8 bytes to eeprom\n\r");
I2C_write(I2C_address,address_to_read,2);
i=I2C_read(I2C_address,8);
if  (i==1)
	serial1print("received 8 bytes from eeprom\n\r");
for (i=0;i<8;i++) serial1print(i2c_buffer[i]);
serial1print("\n\r");
Delayms(50);
}	





