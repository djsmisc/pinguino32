#ifdef __cplusplus
extern "C" {
#endif
void USBCheckCDCRequest();
void CDCInitEP();
void USBDeviceInit();		
void USBDeviceAttach();
void putUSBUSART(char *data, u8 Length);
void CDCTxService(void);
u8 getsUSBUSART(char *buffer, u8 len);
#ifdef __cplusplus
}
#endif
