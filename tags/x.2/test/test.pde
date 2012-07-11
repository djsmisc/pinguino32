void setup()
{
}

void loop()
{
	CDC.printf("cpuCoreFrequency\t= %d \r\n", Sys.getClock());
	CDC.printf("peripheralFrequency\t= %d \r\n", Sys.getPeripheralClock());
	CDC.printf("OSCCONbits.PBDIV\t= %d \r\n", OSCCONbits.PBDIV);
	CDC.printf("DEVCFG1bits.FPBDIV\t= %d \r\n", DEVCFG1bits.FPBDIV);
}
