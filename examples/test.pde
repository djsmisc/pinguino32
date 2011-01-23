#define pic18f4550

unsigned int a=0;
unsigned int b=0;

void setup() {}

void loop() {

a=a+1;
b=a/255; //this causes the system to arrest and re-boot after some cycles

delay(50);

PORTAbits.RA4 =! PORTAbits.RA4; //flash power led to verify it is working
}