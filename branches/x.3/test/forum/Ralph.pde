int LED_I = 0;      // orange
int LED_Z = 13;     // green
int LED_RD = 3;    // red
int LED_GR = 4;    // green
int BUT = 2;      // button

int    value[6];
int inputs[6];

/*
    To use, run:
    minicom -D /dev/ttyACM0
*/

void setup() {
    pinMode(LED_I, OUTPUT);
    pinMode(LED_Z, OUTPUT);
    pinMode(LED_RD, OUTPUT);
    pinMode(LED_GR, OUTPUT);
    
    pinMode(BUT, INPUT);
    
    pinMode(A0, INPUT);
    pinMode(A1, INPUT);
    pinMode(A2, INPUT); 
    pinMode(A3, INPUT);
    pinMode(A4, INPUT);
    pinMode(A5, INPUT);
    
    inputs[0] = A0;
    inputs[1] = A1;
    inputs[2] = A2;
    inputs[3] = A3;
    inputs[4] = A4;
    inputs[5] = A5;
}

loop() {

    digitalWrite(LED_RD, HIGH);
    digitalWrite(LED_GR, HIGH);
    delay(300);
    digitalWrite(LED_RD, LOW);
    digitalWrite(LED_GR, LOW);
    delay(100);
    digitalWrite(LED_GR, HIGH);

    // wait for RETURN key to start
    CDC.println("Press RETURN to start.");
    while (CDC.getKey() != '\r');
//    CDC.println(" ");
        
    digitalWrite(LED_GR, LOW);
    digitalWrite(LED_RD, HIGH);
    
    while (digitalRead(BUT)) {
        int i;
        for (i = 0; i < 6; i++) {
            value[i] = analogRead(inputs[i]);
        }

        CDC.println("%d %d %d %d %d %d", value[0], value[1], value[2], value[3], value[4], value[5]);
        delay(10);
    }
    digitalWrite(LED_RD, LOW);
}