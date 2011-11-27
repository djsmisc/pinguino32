
int level[2];
int length = 0;

uchar* intToChar(int);

void setup()
{
        level[0] = 10;
        level[1] = 200;
}

void loop()
{
    USB.send("hello",5);
    USB.send(intToChar(level[0]), length);
    USB.send(intToChar(level[1]), length);
    intToChar(level[0]);
    intToChar(level[1]);
    delay(2000);
}

uchar* intToChar(int val) {
    uchar chars[5] = {0};
    int i = 0;
    float temp[2] = {0};    
    
    if((val/10000) >= 1) length = 5;
    else if((val/1000) >= 1) length = 4;
    else if((val/100) >= 1) length = 3;
    else if((val/10) >= 1) length = 2;
    else length = 1;
    
    for(i = length; i > 0; i--) {
        temp[0] = pow(10, i);
        temp[1] = pow(10, i-1);
        chars[length - i] = 48 + ( (val%((int)temp[0]))/((int)temp[1]) );
    }
   
    return chars;
}
