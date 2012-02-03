#!/usr/bin/env python
#-*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
	Pinguino Universal Uploader

	(c) 2011 Regis Blanchot <rblanchot@gmail.com> 

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

# This class is based on :
# Diolan software licenced (LGPL) by Diolan <http://www.diolan.com>
# PyUSB Doc. http://wiki.erazor-zone.de/wiki:projects:python:pyusb:pydoc
# Device Descriptors : lsusb -v -d 04d8:feaa

import sys
import os
import usb			# checked in check.py


BOOT_CMD_SIZE	=	64
BOOT_RSP_SIZE	=	64
BOOT_ID_LEN		=	8

# common for all commands fields
"""
class boot_cmd_header:
	unsigned char cmd		# command code, see BOOT_xxx constants 
	unsigned char echo		# echo is used to link between command and response

# READ_FLASH - read flash memory

class boot_cmd_read_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr_lo		# address must be divisible by 2
	unsigned char addr_hi
	unsigned char reserved[1]
	unsigned char size8		# size must be divisible by 8

# WRITE_FLASH - write flash memory

class boot_cmd_write_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr_lo		# address must be divisible by 2
	unsigned char addr_hi
	unsigned char reserved[1]
	unsigned char size8		# size must be divisible by 8
	unsigned char data[BOOT_CMD_SIZE - 6]

# ERASE_FLASH - erase flash memory

class boot_cmd_erase_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr_lo		# address must be divisible by 64
	unsigned char addr_hi
	unsigned char reserved[1]
	unsigned char size_x64		# size in 64 byte blocks


# GET_FW_VERSION - get bootloader firmware version

class boot_cmd_get_fw_ver:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

# RESET - reset microcontroller


class boot_cmd_reset:
	unsigned char cmd		# command code, see BOOT_xxx constants

# READ_ID - read ID location

class boot_cmd_read_id:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char reserved[3]
	unsigned char size

# WRITE_ID - write ID location

class boot_cmd_write_id:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char reserved[3]
	unsigned char size
	unsigned char data[BOOT_ID_LEN]

# READ_EEPROM - read EEPROM memory

class boot_cmd_read_eeprom:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr		# EEPROM address to start read from LSB
	unsigned char reserved[2]
	unsigned char size		# size of EEPROM data to read

# WRITE_EEPROM - write EEPROM memory

class boot_cmd_write_eeprom:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr		# EEPROM address to start write to
	unsigned char reserved[2]
	unsigned char size		# size of EEPROM data to write
	unsigned char data[BOOT_CMD_SIZE - 6]

class boot_cmd:
	unsigned char data[BOOT_CMD_SIZE]
	boot_cmd_header header
	boot_cmd_read_flash read_flash
	boot_cmd_write_flash write_flash
	boot_cmd_erase_flash erase_flash
	boot_cmd_get_fw_ver get_fw_ver
	boot_cmd_reset reset
	boot_cmd_read_id read_id
	boot_cmd_write_id write_id
	boot_cmd_read_eeprom read_eeprom
	boot_cmd_write_eeprom write_eeprom

# common for all responses fields

class boot_rsp_header:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

# READ_FLASH - read flash memory

class boot_rsp_read_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr_lo		# address must be divisible by 2
	unsigned char addr_hi
	unsigned char reserved[1]
	unsigned char size8		# size must be divisible by 8
	unsigned char data[BOOT_RSP_SIZE - 6]

# WRITE_FLASH - write flash memory

class boot_rsp_write_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

# ERASE_FLASH - erase flash memory

class boot_rsp_erase_flash:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

# GET_FW_VER

class boot_rsp_get_fw_ver:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char major
	unsigned char minor
	unsigned char sub_minor

# READ_ID - read ID locations

class boot_rsp_read_id:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char reserved[4]
	unsigned char data[BOOT_ID_LEN]

# WRITE_ID - write ID locations

class boot_rsp_write_id:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

# READ_EEPROM - read EEPROM memory

class boot_rsp_read_eeprom:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response
	unsigned char addr		# EEPROM address the data was read from
	unsigned char reserved[2]
	unsigned char size		# size of EEPROM data
	unsigned char data[BOOT_RSP_SIZE - 6]

# WRITE_EEPROM - write EEPROM memory

class boot_rsp_write_eeprom:
	unsigned char cmd		# command code, see BOOT_xxx constants
	unsigned char echo		# echo is used to link between command and response

class boot_rsp:
	unsigned char data[BOOT_RSP_SIZE]
	boot_rsp_header header
	boot_rsp_read_flash read_flash
	boot_rsp_write_flash write_flash
	boot_rsp_erase_flash erase_flash
	boot_rsp_get_fw_ver get_fw_ver
	boot_rsp_read_id read_id
	boot_rsp_write_id write_id
	boot_rsp_read_eeprom read_eeprom
	boot_rsp_write_eeprom write_eeprom
"""
class uploaderDLN:
	""" upload .hex into pinguino device """

	# Hex format record types
	# --------------------------------------------------------------------------

	Data_Record						=	 00
	End_Of_File_Record				=	 01
	Extended_Segment_Address_Record	=	 02
	Start_Segment_Address_Record	=	 03
	Extended_Linear_Address_Record	=	 04
	Start_Linear_Address_Record		=	 05

	# Diolan Hid bootloader commands
	# --------------------------------------------------------------------------

	DLN_READ_FLASH_CMD				=	0x01
	DLN_WRITE_FLASH_CMD				=	0x02
	DLN_ERASE_FLASH_CMD				=	0x03
	DLN_GET_FW_VER_CMD				=	0x04
	DLN_RESET_CMD  					=	0x05
	DLN_READ_ID_CMD					=	0x06
	DLN_WRITE_ID_CMD				=	0x07
	DLN_READ_EEPROM_CMD				=	0x08
	DLN_WRITE_EEPROM_CMD			=	0x09
	DLN_UNKNOWN_CMD					=	0xFF

	# boot command size in bytes
	DLN_BOOT_CMD_SIZE				=	6
	DLN_BLOCKSIZE					=	64 - DLN_BOOT_CMD_SIZE

	# bulk endpoints
	DLN_IN_EP						=	0x81	# endpoint for Bulk reads
	DLN_OUT_EP						=	0x01	# endpoint for Bulk writes

	# configuration
	DLN_ACTIVE_CONFIG				=	0x01
	DLN_INTERFACE_ID				=	0x00
	DLN_TIMEOUT						=	500
	CTRL_TIMEOUT					=	500
	INT_TIMEOUT						=	500

	MAX_HID_RETRY					=	4

	BOOT_DEFAULT_ADDR				=	0x800	# First 2K occupied by BootLoader
	BOOT_FLASH_ADDR					=	0x00
	BOOT_ID_ADDR					=	0x00200000
	BOOT_CONFIG_ADDR				=	0x00300000
	BOOT_EEPROM_ADDR				=	0x00F00000
	BOOT_FLASH_SIZE					=	0x6000	# Program Memory Size
	BOOT_EEPROM_SIZE				=	0x100	# EEPROM Memory Size
	BOOT_ID_SIZE					=	0x08	# ID Locations Size
	BOOT_CONFIG_SIZE				=	0x0E	# CONFIG Space Size
	BOOT_MEM_COUNT					=	3

	MEM_FLASH						=	0x01
	MEM_ID							=	0x02
	MEM_EEPROM						=	0x04
	MEM_ALL							=	MEM_FLASH | MEM_ID | MEM_EEPROM

	# Error codes returned by various functions
	# --------------------------------------------------------------------------

	ERR_NONE						=	0
	ERR_CMD_ARG						=	1
	ERR_CMD_UNKNOWN					=	2
	ERR_DEVICE_NOT_FOUND			=	3
	ERR_USB_INIT1					=	4
	ERR_USB_INIT2					=	5
	ERR_USB_OPEN					=	6
	ERR_USB_WRITE					=	7
	ERR_USB_READ					=	8
	ERR_HEX_OPEN					=	9
	ERR_HEX_STAT					=	10
	ERR_HEX_MMAP					=	11
	ERR_HEX_SYNTAX					=	12
	ERR_HEX_CHECKSUM				=	13
	ERR_HEX_RECORD					=	14
	ERR_VERIFY						=	15
	ERR_EOL							=	16

# ------------------------------------------------------------------------------
	def txtWrite(self, output, message):
		""" display message in the log window """
		#if gui==True:
		output.WriteText(message)
		#else:
		#	print message
		return
# ------------------------------------------------------------------------------
	def getDevice(self, board):
		""" get list of USB devices and search for pinguino """
		busses = usb.busses()
		for bus in busses:
			for device in bus.devices:
				if device.idVendor == board.vendor and device.idProduct == board.product:
					return device
		return self.ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
	def initDevice(self, device):
		""" init pinguino device """
		handle = device.open()

		if handle:
			try:
				# make sure the hiddev kernel driver is not active
				handle.detachKernelDriver(self.DLN_INTERFACE_ID)
			except usb.USBError:
				pass
			handle.setConfiguration(self.DLN_ACTIVE_CONFIG)
			handle.claimInterface(self.DLN_INTERFACE_ID)
			return handle
		return self.ERR_USB_INIT1
# ------------------------------------------------------------------------------
	def closeDevice(self, handle):
		""" Close currently-open USB device """
		handle.releaseInterface()
# ------------------------------------------------------------------------------
    def usbWrite(self, handle, usbBuf):  
		"""	Write a data packet to currently-open USB device """
		# bmRequestType = Host to Device, Class type, Interface recipient
		# bRequest      = SET_REPORT
		# wValue        = 0
		# wIndex        = 0
		# wSize         = determined by libusb

		#controlMsg(requestType, request, buffer, value=0, index=0, timeout=100) -> bytesWritten|buffer
		#Performs a control request to the default control pipe on a device.
		#Arguments:
		#        requestType: specifies the direction of data flow, the type
		#                     of request, and the recipient.
		#        request: specifies the request.
		#        buffer: if the transfer is a write transfer, buffer is a sequence 
		#                with the transfer data, otherwise, buffer is the number of
		#                bytes to read.
		#        value: specific information to pass to the device. (default: 0)
		#        index: specific information to pass to the device. (default: 0)
		#        timeout: operation timeout in miliseconds. (default: 100)
		#Returns the number of bytes written.
		sent_bytes = handle.controlMsg(0x21, 0x09, usbBuf, 0x00, 0x00, self.DLN_TIMEOUT)
		if sent_bytes == len(usbBuf):
			return self.ERR_NONE
		else:		
			return self.ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def transaction(self, handle, cmd, rsp):
		self.sendCommand(handle, cmd)
		retval = handle.interruptRead(1, len(rsp), self.DLN_TIMEOUT)
		if retval < 0 or retval != len(rsp):
			return self.ERR_NONE
		else:		
			return self.ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def eraseBlock(self, handle, address):
		""" erase 64 bytes of flash memory """
		# command code
		cmd = self.DLN_ERASE_FLASH_CMD
		# echo is used to link between command and response
		echo = 0
		# block address (must be divisible by 64) - lo first, hi second
		address = "%06X" % address
		addr_lo = int(address[4:6],16)
		addr_hi = int(address[2:4],16)
		#addr_up = int(address[0:2],16)  => always null ?
		# reserved
		reserved = 0
		# size in 64 byte blocks
		size = 1
		# write data packet
		usbBuf = chr(cmd) + chr(echo) + chr(addr_lo) + chr(addr_hi) + chr(reserved) + chr(size)
		self.usbWrite(handle, usbBuf)
# ------------------------------------------------------------------------------
	def issueBlock(self, handle, address, block):
		""" write a block of code """
		# command code
		cmd = self.DLN_WRITE_FLASH_CMD 
		# echo is used to link between command and response
		echo = 0
		# block's address (must be divisible by 2)
		address = "%06X" % address
		addr_lo = int(address[4:6], 16)
		addr_hi = int(address[2:4], 16)
		#addr_up = int(address[0:2], 16)
		# reserved
		reserved = 0
		# size must be divisible by 8
		size = len(block)
		# add data to the packet
		usbBuf = chr(cmd) + chr(echo) + chr(addr_lo) + chr(addr_hi) + chr(reserved) + chr(size)
		for i in range(len(block)):
			usbBuf = usbBuf + chr(block[i])
		# write data packet on usb device
		self.usbWrite(handle, usbBuf)
# ------------------------------------------------------------------------------
	def hexWrite(self, output, handle, filename, board):
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

		data = []
		old_address = 0
		max_address = 0
		address_Hi	= 0
		codesize	= 0

		# read hex file
		# ----------------------------------------------------------------------

		fichier = open(filename,'r')
		lines = fichier.readlines()
		fichier.close()

		# 1st pass : calculate checksum and max address
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
				return self.ERR_HEX_CHECKSUM

			# extended linear address record
			if record_type == self.Extended_Linear_Address_Record:
				address_Hi = int(line[9:13], 16) << 16 # upper 16 bits (bits 16-31) of the data address
				address = (address_Hi << 16) + address_Lo

			# code size
			if address >= board.memstart:
				codesize = codesize + byte_count

			# max address
			if (address > old_address) and (address < board.memend):
				max_address = address + byte_count
				old_address = address

		max_address = max_address + 64 - (max_address % 64)
		self.txtWrite(output, "%d bytes to write\n" % codesize)

		# fill data sequence with 0xFF
		# ----------------------------------------------------------------------
		# 32-bit : mem start at 0x9D0000000000 ?

		for i in range(board.memstart, max_address):
			print i
			data.append(0xFF)

		# 2nd pass : parse bytes from line into data
		# ----------------------------------------------------------------------

		address_Hi	= 0

		for line in lines:
			byte_count = int(line[1:3], 16)
			address_Lo = int(line[3:7], 16) # four hex digits
			#print "address_Lo = " + hex(address_Lo)
			record_type= int(line[7:9], 16)

			address = (address_Hi << 16) + address_Lo

			# data record
			if record_type == self.Data_Record:
				if (address >= board.memstart) and (address < board.memend):
					for i in range(0, byte_count):
						data[address + i] = int(line[9 + (2 * i) : 11 + (2 * i)], 16)

			# end of file record
			elif record_type == self.End_Of_File_Record:
				break

			# extended linear address record
			elif record_type == self.Extended_Linear_Address_Record:
				address_Hi = int(line[9:13], 16) # upper 16 bits (bits 16-31) of the data address
				#print "address_Hi = " + hex(address_Hi)

			# unsupported record type
			else:
				return self.ERR_HEX_RECORD

		# erase and write blocks 
		# ----------------------------------------------------------------------

		usbBuf = []
		for i in range(board.memstart, max_address):
			if i % 64 == 0:
				self.eraseBlock(handle, i)
			if i % self.BLOCKSIZE == 0:
				if usbBuf != []:
					self.issueBlock(handle, i - self.DLN_BLOCKSIZE, usbBuf)
				usbBuf = []
			if data[i] != []:
				usbBuf.append(data[i])

		return self.ERR_NONE
# ------------------------------------------------------------------------------
	def writeHex(self, output, filename, board):

		device = self.getDevice(board)
		if device is self.ERR_DEVICE_NOT_FOUND:
			self.txtWrite(output, "Pinguino not found\n")
			self.txtWrite(output, "Is your device connected and/or in bootloader mode ?\n")
			return
		else:
			self.txtWrite(output, "Pinguino found\n")

		handle = self.initDevice(device)
		if handle is self.ERR_USB_INIT1:
			self.txtWrite(output, "Upload not possible\n")
			self.txtWrite(output, "Try to restart the bootloader mode\n")
			return
		print "Vendor: %s - %s" % (hex(device.idVendor), handle.getString(device.iManufacturer, 30))
		print "Product: %s - %s" % (hex(device.idProduct), handle.getString(device.iProduct, 30))
		print "Serial: %s" % handle.getString(device.iSerialNumber, 30)
		#self.getDeviceFamily(self, handle):
		#self.getProgramMemory(self, handle):

		if filename != '':
			self.txtWrite(output, "Writing ")
			status = self.hexWrite(output, handle, filename, board)
			if status == self.ERR_NONE:
				self.txtWrite(output, os.path.basename(filename) + " successfully uploaded\n")
			if status == self.ERR_HEX_RECORD:
				self.txtWrite(output, "Record error\n")
			if status == self.ERR_HEX_CHECKSUM:
				self.txtWrite(output, "Checksum error\n")
		else:
			self.txtWrite(output, "No program to write\n")

		self.txtWrite(output, "Resetting device ...\n")
		self.sendCommand(handle, self.DLN_RESET_CMD)

		self.closeDevice(self, handle)
# ------------------------------------------------------------------------------
