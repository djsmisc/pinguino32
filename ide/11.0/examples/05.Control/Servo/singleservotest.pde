// Servo library test with Pinguino
// Connect servo control lines to pinguino pins.
// Feed servos with +5 V:
//
//   +-----+
//   |servo|--------- PWM Servo control ---> to pinguino pin.
//   |     |--------- +5V
//   |  o  |--------- GND
//   |     | 
//   +-----+

u8 position,user_servo=0;

void setup(void)
{
    pinMode(USERLED, OUTPUT);    
    servo.attach(user_servo);
    servo.setMinimumPulse(user_servo,700);
    servo.setMaximumPulse(user_servo,2300);
}  

void loop(void)
{
    for (position=1; position<180; position++)
    {
        servo.write(user_servo,position);
        toggle(USERLED);
        delay(200);
    }
}
