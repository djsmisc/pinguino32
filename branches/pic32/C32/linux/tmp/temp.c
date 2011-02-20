//
//

void setup()
{
analogwrite(72,512);
serial1init(9600);
serial1printf("OC1RS= %04X",OC1RS);
}

void loop()
{
}

