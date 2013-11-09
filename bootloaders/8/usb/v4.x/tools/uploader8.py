#!/usr/bin/env python
#-*- coding: iso-8859-15 -*-

"""---------------------------------------------------------------------
     _____  _____ __   _  ______ _     _ _____ __   _  _____ 
    |_____]   |   | \  | |  ____ |     |   |   | \  | |     |
    |       __|__ |  \_| |_____| |_____| __|__ |  \_| |_____|
                                                             
    Pinguino Universal Uploader

    Author:            Regis Blanchot <rblanchot@gmail.com> 
    Last release:    2012-04-19
    
    This library is free software you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the
    Free Software Foundation, Inc.
    51 Franklin Street, Fifth Floor
    Boston, MA  02110-1301  USA
---------------------------------------------------------------------"""

#-----------------------------------------------------------------------
#    Usage: uploader8.py path/filename.hex
#-----------------------------------------------------------------------

# This class is based on :
# - Diolan USB bootloader licenced (LGPL) by Diolan <http://www.diolan.com>
# - jallib USB bootloader licenced (BSD) by Albert Faber
# See also PyUSB Doc. http://wiki.erazor-zone.de/wiki:projects:python:pyusb:pydoc
# Pinguino Device Descriptors : lsusb -v -d 04d8:feaa

import sys
import os
import usb

# Globales
#-----------------------------------------------------------------------

memstart                        =    0x0C00    # bootloader offset
memend                          =    0x0000    # get its value from
                                               # getDeviceFlash(device_id)

# 8-bit Pinguino's ID
#-----------------------------------------------------------------------

VENDOR_ID                       =    0x04D8    # Microchip License
PRODUCT_ID                      =    0xFEAA    # Pinguino Sub-License

# Hex format record types
#-----------------------------------------------------------------------

Data_Record                     =     00
End_Of_File_Record              =     01
Extended_Segment_Address_Record =     02
Start_Segment_Address_Record    =     03
Extended_Linear_Address_Record  =     04
Start_Linear_Address_Record     =     05

# usbBuf Data Packet Structure
#-----------------------------------------------------------------------
#    __________________
#    |    COMMAND     |   0       [CMD]
#    |      LEN       |   1       [LEN]
#    |     ADDRL      |   2       [ADDRL]
#    |     ADDRH      |   3       [ADDRH]
#    |     ADDRU      |   4       [ADDRU]
#    |                |   5       [DATA]
#    .                .
#    .      DATA      .
#    .                .
#    |                |   62
#    |________________|   63
#
#-----------------------------------------------------------------------
BOOT_CMD                        =    0
BOOT_CMD_LEN                    =    1
BOOT_ADDR_LO                    =    2
BOOT_ADDR_HI                    =    3
BOOT_ADDR_UP                    =    4
BOOT_DATA_START                 =    5

BOOT_DEV1                       =    5
BOOT_DEV2                       =    6
BOOT_VER_MINOR                  =    2
BOOT_VER_MAJOR                  =    3

BOOT_SIZE                       =    1

# Bootloader commands
#-----------------------------------------------------------------------
READ_VERSION_CMD                =    0x00
READ_FLASH_CMD                  =    0x01
WRITE_FLASH_CMD                 =    0x02
ERASE_FLASH_CMD                 =    0x03
#READ_EEDATA_CMD                =    0x04
#WRITE_EEDATA_CMD               =    0x05
#READ_CONFIG_CMD                =    0x06
#WRITE_CONFIG_CMD               =    0x07
RESET_CMD                       =    0xFF

# Block's size to write
#-----------------------------------------------------------------------
DATABLOCKSIZE                   =    32

# USB Max. Packet size
#-----------------------------------------------------------------------
MAXPACKETSIZE                   =    64

# Bulk endpoints
#-----------------------------------------------------------------------
IN_EP                           =    0x81    # endpoint for Bulk reads
OUT_EP                          =    0x01    # endpoint for Bulk writes

# Configuration
#-----------------------------------------------------------------------
ACTIVE_CONFIG                   =    0x01
INTERFACE_ID                    =    0x00
TIMEOUT                         =    10000

# Error codes returned by various functions
#-----------------------------------------------------------------------

ERR_NONE                        =    0
ERR_CMD_ARG                     =    1
ERR_CMD_UNKNOWN                 =    2
ERR_DEVICE_NOT_FOUND            =    3
ERR_USB_INIT1                   =    4
ERR_USB_INIT2                   =    5
ERR_USB_OPEN                    =    6
ERR_USB_WRITE                   =    7
ERR_USB_READ                    =    8
ERR_HEX_OPEN                    =    9
ERR_HEX_STAT                    =    10
ERR_HEX_MMAP                    =    11
ERR_HEX_SYNTAX                  =    12
ERR_HEX_CHECKSUM                =    13
ERR_HEX_RECORD                  =    14
ERR_VERIFY                      =    15
ERR_EOL                         =    16
ERR_USB_ERASE                   =    17

# Table with supported USB devices
# device_id:[PIC name, flash size(in bytes), eeprom size (in bytes)] 
#-----------------------------------------------------------------------

devices_table = \
    {  
        0x4740: ['18f13k50'     , 0x02000, 0x80 ],
        0x4700: ['18lf13k50'    , 0x02000, 0x80 ],

        0x4760: ['18f14k50'     , 0x04000, 0xFF ],
        0x4720: ['18f14k50'     , 0x04000, 0xFF ],

        0x2420: ['18f2450'      , 0x04000, 0x00 ],
        0x1260: ['18f2455'      , 0x06000, 0xFF ],
        0x2A60: ['18f2458'      , 0x06000, 0xFF ],

        0x4C00: ['18f24J50'     , 0x04000, 0x00 ],
        0x4CC0: ['18lf24J50'    , 0x04000, 0x00 ],
        
        0x1240: ['18f2550'      , 0x08000, 0xFF ],
        0x2A40: ['18f2553'      , 0x08000, 0xFF ],
        0x4C20: ['18f25J50'     , 0x08000, 0x00 ],
        0x4CE0: ['18lf25J50'    , 0x08000, 0x00 ],
        0x5C20: ['18f25k50'     , 0x08000, 0xFF ],
        0x5CA0: ['18lf25k50'    , 0x08000, 0xFF ],

        0x4C40: ['18f26J50'     , 0x10000, 0x00 ],
        0x4D00: ['18lf26J50'    , 0x10000, 0x00 ],
        
        0x5860: ['18f27j53'     , 0x20000, 0x00 ],

        0x1200: ['18f4450'      , 0x04000, 0x00 ],
        0x1220: ['18f4455'      , 0x06000, 0x00 ],
        0x2A20: ['18f4458'      , 0x06000, 0xFF ],
        0x4C60: ['18f44J50'     , 0x04000, 0x00 ],
        0x4D20: ['18lf44J50'    , 0x04000, 0x00 ],
        
        0x1200: ['18f4550'      , 0x08000, 0xFF ],
        0x2A00: ['18f4553'      , 0x08000, 0xFF ],
        
        0x4C80: ['18f45J50'     , 0x08000, 0x00 ],
        0x4D40: ['18lf45J50'    , 0x08000, 0x00 ],
        
        0x4CA0: ['18f46J50'     , 0x10000, 0x00 ],
        0x4D60: ['18f46J50'     , 0x10000, 0x00 ],

        0x58E0: ['18f47j53'     , 0x20000, 0x00 ],
        
        0x4100: ['18f65J50'     , 0x08000, 0x00 ],
        0x1560: ['18f66J50'     , 0x10000, 0x00 ],
        0x4160: ['18f66J55'     , 0x18000, 0x00 ],
        0x4180: ['18f67J50'     , 0x20000, 0x00 ],

        0x41A0: ['18f85J50'     , 0x08000, 0x00 ],
        0x41E0: ['18f86J50'     , 0x10000, 0x00 ],
        0x1F40: ['18f86J55'     , 0x18000, 0x00 ],
        0x4220: ['18f87J50'     , 0x20000, 0x00 ]
    }

# ----------------------------------------------------------------------
def getDevice(vendor, product):
# ----------------------------------------------------------------------
    """ search USB device and returns a DeviceHandle object """
    busses = usb.busses()
    for bus in busses:
        for device in bus.devices:
            if device.idVendor == vendor and device.idProduct == product:
                return device
    return ERR_DEVICE_NOT_FOUND

# ----------------------------------------------------------------------
def initDevice(device):
# ----------------------------------------------------------------------
    """ init pinguino device """
    handle = device.open()
    if handle:
        handle.setConfiguration(ACTIVE_CONFIG)
        handle.claimInterface(INTERFACE_ID)
        return handle
    return ERR_USB_INIT1

# ----------------------------------------------------------------------
def closeDevice(handle):
# ----------------------------------------------------------------------
    """ Close currently-open USB device """
    handle.releaseInterface()

# ----------------------------------------------------------------------
def sendCMD(handle, usbBuf):  
# ----------------------------------------------------------------------
    """ send command to the bootloader """
    sent_bytes = handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)
    if sent_bytes == len(usbBuf):
        return handle.bulkRead(IN_EP, MAXPACKETSIZE, TIMEOUT)
        #return ERR_NONE
    else:        
        return ERR_USB_WRITE

# ----------------------------------------------------------------------
def resetDevice(handle):
# ----------------------------------------------------------------------
    """ reset device """
    usbBuf = [0] * MAXPACKETSIZE
    # command code
    usbBuf[BOOT_CMD] = RESET_CMD
    # write data packet
    handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)
        
# ----------------------------------------------------------------------
def getVersion(handle):
# ----------------------------------------------------------------------
    """ get bootloader version """
    usbBuf = [0] * MAXPACKETSIZE
    # command code
    usbBuf[BOOT_CMD] = READ_VERSION_CMD
    # write data packet and get response
    usbBuf = sendCMD(handle, usbBuf)
    if usbBuf == ERR_USB_WRITE:
        return ERR_USB_WRITE
    else:        
        # major.minor
        return  str(usbBuf[BOOT_VER_MAJOR]) + "." + \
                str(usbBuf[BOOT_VER_MINOR])

# ----------------------------------------------------------------------
def getDeviceID(handle):
# ----------------------------------------------------------------------
    """ read 2-byte device ID from location 0x3FFFFE """
    #usbBuf = [0] * MAXPACKETSIZE
    usbBuf = readFlash(handle, 0x3FFFFE, 2)
    if usbBuf == ERR_USB_WRITE:
        return ERR_USB_WRITE
    else:
        #print "BUFFER =", usbBuf
        dev1 = usbBuf[BOOT_DEV1]
        #print "DEV1 =", dev1
        dev2 = usbBuf[BOOT_DEV2]
        #print "DEV2 =", dev2
        device_id = (int(dev2) << 8) + int(dev1)
        #print device_id
        device_rev = device_id & 0x001F
        # mask revision number
        return device_id & 0xFFE0

# ----------------------------------------------------------------------
def getDeviceFlash(device_id):
# ----------------------------------------------------------------------
    for n in devices_table:
        if n == device_id:
            return devices_table[n][1]            
    return ERR_DEVICE_NOT_FOUND

# ----------------------------------------------------------------------
def getDeviceName(device_id):
# ----------------------------------------------------------------------
    for n in devices_table:
        if n == device_id:
            return devices_table[n][0]
    return ERR_DEVICE_NOT_FOUND

# ----------------------------------------------------------------------
def eraseFlash(handle, address, numBlocks):
# ----------------------------------------------------------------------
    """ erase n * 64-byte blocks of flash memory """
    usbBuf = [0] * MAXPACKETSIZE
    # command code
    usbBuf[BOOT_CMD] = ERASE_FLASH_CMD
    # number of blocks to erase
    usbBuf[BOOT_SIZE] = numBlocks
    # 1rst block address
    # NB : must be divisible by 64 or 1024 depending on PIC model
    usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
    usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
    usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
    # write data packet
    handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)
        
# ----------------------------------------------------------------------
def readFlash(handle, address, length):
# ----------------------------------------------------------------------
    """ read a block of flash """
    usbBuf = [0] * MAXPACKETSIZE
    # command code
    usbBuf[BOOT_CMD] = READ_FLASH_CMD 
    # size of block
    usbBuf[BOOT_CMD_LEN] = length
    # address
    usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
    usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
    usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
    # send request to the bootloader
    return sendCMD(handle, usbBuf)
        
# ----------------------------------------------------------------------
def writeFlash(handle, address, datablock):
# ----------------------------------------------------------------------
    """ write a block of code
        first 5 bytes are for block description (BOOT_CMD, BOOT_CMD_LEN and BOOT_ADDR)
        data block size should be of DATABLOCKSIZE bytes
        total length is then DATABLOCKSIZE + 5 """
    usbBuf = [0xFF] * MAXPACKETSIZE
    # command code
    usbBuf[BOOT_CMD] = WRITE_FLASH_CMD 
    # size of block
    usbBuf[BOOT_CMD_LEN] = len(datablock)
    # block's address
    usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
    usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
    usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
    # add data to the packet
    for i in range(len(datablock)):
        usbBuf[BOOT_DATA_START + i] = datablock[i]
    # write data packet on usb device
    handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)


# ----------------------------------------------------------------------
def hexWrite(handle, filename, proc, memend):
# ----------------------------------------------------------------------
    """ Parse the Hex File Format and send data to usb device """

    """
    [0]        Start code, one character, an ASCII colon ':'.
    [1:3]    Byte count, two hex digits, a number of bytes (hex digit pairs) in the data field. 16 (0x10) or 32 (0x20) bytes of data are the usual compromise values between line length and address overhead.
    [3:7]    Address, four hex digits, a 16-bit address of the beginning of the memory position for the data. Limited to 64 kilobytes, the limit is worked around by specifying higher bits via additional record types. This address is big endian.
    [7:9]    Record type, two hex digits, 00 to 05, defining the type of the data field.
    [9:*]    Data, a sequence of n bytes of the data themselves, represented by 2n hex digits.
    [*:*]    Checksum, two hex digits - the least significant byte of the two's complement of the sum of the values of all fields except fields 1 and 6 (Start code ":" byte and two hex digits of the Checksum). It is calculated by adding together the hex-encoded bytes (hex digit pairs), then leaving only the least significant byte of the result, and making a 2's complement (either by subtracting the byte from 0x100, or inverting it by XOR-ing with 0xFF and adding 0x01). If you are not working with 8-bit variables, you must suppress the overflow by AND-ing the result with 0xFF. The overflow may occur since both 0x100-0 and (0x00 XOR 0xFF)+1 equal 0x100. If the checksum is correctly calculated, adding all the bytes (the Byte count, both bytes in Address, the Record type, each Data byte and the Checksum) together will always result in a value wherein the least significant byte is zero (0x00).
            For example, on :0300300002337A1E
            03 + 00 + 30 + 00 + 02 + 33 + 7A = E2, 2's complement is 1E
    """

    data        = []
    old_address = 0
    max_address = 0
    address_Hi  = 0
    codesize    = 0

    # get the erased block size
    # ----------------------------------------------------------------------

    # Pinguino x6j50 or x7j53, erased blocks are 1024-byte long
    if "j" in proc :
        erasedBlockSize = 1024

    # Pinguino x455, x550 or x5k50, erased blocks are 64-byte long
    else:
        erasedBlockSize = 64

    # read hex file
    # ----------------------------------------------------------------------

    fichier = open(filename,'r')
    lines = fichier.readlines()
    fichier.close()

    # calculate checksum, code size and max_address
    # ----------------------------------------------------------------------

    for line in lines:
        byte_count = int(line[1:3], 16)
        address_Lo = int(line[3:7], 16) # lower 16 bits (bits 0-15) of the data address
        record_type= int(line[7:9], 16)
        
        address = (address_Hi << 16) + address_Lo

        # checksum calculation
        end = 9 + byte_count * 2 # position of checksum at end of line
        checksum = int(line[end:end+2], 16)
        cs = 0
        i = 1
        while i < end:
            cs = cs + (0x100 - int(line[i:i+2], 16) ) & 0xff # not(i)
            i = i + 2
        if checksum != cs:
            return ERR_HEX_CHECKSUM

        # extended linear address record
        if record_type == Extended_Linear_Address_Record:
            # upper 16 bits (bits 16-31) of the data address
            address_Hi = int(line[9:13], 16) << 16
            
        # data record
        if record_type == Data_Record:

            # 32-bit address
            address = address_Hi + address_Lo

            # max address
            if (address > old_address) and (address < memend):
                max_address = address + byte_count
                old_address = address

            if (address >= memstart) and (address < memend):

                # code size
                if (address >= memstart) and (address < memend):
                    codesize = codesize + byte_count

                # append data
                for i in range(byte_count):
                    data.append(int(line[9 + (2 * i) : 11 + (2 * i)], 16))

        # end of file record
        if record_type == End_Of_File_Record:
            break

    # max_address must be divisible by erasedBlockSize
    # --------------------------------------------------------------

    max_address = max_address + erasedBlockSize - (max_address % erasedBlockSize)

    # erase memory from memstart to max_address 
    # ----------------------------------------------------------------------

    numBlocksMax = (memend      - memstart) / erasedBlockSize
    numBlocks    = (max_address - memstart) / erasedBlockSize
    
    if numBlocks > numBlocksMax:
        #numBlocks = numBlocksMax
        return ERR_USB_ERASE

    if numBlocks < 256:
        eraseFlash(handle, memstart, numBlocks)

    else:
        numBlocks = numBlocks - 255
        upperAddress = memstart + 255 * erasedBlockSize
        # from self.board.memstart to upperAddress 
        eraseFlash(memstart, 255)
        # erase flash memory from upperAddress to max_address
        eraseFlash(upperAddress, numBlocks)

    # write blocks of DATABLOCKSIZE bytes
    # ----------------------------------------------------------------------

    for addr in range(memstart, max_address, DATABLOCKSIZE):
        index = addr - memstart
        writeFlash(handle, addr, data[index:index+DATABLOCKSIZE])
        #print "block@%d has been issued" % addr

    print "%d bytes written.\n" % codesize

    return ERR_NONE

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

def main(filename):

    # check file to upload
    # --------------------------------------------------------------

    if filename == '':
        print "No program to write"
        closeDevice(handle)
        sys.exit(0)

    fichier = open(filename, 'r')
    if fichier == "":
        print "Unable to open " + filename
        sys.exit(0)
    fichier.close()

    # search for a Pinguino board
    # --------------------------------------------------------------

    device = getDevice(VENDOR_ID, PRODUCT_ID)
    if device == ERR_DEVICE_NOT_FOUND:
        print "Pinguino not found"
        print "Is your device connected and/or in bootloader mode ?"
        sys.exit(0)
    else:
        print "Pinguino found ..."

    handle = initDevice(device)
    if handle == ERR_USB_INIT1:
        print "... but upload is not possible."
        print "Press the Reset button and try again."
        sys.exit(0)

    # find out the processor
    # --------------------------------------------------------------

    device_id = getDeviceID(handle)
    proc = getDeviceName(device_id)
    print " - with PIC%s (id=%s)" % (proc, hex(device_id))

    # find out flash memory size
    # --------------------------------------------------------------

    memend = getDeviceFlash(device_id) - 1
    memfree = memend - memstart;
    print " - with %d bytes free (%d KB)" % (memfree, memfree/1024)

    # find out bootloader version
    # --------------------------------------------------------------

    #product = handle.getString(device.iProduct, 30)
    #manufacturer = handle.getString(device.iManufacturer, 30)
    print " - with USB bootloader v%s" % getVersion(handle)

    # start writing
    # --------------------------------------------------------------

    print "Uploading user program ..."
    status = hexWrite(handle, filename, proc, memend)
    
    if status == ERR_HEX_RECORD:
        print "Record error"
        closeDevice(handle)
        sys.exit(0)

    elif status == ERR_HEX_CHECKSUM:
        print "Checksum error"
        closeDevice(handle)
        sys.exit(0)

    elif status == ERR_USB_ERASE:
        print "Erase error"
        closeDevice(handle)
        sys.exit(0)

    elif status == ERR_NONE:
        print os.path.basename(filename) + " successfully uploaded"

    # reset and start start user's app.
    # --------------------------------------------------------------

        print "Starting user program ..."
        try:
            resetDevice(handle)
        except:
            pass
        # Device has been reseted so it is no longer a USB device
        # and therefore it can not be closed
        #closeDevice(handle)
        sys.exit(0)

    else:
        print "Unknown error"
        sys.exit(0)

# ------------------------------------------------------------------------------

if __name__ == "__main__":
    i = -1
    for arg in sys.argv:
        i = i + 1
    if i == 1:
        main(sys.argv[1])
    else:
        print "Usage: uploader8.py path/filename.hex"
