/*
 * This applications shows how to read and calculate PIC32 clock settings
 */

u32 cpuFrequency;
u32 peripheralFrequency;

void setup() {                
  pinMode(13, OUTPUT);     
  pinMode(30, OUTPUT);     

  Serial.Configure(UART2, UART_ENABLE, UART_RX_TX_ENABLED, 115200);
  Serial.Printf(UART2, "UART2: Hello\n");
}

void loop() {
  digitalWrite(13, HIGH);
  digitalWrite(30, HIGH);   
  
  // Show current settings
  
  cpuFrequency = GetSystemClock();
  Serial.Printf(UART2, "\nCPU       : %d MHz\n", cpuFrequency / 1000 / 1000);

  peripheralFrequency = GetPeripheralClock();
  Serial.Printf(UART2, "Peripheral: %d MHz\n", peripheralFrequency / 1000 / 1000);
  
  // Show current register settings 
  
  SystemClocksSettings s;
  SystemClocksReadSettings(&s);
  Serial.Printf(UART2, "Clock settings: PLLIDIV %d, PLLODIV %d, PLLMULT %d, PBDIV %d\n", s.PLLIDIV, s.PLLODIV, s.PLLMULT, s.PBDIV);

  // Example calculation
  
  SystemClocksCalcCpuClockSettings(&s, 40000000ul);
  SystemClocksCalcPeripheralClockSettings(&s, 20000000ul);
  Serial.Printf(UART2, "\nExample calculation for 40 MHz/20 MHz:\n");
  Serial.Printf(UART2, "  => Clock settings: PLLIDIV %d, PLLODIV %d, PLLMULT %d, PBDIV %d\n", s.PLLIDIV, s.PLLODIV, s.PLLMULT, s.PBDIV);

  cpuFrequency = SystemClocksGetCpuFrequency(&s);
  Serial.Printf(UART2, "    => CPU       : %d MHz\n", cpuFrequency / 1000 / 1000);

  peripheralFrequency = SystemClocksGetPeripheralFrequency(&s);
  Serial.Printf(UART2, "    => Peripheral: %d MHz\n", peripheralFrequency / 1000 / 1000);
  
  //
  
  delay(500);

  //

  digitalWrite(13, LOW);
  digitalWrite(30, LOW);
  delay(500);
}
