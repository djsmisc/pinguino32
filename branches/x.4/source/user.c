










u32 i=0;
 
void setup()
{
    ILI9325_init();






}

void loop()
{

    ILI9325_printf("i=%u \r\n", i++);



    Delayms(500);
}


