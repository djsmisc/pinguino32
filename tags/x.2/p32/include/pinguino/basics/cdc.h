#ifdef __cplusplus
extern "C" {
#endif
void USBCheckCDCRequest();
void CDCInitEP();
void USBDeviceInit();		
void USBDeviceAttach();
void putUSBUSART(u8 *data, u8 Length);
void CDCTxService(void);
u8 getsUSBUSART(u8 *data, u8 Length);
#ifdef __cplusplus
}
#endif
