/*
 * This applications shows how to read and calculate PIC32 clock settings
 */

u32 cpuFrequency;
u32 peripheralFrequency;

void setup() {                
  pinMode(13, OUTPUT);     
  pinMode(30, OUTPUT);     

  Serial2.begin(115200);
  Serial2.printf("UART2: Hello\n");
}

void loop() {
  digitalWrite(13, HIGH);
  digitalWrite(30, HIGH);   
  
  // Show current settings
  
  cpuFrequency = System.getSystemFrequency();
  Serial2.printf("\nCPU       : %d MHz\n", cpuFrequency / 1000 / 1000);

  peripheralFrequency = System.getPeripheralClock();
  Serial2.printf("Peripheral: %d MHz\n", peripheralFrequency / 1000 / 1000);
  
  // Show current register settings 
  
  SystemClocksSettings s;

  System.clocksReadSettings(&s);
  Serial2.printf("Clock settings: PLLIDIV %d, PLLODIV %d, PLLMULT %d, PBDIV %d\n", s.PLLIDIV, s.PLLODIV, s.PLLMULT, s.PBDIV);

  // Example calculation
  
  System.ClocksCalcCpuClockSettings(&s, 40000000ul);
  System.ClocksCalcPeripheralClockSettings(&s, 20000000ul);
  Serial2.printf("\nExample calculation for 40 MHz/20 MHz:\n");
  Serial2.printf("  => Clock settings: PLLIDIV %d, PLLODIV %d, PLLMULT %d, PBDIV %d\n", s.PLLIDIV, s.PLLODIV, s.PLLMULT, s.PBDIV);

  cpuFrequency = System.getCpuFrequency(&s);
  Serial2.printf("    => CPU       : %d MHz\n", cpuFrequency / 1000 / 1000);

  peripheralFrequency = System.getPeripheralFrequency(&s);
  Serial2.printf("    => Peripheral: %d MHz\n", peripheralFrequency / 1000 / 1000);
  
  //
  
  delay(500);

  //

  digitalWrite(13, LOW);
  digitalWrite(30, LOW);
  delay(500);
}
