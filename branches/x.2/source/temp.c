//
//


void setup()
{
pinmode(13,OUTPUT);
digitalwrite(13,LOW);
ADBInit();
if (_ADBOpen()) digitalwrite(13,1);;
}

void loop()
{
ADBTasks();
}


