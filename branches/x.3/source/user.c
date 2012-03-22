

void setup() {
   pinmode(GREENLED, OUTPUT);     
   serial1init(9600);
    }

void loop() {
    int sensorValue = analogRead(AnaIn);
    serial1print("Hello \r\n");
    SerialPrintf("SensorValue= %d \r\n", sensorValue);
    toggle(GREENLED);            
    Delayms(1000);
    }

