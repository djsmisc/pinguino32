#!/usr/bin/env python
#-*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
	Pinguino Universal Uploader

	Author:			Regis Blanchot <rblanchot@gmail.com> 
	Last release:	2012-04-19
	
	This library is free software you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-------------------------------------------------------------------------"""

#-----------------------------------------------------------------------
#	Usage: uploader8.py path/filename.hex
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
# --------------------------------------------------------------------------

memstart						= 0x0C00		# bootloader offset
memend							= 0

# 8-bit Pinguino's ID
# --------------------------------------------------------------------------

VENDOR_ID						=	0x04D8
PRODUCT_ID						=	0xFEAA

# Hex format record types
# --------------------------------------------------------------------------

Data_Record						=	 00
End_Of_File_Record				=	 01
Extended_Segment_Address_Record	=	 02
Start_Segment_Address_Record	=	 03
Extended_Linear_Address_Record	=	 04
Start_Linear_Address_Record		=	 05

# General Data Packet Structure (usbBuf)
# --------------------------------------------------------------------------
#	__________________
#	|    COMMAND     |   0       [CMD]
#	|      LEN       |   1       [LEN]
#	|     ADDRL      |   2       [        ]  [addrl]
#	|     ADDRH      |   3       [ADR.pAdr]: [addrh]
#	|     ADDRU      |   4       [        ]  [addru]
#	|                |   5       [DATA]
#	|                |
#	.      DATA      .
#	.                .
#	|                |   62
#	|________________|   63
#
# --------------------------------------------------------------------------
BOOT_CMD						=	0
BOOT_CMD_LEN					=	1
BOOT_ADDR_LO					=	2
BOOT_ADDR_HI					=	3
BOOT_ADDR_UP					=	4
BOOT_DATA_START					=	5

BOOT_DEV1						=	5
BOOT_DEV2						=	6
BOOT_VER_MINOR					=	2
BOOT_VER_MAJOR					=	3

BOOT_SIZE64						=	1

# Bootloader commands
# --------------------------------------------------------------------------
READ_VERSION_CMD   				=	0x00
READ_FLASH_CMD					=	0x01
WRITE_FLASH_CMD					=	0x02
ERASE_FLASH_CMD					=	0x03
#READ_EEDATA_CMD				=	0x04
#WRITE_EEDATA_CMD				=	0x05
#READ_CONFIG_CMD				=	0x06
#WRITE_CONFIG_CMD				=	0x07
RESET_CMD						=	0xFF

# Block's size to write
# --------------------------------------------------------------------------
BLOCKSIZE						=	32

# bulk endpoints
# --------------------------------------------------------------------------
IN_EP							=	0x81	# endpoint for Bulk reads
OUT_EP							=	0x01	# endpoint for Bulk writes

# configuration
# --------------------------------------------------------------------------
ACTIVE_CONFIG					=	0x01
INTERFACE_ID					=	0x00
TIMEOUT							=	1200

# Error codes returned by various functions
# --------------------------------------------------------------------------

ERR_NONE						=	0
ERR_CMD_ARG						=	-1
ERR_CMD_UNKNOWN					=	-2
ERR_DEVICE_NOT_FOUND			=	-3
ERR_USB_INIT1					=	-4
ERR_USB_INIT2					=	-5
ERR_USB_OPEN					=	-6
ERR_USB_WRITE					=	-7
ERR_USB_READ					=	-8
ERR_HEX_OPEN					=	-9
ERR_HEX_STAT					=	-10
ERR_HEX_MMAP					=	-11
ERR_HEX_SYNTAX					=	-12
ERR_HEX_CHECKSUM				=	-13
ERR_HEX_RECORD					=	-14
ERR_VERIFY						=	-15
ERR_EOL							=	-16
ERR_USB_ERASE					=	-17

# Table with supported USB devices
# device_id:[PIC name, flash size(in bytes), eeprom size (in bytes)] 
# --------------------------------------------------------------------------

devices_table = \
	{  
		0x4740: ['18f13k50'	, 0x02000, 0x80 ],
		0x4700: ['18lf13k50', 0x02000, 0x80 ],

		0x4760: ['18f14k50'	, 0x04000, 0xFF ],
		0x4720: ['18f14k50'	, 0x04000, 0xFF ],

		0x2420: ['18f2450'	, 0x04000, 0x00 ],
		0x1260: ['18f2455'	, 0x06000, 0xFF ],
		0x2A60: ['18f2458'	, 0x06000, 0xFF ],

		0x4C00: ['18f24J50'	, 0x04000, 0x00 ],
		0x4CC0: ['18lf24J50', 0x04000, 0x00 ],
		
		0x1240: ['18f2550'	, 0x08000, 0xFF ],
		0x2A40: ['18f2553'	, 0x08000, 0xFF ],

		0x4C20: ['18f25J50'	, 0x08000, 0x00 ],
		0x4CE0: ['18lf25J50', 0x08000, 0x00 ],
		
		0x4C40: ['18f26J50'	, 0x10000, 0x00 ],
		0x4D00: ['18lf26J50', 0x10000, 0x00 ],
		
		0x1200: ['18f4450'	, 0x04000, 0x00 ],
		0x1220: ['18f4455'	, 0x06000, 0x00 ],
		0x2A20: ['18f4458'	, 0x06000, 0xFF ],
		
		0x4C60: ['18f44J50'	, 0x04000, 0x00 ],
		0x4D20: ['18lf44J50', 0x04000, 0x00 ],
		
		0x1200: ['18f4550'	, 0x08000, 0xFF ],
		0x2A00: ['18f4553'	, 0x08000, 0xFF ],
		
		0x4C80: ['18f45J50'	, 0x08000, 0x00 ],
		0x4D40: ['18lf45J50', 0x08000, 0x00 ],
		
		0x4CA0: ['18f46J50'	, 0x10000, 0x00 ],
		0x4D60: ['18f46J50'	, 0x10000, 0x00 ],
		
		0x4100: ['18f65J50'	, 0x08000, 0x00 ],
		0x1560: ['18f66J50'	, 0x10000, 0x00 ],
		0x4160: ['18f66J55'	, 0x18000, 0x00 ],
		0x4180: ['18f67J50'	, 0x20000, 0x00 ],
		0x41A0: ['18f85J50'	, 0x08000, 0x00 ],
		0x41E0: ['18f86J50'	, 0x10000, 0x00 ],
		0x1F40: ['18f86J55'	, 0x18000, 0x00 ],
		0x4220: ['18f87J50'	, 0x20000, 0x00 ]
	}

# ------------------------------------------------------------------------------
def getDevice(vendor, product):
	""" search USB device and returns a DeviceHandle object """
	busses = usb.busses()
	for bus in busses:
		for device in bus.devices:
			if device.idVendor == vendor and device.idProduct == product:
				return device
	return ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
def initDevice(device):
	""" init pinguino device """
	conf = device.configurations[0]
	iface = conf.interfaces[0][0]
	handle = device.open()
	if handle:
		#handle.detachKernelDriver(iface.interfaceNumber)
		handle.setConfiguration(conf)
		handle.claimInterface(iface)
		#handle.setAltInterface(iface)
		return handle
	return ERR_USB_INIT1
# ------------------------------------------------------------------------------
def closeDevice(handle):
	""" Close currently-open USB device """
	handle.releaseInterface()
# ------------------------------------------------------------------------------
def sendCMD(handle, usbBuf):  
	""" send command to the bootloader """
	sent_bytes = handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)
	if sent_bytes == len(usbBuf):
		return handle.bulkRead(IN_EP, 64, TIMEOUT)
		#return ERR_NONE
	else:		
		return ERR_USB_WRITE
# ------------------------------------------------------------------------------
def resetDevice(handle):
	""" reset device """
	usbBuf = [0] * 1
	# command code
	usbBuf[BOOT_CMD] = RESET_CMD
	# write data packet
	sendCMD(handle, usbBuf)
# ------------------------------------------------------------------------------
def getVersion(handle):
	""" get bootloader version """
	usbBuf = [0] * 64
	# command code
	usbBuf[BOOT_CMD] = READ_VERSION_CMD
	# write data packet and get response
	usbBuf = sendCMD(handle, usbBuf)
	if usbBuf == ERR_USB_WRITE:
		return ERR_USB_WRITE
	else:		
		# major.minor
		return	str(usbBuf[BOOT_VER_MAJOR]) + "." + \
				str(usbBuf[BOOT_VER_MINOR])
# ------------------------------------------------------------------------------
def getDeviceID(handle):
	""" read 2-byte device ID from location 0x3FFFFE """
	usbBuf = [0] * 64
	usbBuf = readFlash(handle, 0x3FFFFE, 2)
	#print "BUFFER =", usbBuf
	dev1 = usbBuf[BOOT_DEV1]
	#print "DEV1 =", dev1
	dev2 = usbBuf[BOOT_DEV2]
	#print "DEV2 =", dev2
	device_id = (int(dev2) << 8) + int(dev1)
	#print device_id
	device_rev = device_id & 0x001F
	# mask revision number
	return device_id  & 0xFFE0
# ------------------------------------------------------------------------------
def getDeviceFlash(device_id):
	for n in devices_table:
		if n == device_id:
			return devices_table[n][1]			
	return ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
def getDeviceName(device_id):
	for n in devices_table:
		if n == device_id:
			return devices_table[n][0]
	return ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
def eraseFlash(handle, address, size64):
	""" erase n * 64-byte blocks of flash memory """
	usbBuf = [0] * 64
	# command code
	usbBuf[BOOT_CMD] = ERASE_FLASH_CMD
	# block address (must be divisible by 64)
	usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
	usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
	usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
	# size in 64 byte blocks
	usbBuf[BOOT_SIZE64] = size64
	# write data packet and get response
	#print usbBuf
	usbBuf = sendCMD(handle, usbBuf)
	#print usbBuf
	return usbBuf
# ------------------------------------------------------------------------------
def readFlash(handle, address, length):
	""" read a block of flash """
	usbBuf = [0] * 64
	# command code
	usbBuf[BOOT_CMD] = READ_FLASH_CMD 
	# address
	usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
	usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
	usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
	# size of block
	usbBuf[BOOT_CMD_LEN] = length
	# send request to the bootloader
	#usbBuf = sendCMD(handle, usbBuf)
	handle.bulkWrite(OUT_EP, usbBuf, TIMEOUT)
	return handle.bulkRead(IN_EP, BOOT_DATA_START + length, TIMEOUT)
# ------------------------------------------------------------------------------
def writeFlash(handle, address, block):
	""" write a block of code """
	usbBuf = [0xFF] * 64
	# command code
	usbBuf[BOOT_CMD] = WRITE_FLASH_CMD 
	# block's address
	usbBuf[BOOT_ADDR_UP] = (address >> 16) & 0xFF
	usbBuf[BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
	usbBuf[BOOT_ADDR_LO] = (address      ) & 0xFF
	# size of block
	usbBuf[BOOT_CMD_LEN] = len(block)
	# add data to the packet
	for i in range(0, 16):
		usbBuf[BOOT_DATA_START + i] = block[i]
	# write data packet on usb device
	#print usbBuf
	usbBuf = sendCMD(handle, usbBuf)
	#print usbBuf
	return usbBuf
# ------------------------------------------------------------------------------
def hexWrite(handle, filename, memend):
	""" Parse the Hex File Format and send data to usb device """

	"""
	[0]		Start code, one character, an ASCII colon ':'.
	[1:3]	Byte count, two hex digits, a number of bytes (hex digit pairs) in the data field. 16 (0x10) or 32 (0x20) bytes of data are the usual compromise values between line length and address overhead.
	[3:7]	Address, four hex digits, a 16-bit address of the beginning of the memory position for the data. Limited to 64 kilobytes, the limit is worked around by specifying higher bits via additional record types. This address is big endian.
	[7:9]	Record type, two hex digits, 00 to 05, defining the type of the data field.
	[9:*]	Data, a sequence of n bytes of the data themselves, represented by 2n hex digits.
	[*:*]	Checksum, two hex digits - the least significant byte of the two's complement of the sum of the values of all fields except fields 1 and 6 (Start code ":" byte and two hex digits of the Checksum). It is calculated by adding together the hex-encoded bytes (hex digit pairs), then leaving only the least significant byte of the result, and making a 2's complement (either by subtracting the byte from 0x100, or inverting it by XOR-ing with 0xFF and adding 0x01). If you are not working with 8-bit variables, you must suppress the overflow by AND-ing the result with 0xFF. The overflow may occur since both 0x100-0 and (0x00 XOR 0xFF)+1 equal 0x100. If the checksum is correctly calculated, adding all the bytes (the Byte count, both bytes in Address, the Record type, each Data byte and the Checksum) together will always result in a value wherein the least significant byte is zero (0x00).
			For example, on :0300300002337A1E
			03 + 00 + 30 + 00 + 02 + 33 + 7A = E2, 2's complement is 1E
	"""

	data		= []
	old_address = 0
	max_address	= 0
	address_Hi	= 0
	codesize	= 0

	# read hex file
	# ----------------------------------------------------------------------

	fichier = open(filename,'r')
	lines = fichier.readlines()
	fichier.close()

	# 1st pass : calculate checksum and max_address
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
			address_Hi = int(line[9:13], 16) << 16 # upper 16 bits (bits 16-31) of the data address
			address = (address_Hi << 16) + address_Lo
			
		# code size
		if address >= memstart:
			codesize = codesize + byte_count

		# max address
		if (address > old_address) and (address < memend):
			max_address = address + byte_count
			old_address = address

	max_address = max_address + 64 - (max_address % 64)
	#print memstart, max_address, memend

	# fill data sequence with 0xFF
	# ----------------------------------------------------------------------

	for i in range(max_address - memstart):
		data.append(0xFF)

	# 2nd pass : parse bytes from line into data
	# ----------------------------------------------------------------------

	address_Hi	= 0

	for line in lines:
		byte_count = int(line[1:3], 16)
		address_Lo = int(line[3:7], 16) # four hex digits
		record_type= int(line[7:9], 16)

		# 32-bit address
		address = (address_Hi << 16) + address_Lo
		#print address

		# data record
		if record_type == Data_Record:
			if (address >= memstart) and (address < memend):
				#print hex(address)
				for i in range(byte_count):
					#print address - memstart + i
					#print int(line[9 + (2 * i) : 11 + (2 * i)], 16)
					data[address - memstart + i] = int(line[9 + (2 * i) : 11 + (2 * i)], 16)
				#print "-----------"
				
		# end of file record
		elif record_type == End_Of_File_Record:
			break

		# extended linear address record
		elif record_type == Extended_Linear_Address_Record:
			address_Hi = int(line[9:13], 16) # upper 16 bits (bits 16-31) of the data address
			#print "address_Hi = " + hex(address_Hi)

		# unsupported record type
		else:
			return ERR_HEX_RECORD

	# erase memory from memstart to max_address 
	# ----------------------------------------------------------------------

	size64 = (max_address - memstart) / 64

	if size64 > 511:
		return ERR_USB_ERASE
	if size64 < 256:
		eraseFlash(handle, memstart, size64)
	else:
		# erase flash memory from memstart to memstart + 0x4000
		eraseFlash(handle, memstart, 255)
		# erase flash memory from memstart + 0x4000 to max_address
		size64 = size64 - 255
		eraseFlash(handle, memstart + 0x4000, size64)

	# write 32-bit blocks
	# ----------------------------------------------------------------------

	usbBuf = []
	for addr in range(memstart, max_address):
		#print addr
		if addr % BLOCKSIZE == 0:
			if usbBuf != []:
				#print usbBuf
				writeFlash(handle, addr - BLOCKSIZE, usbBuf)
			usbBuf = []
		if data[addr - memstart] != []:
			#print data[addr - memstart]
			usbBuf.append(data[addr - memstart])
	print "%d bytes written.\n" % codesize

	return ERR_NONE

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

def main(filename):

	if filename == '':
		print "No program to write"
		#closeDevice(handle)
		sys.exit(0)

	fichier = open(filename, 'r')
	if fichier == "":
		print "Unable to open " + filename
		sys.exit(0)
	fichier.close()

	device = getDevice(VENDOR_ID, PRODUCT_ID)
	if device == ERR_DEVICE_NOT_FOUND:
		print "Pinguino not found"
		print "Is your device connected and/or in bootloader mode ?"
		sys.exit(0)
	else:
		print "Pinguino found"

	handle = initDevice(device)
	if handle == ERR_USB_INIT1:
		print "Upload not possible"
		print "Try to restart the bootloader mode"
		sys.exit(0)

	#device_id = 0x1200
	device_id = getDeviceID(handle)
	proc = getDeviceName(device_id)
	if proc != "18f4550":
		#print "Device ID =", hex(device_id)
		print "Compiled for 18f4550 but device have", proc
		sys.exit(0)
	print "%s (id=%s)" % (proc, hex(device_id))

	memend = getDeviceFlash(device_id)
	memfree = memend - memstart;
	print "%d bytes free (%d KB)" % (memfree, memfree/1024)

	#product = handle.getString(device.iProduct, 30)
	#manufacturer = handle.getString(device.iManufacturer, 30)
	print "Pinguino bootloader v%s" % getVersion(handle)

	print "Writing ..."
	status = hexWrite(handle, filename, memend)
	
	if status == ERR_NONE:
		print os.path.basename(filename) + " successfully uploaded"
	if status == ERR_HEX_RECORD:
		print "Record error"
		closeDevice(handle)
		sys.exit(0)
	if status == ERR_HEX_CHECKSUM:
		print "Checksum error"
		closeDevice(handle)
		sys.exit(0)
	if status == ERR_USB_ERASE:
		print "Erase error"
		closeDevice(handle)
		sys.exit(0)

	print "Resetting ..."
	resetDevice(handle)
	closeDevice(handle)

# ------------------------------------------------------------------------------

if __name__ == "__main__":
	i = -1
	for arg in sys.argv:
		i = i + 1
	if i == 1:
		main(sys.argv[1])
	else:
		print "Usage: uploader8.py path/filename.hex"
	
