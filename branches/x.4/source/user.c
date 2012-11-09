






































void setup() {
  
  
  
  _lcd_pins(0, 1, 2, 3, 4, 5, 0, 0, 0, 0); 
	
  
  _lcd_begin(16, 2);
  
  _lcd_print("Hello, World!");
}

void loop() {
  
  
  _lcd_setCursor(0, 1);
  
  _lcd_printf("Uptime: %ds", millis()/1000);
  
  Delayms(100);
}



