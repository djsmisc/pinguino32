; Definitions Imported from *.[ch] files
USB_SM_DETACHED equ 0x0 
USB_SM_ATTACHED equ 0x1 
USB_SM_POWERED equ 0x2 
USB_SM_DEFAULT equ 0x3 
USB_SM_ADR_PENDING equ 0x4 
USB_SM_ADDRESS equ 0x5 
USB_SM_CONFIGURED equ 0x6 
USB_SM_CTRL_WAIT_SETUP equ 0x0 
USB_SM_CTRL_TRF_TX equ 0x1 
USB_SM_CTRL_TRF_RX equ 0x2 
_RAM equ 0x0 
_ROM equ 0x1 
MUID_NULL equ 0x0 
MUID_USB9 equ 0x1 
MUID_HID equ 0x2 
MUID_CDC equ 0x3 
GET_STATUS_FULLY_SUPPORTED equ 0x0 
CLR_SET_FEATURE_SUPPORTED equ 0x0 
GET_SET_IDLE equ 0x0 
GET_SET_PROTOCOL equ 0x0 
USE_HID_EP_OUT equ 0x0 
APP_RESET_VECTOR equ 0x800 
APP_HIGH_INTERRUPT_VECTOR equ 0x808 
APP_LOW_INTERRUPT_VECTOR equ 0x818 
FW_VER_MAJOR equ 0x0 
FW_VER_MINOR equ 0x0 
FW_VER_SUB_MINOR equ 0x6 
USE_EEPROM_MARK equ 0x1 
EEPROM_MARK_ADDR equ 0x0 
EEPROM_MARK equ 0x5a 
UART_DEBUG equ 0x0 
BOOT_CMD_SIZE equ 0x40 
BOOT_REP_SIZE equ 0x40 
BOOT_CMD_READ_CODE equ 0x1 
BOOT_CMD_WRITE_CODE equ 0x2 
BOOT_CMD_ERASE_CODE equ 0x3 
BOOT_CMD_GET_FW_VER equ 0x4 
BOOT_CMD_RESET equ 0x5 
BOOT_CMD_READ_ID equ 0x6 
BOOT_CMD_WRITE_ID equ 0x7 
BOOT_CMD_UNKNOWN equ 0xff 
JP_BOOTLOADER_EN equ 0x0 
EP_CTRL equ 0x6 
EP_OUT equ 0xc 
EP_IN equ 0xa 
EP_OUT_IN equ 0xe 
HSHK_EN equ 0x10 
_BSTALL equ 0x4 
_DTSEN equ 0x8 
_INCDIS equ 0x10 
_KEN equ 0x20 
_DAT0 equ 0x0 
_DAT1 equ 0x40 
_DTSMASK equ 0x40 
_USIE equ 0x80 
_UCPU equ 0x0 
OUT equ 0x0 
IN equ 0x1 
SETUP_TOKEN equ 0xd 
OUT_TOKEN equ 0x1 
IN_TOKEN equ 0x9 
EP0_BUFF_SIZE equ 0x40 
HID_INTF_ID equ 0x0 
HID_IN_EP_SIZE equ 0x40 
GET_STATUS equ 0x0 
CLR_FEATURE equ 0x1 
SET_FEATURE equ 0x3 
SET_ADR equ 0x5 
GET_DSC equ 0x6 
SET_DSC equ 0x7 
GET_CFG equ 0x8 
SET_CFG equ 0x9 
GET_INTF equ 0xa 
SET_INTF equ 0xb 
SYNCH_FRAME equ 0xc 
GET_REPORT equ 0x1 
GET_IDLE equ 0x2 
GET_PROTOCOL equ 0x3 
SET_REPORT equ 0x9 
SET_IDLE equ 0xa 
SET_PROTOCOL equ 0xb 
RCPT_DEV equ 0x0 
RCPT_INTF equ 0x1 
RCPT_EP equ 0x2 
RCPT_OTH equ 0x3 
STANDARD equ 0x0 
CLASS equ 0x1 
VENDOR equ 0x2 
HOST_TO_DEV equ 0x0 
DEV_TO_HOST equ 0x1 
DEVICE_REMOTE_WAKEUP equ 0x1 
ENDPOINT_HALT equ 0x0 
DSC_DEV equ 0x1 
DSC_CFG equ 0x2 
DSC_STR equ 0x3 
DSC_INTF equ 0x4 
DSC_EP equ 0x5 
HID_INTF equ 0x3 
NO_SUBCLASS equ 0x0 
BOOT_INTF_SUBCLASS equ 0x1 
HID_PROTOCOL_NONE equ 0x0 
HID_PROTOCOL_KEYBOAD equ 0x1 
HID_PROTOCOL_MOUSE equ 0x2 
_EP01_OUT equ 0x1 
_EP01_IN equ 0x81 
_CTRL equ 0x0 
_ISO equ 0x1 
_BULK equ 0x2 
_INT equ 0x3 
DSC_HID equ 0x21 
DSC_RPT equ 0x22 
DSC_PHY equ 0x23 
HID_NUM_OF_DSC equ 0x1 
HID_RPT01_SIZE equ 0x17 
