#!/usr/bin/env python
#-*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
	Pinguino Universal Uploader

	(c) 2011 Regis Blanchot <rblanchot@gmail.com> 

	This library is free software; you can redistribute it and/or
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
# - Docker software licensed (LGPL) by Pierre Gaufillet <pierre.gaufillet@magic.fr> 
# - Vasco  software licensed (LGPL) by Jean-Pierre Mandon <jp.mandon@gmail.com>
# - UBW32  software licensed (LGPL) by Phillip Burgess <pburgess@dslextreme.com>
# - Diolan software licenced (LGPL) by Diolan <http://www.diolan.com>
# PyUSB Doc can be found here: http://wiki.erazor-zone.de/wiki:projects:python:pyusb:pydoc
# To get the Device Descriptors : lsusb -v -d 04d8:feaa (P8) or lsusb -v -d 04d8:003C (P32)

import sys
import os
import time
import usb			# checked in check.py

class uploader:
	""" upload .hex into pinguino device """

	# General values
	# --------------------------------------------------------------------------

	INTERFACE_ID					=	0x00
	TIMEOUT							=	1000
	IN_EP							=	0x81
	OUT_EP							=	0x01
	ACTIVE_CONFIG					=	0
	RESET_CMD						=	0
	BOOT_CMD_SIZE					=	0
	BLOCKSIZE						=	0
	BASE_ADDRESS					=	0
	
	# Device family
	DEVICE_FAMILY_PIC18				=	0x01
	DEVICE_FAMILY_PIC24				=	0x02
	DEVICE_FAMILY_PIC32				=	0x03

	# operations
	USB_READ						=	1
	USB_WRITE						=	0
	
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
	DLN_ACTIVE_CONFIG				=	1
	
	# Vasco Bulk bootloader commands
	# --------------------------------------------------------------------------

	VSC_ERASE_FLASH_CMD				=	0x00
	VSC_WRITE_FLASH_CMD				=	0x01
	VSC_READ_FLASH_CMD				=	0x02
	VSC_VALID_APPLICATION_CMD		=	0x03
	VSC_RESET_DEVICE_CMD			=	0x04
	VSC_SECTION_DESCRIPTOR_CMD		=	0x05

	# boot command size in bytes
	VSC_BOOT_CMD_SIZE				=	4
	VSC_BLOCKSIZE					=	32

	# bulk endpoints
	VSC_IN_EP						=	0x82	# endpoint for Bulk reads
	VSC_OUT_EP						=	0x01	# endpoint for Bulk writes

	# configuration
	VSC_ACTIVE_CONFIG				=	2

	# Microchip Hid bootloader commands
	# --------------------------------------------------------------------------

	MCC_QUERY_DEVICE_CMD			=	0x02	# what regions can be programmed, and what type of memory is the region
	MCC_UNLOCK_CONFIG_CMD			=	0x03	# for both locking and unlocking the config bits
	MCC_ERASE_DEVICE_CMD			=	0x04	# to start an erase operation, firmware controls which pages should be erased
	MCC_PROGRAM_DEVICE_CMD			=	0x05	# to send a full RequestDataBlockSize to be programmed
	MCC_PROGRAM_COMPLETE_CMD		=	0x06	# if host send less than a RequestDataBlockSize to be programmed, or if it wished to program whatever was left in the buffer, it uses this command
	MCC_GET_DATA_CMD				=	0x07	# the host sends this command in order to read out memory from the device. Used during verify (and read/export hex operations)
	MCC_RESET_DEVICE_CMD			=	0x08	# resets the microcontroller, so it can update the config bits (if they were programmed, and so as to leave the bootloader (and potentially go back into the main application)

	# boot command size in bytes
	MCC_BOOT_CMD_SIZE				=	8
	MCC_BLOCKSIZE					=	64 - MCC_BOOT_CMD_SIZE

	# Unlock Configs Command Definitions
	MCC_UNLOCKCONFIG_CMD			=	0x00	# sub-command for the MCC_ERASE_DEVICE_CMD
	MCC_LOCKCONFIG_CMD				=	0x01	# sub-command for the MCC_ERASE_DEVICE_CMD

	# Query Device Response "Types"
	TypeProgramMemory				=	0x01	# when the host sends a QUERY_DEVICE command, need to respond by populating a list of valid memory regions that exist in the device (and should be programmed)
	TypeEEPROM						=	0x02
	TypeConfigWords					=	0x03
	TypeEndOfTypeList				=	0xFF	# sort of serves as a "null terminator" like number, which denotes the end of the memory region list has been reached.

	# hid endpoints
	MCC_IN_EP						=	0x81	# endpoint for Hid reads
	MCC_OUT_EP						=	0x01	# endpoint for Hid writes

	# configuration
	MCC_ACTIVE_CONFIG				=	1

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
	def bytes(*b):
		return "".join([chr(x) for x in b])
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
	def initDevice(self, device, board):
		""" init pinguino device """
		#conf = device.configurations[0]
		#print "confs", device.configurations
		#iface = conf.interfaces[0][0]
		#print "ifaces[0]", conf.interfaces[0]
		#endpoint = iface.endpoints[0]
		#print "endpoints", iface.endpoints
		handle = device.open()

		if handle:
			try:
				# make sure the hiddev kernel driver is not active
				handle.detachKernelDriver(self.INTERFACE_ID)
			except usb.USBError:
				pass
				#return self.ERR_USB_INIT1

			handle.setConfiguration(self.ACTIVE_CONFIG)
			handle.claimInterface(self.INTERFACE_ID)
			#handle.setAltInterface(self.INTERFACE_ID)
			#handle.reset()
			return handle
		return self.ERR_USB_INIT1
# ------------------------------------------------------------------------------
	def closeDevice(self, handle):
		handle.releaseInterface()
# ------------------------------------------------------------------------------
	def getDeviceName(self, handle):  
		return handle.getString(2, 40)
# ------------------------------------------------------------------------------
	def usbWrite(self, board, handle, usbBuf):
		"""	Write a data packet to currently-open USB device """

		#return self.ERR_NONE
		if board.bldr == 'vasco':
			sent_bytes = handle.bulkWrite(self.OUT_EP, usbBuf, self.TIMEOUT)
		else:
			sent_bytes = handle.interruptWrite(self.OUT_EP, usbBuf, self.TIMEOUT)

		if (sent_bytes): 
			return self.ERR_NONE
		else:
			return self.ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def complete(self, board, handle):
		self.txtWrite(output, "completing ...\n")
		# command
		cmd = self.MCC_PROGRAM_COMPLETE_CMD
		handle.interruptWrite(self.MCC_OUT_EP, chr(cmd), self.TIMEOUT)
# ------------------------------------------------------------------------------
	def queryDevice(self, handle):
		# command
		cmd = self.MCC_QUERY_DEVICE_CMD
		handle.interruptWrite(self.MCC_OUT_EP, chr(cmd), self.TIMEOUT)
		usbBuf = handle.interruptRead(self.MCC_IN_EP, 1, self.TIMEOUT)
		j=3
		while usbBuf[j] != self.TypeEndOfTypeList:
			if usbBuf[j] == self.TypeProgramMemory:
				print usbBuf[j + 5]
				bf=1
				self.txtWrite(output, ": %d bytes free" % bf)
			j = j + 9
# ------------------------------------------------------------------------------
	def resetDevice(self, handle):
		self.txtWrite(output, "resetting device ...\n")
		handle.interruptWrite(self.OUT_EP, chr(self.RESET_CMD), self.TIMEOUT)
# ------------------------------------------------------------------------------
	def eraseBlock(self, board, handle, address):
		""" erase 64 bytes of flash memory """

		if board.bldr == 'vasco':
			# command
			cmd = self.VSC_ERASE_FLASH_CMD
			# block address
			address = "%06X" % address
			addr_lo = int(address[4:6],16)
			addr_hi = int(address[2:4],16)
			addr_up = int(address[0:2],16)
			#
			usbBuf = chr(cmd) + chr(addr_lo) + chr(addr_hi) + chr(addr_up)

		elif board.bldr == 'diolan':
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
			#
			usbBuf = chr(cmd) + chr(echo) + chr(addr_lo) + chr(addr_hi) + chr(reserved) + chr(size)

		elif board.bldr == 'microchip':
			# command
			cmd = self.MCC_ERASE_DEVICE_CMD
			# block address
			address = "%08X" % address
			readbyte1 = int(address[6:8], 16)
			readbyte2 = int(address[4:6], 16)
			readbyte3 = int(address[2:4], 16)
			readbyte4 = int(address[0:2], 16)
			#
			usbBuf = chr(cmd) + chr(readbyte1) + chr(readbyte2) + chr(readbyte3) + chr(readbyte4)

		# write data packet
		self.usbWrite(board, handle, usbBuf)
# ------------------------------------------------------------------------------
	def issueBlock(self, output, board, handle, address, block):
		""" write a block of code """

		if board.bldr == 'vasco':					
			# command
			cmd = self.VSC_WRITE_FLASH_CMD 
			# block's address
			address = "%06X" % address
			readbyte1 = int(address[4:6], 16)
			readbyte2 = int(address[2:4], 16)
			readbyte3 = int(address[0:2], 16)
			#
			usbBuf = chr(cmd) + chr(readbyte1) + chr(readbyte2) + chr(readbyte3)

		elif board.bldr == 'diolan':					
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
			#
			usbBuf = chr(cmd) + chr(echo) + chr(addr_lo) + chr(addr_hi) + chr(reserved) + chr(size)

		elif board.bldr == 'microchip':
			# command code
			cmd = self.MCC_PROGRAM_DEVICE_CMD 
			# block's address
			address = "%08X" % address
 			addr0 = int(address[0:2], 16)	# (address >> 24)
			addr1 = int(address[2:4], 16)	# (address >> 16) & 0xFF
			addr2 = int(address[4:6], 16)	# (address >>  8) & 0xFF
			addr3 = int(address[6:8], 16)	#  address        & 0xFF
			# data's length
			buflen = len(block)
			# 
			usbBuf = chr(cmd) + chr(addr0) + chr(addr1) + chr(addr2) + chr(addr3) + chr(buflen)

		# add data to the packet
		for i in range(len(block)):
			usbBuf = usbBuf + chr(block[i])

		# write data packet on usb device
		self.usbWrite(board, handle, usbBuf)
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

		i = 0
		for line in lines:
			byte_count = int(line[1:3], 16)
			address_Lo = int(line[3:7], 16) # lower 16 bits (bits 0-15) of the data address
			if i == 1:
				BASE_ADDRESS = address_Lo
				print "BASE_ADDRESS = " + hex(BASE_ADDRESS)
			record_type= int(line[7:9], 16)
			i+=1
			
			#address = (address_Hi << 16) + address_Lo

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
			#if record_type == self.Extended_Linear_Address_Record:
			#	address_Hi = int(line[9:13], 16) << 16 # upper 16 bits (bits 16-31) of the data address

			# code size
			#if address >= board.memstart:
			codesize = codesize + byte_count

			# max address
			if (address_Lo > old_address): #and (address < board.memend):
				max_address = address_Lo + byte_count
				old_address = address_Lo

		max_address = max_address + 64 - (max_address % 64)
		self.txtWrite(output, "%d bytes to write\n" % codesize)

		# fill data sequence with 0xFF
		# ----------------------------------------------------------------------
		# 32-bit : mem start at 0x9D0000000000 ?

		for i in range(BASE_ADDRESS, max_address):
			print i
			data.append(0xFF)

		# 2nd pass : parse bytes from line into data
		# ----------------------------------------------------------------------

		#address_Hi	= 0

		for line in lines:
			byte_count = int(line[1:3], 16)
			address_Lo = int(line[3:7], 16) # four hex digits
			#print "address_Lo = " + hex(address_Lo)
			record_type= int(line[7:9], 16)

			#address = (address_Hi << 16) + address_Lo

			# data record
			if record_type == self.Data_Record:
				if (address_Lo >= board.memstart): #and (address < board.memend):
					for i in range(0, byte_count):
						data[address_Lo - BASE_ADDRESS + i] = int(line[9 + (2 * i) : 11 + (2 * i)], 16)

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

		#index = 0
		usbBuf = []
		percent = (max_address - BASE_ADDRESS) / 100 #board.memstart
		self.txtWrite(output, "writing ")
		#for i in range(board.memstart, max_address):
		for i in range(BASE_ADDRESS, max_address):
			if i % percent == 0:
				# progress bar
				self.txtWrite(output, ".")
			if i % 64 == 0:
				self.eraseBlock(board, handle, (address_Hi << 16) + i)
			if i % self.BLOCKSIZE == 0:
				#index = 0
				if usbBuf != []:
					self.issueBlock(output, board, handle, (address_Hi << 16) + i - self.BLOCKSIZE, usbBuf)
				usbBuf = []
			if data[i] != []:
				usbBuf.append(data[i])
			#index += 1 
		self.txtWrite(output, "\n")

		return self.ERR_NONE
# ------------------------------------------------------------------------------
	def release(self, handle):
		""" release USB interface """
		handle.releaseInterface()
# ------------------------------------------------------------------------------
	def writeHex(self, output, filename, board):

		if board.bldr == 'vasco':
			self.IN_EP			=	self.VSC_IN_EP
			self.OUT_EP			=	self.VSC_OUT_EP
			self.ACTIVE_CONFIG	=	self.VSC_ACTIVE_CONFIG
			self.BOOT_CMD_SIZE	=	self.VSC_BOOT_CMD_SIZE
			self.RESET_CMD		=	self.VSC_RESET_DEVICE_CMD
			self.BLOCKSIZE		=	self.VSC_BLOCKSIZE
		elif board.bldr == 'diolan':
			self.IN_EP			=	self.DLN_IN_EP
			self.OUT_EP			=	self.DLN_OUT_EP
			self.ACTIVE_CONFIG	=	self.DLN_ACTIVE_CONFIG
			self.BOOT_CMD_SIZE	=	self.DLN_BOOT_CMD_SIZE
			self.RESET_CMD		=	self.DLN_RESET_CMD
			self.BLOCKSIZE		=	self.DLN_BLOCKSIZE
		elif board.bldr == 'microchip':
			self.IN_EP			=	self.MCC_IN_EP
			self.OUT_EP			=	self.MCC_OUT_EP
			self.TIMEOUT		=	0
			self.ACTIVE_CONFIG	=	self.MCC_ACTIVE_CONFIG
			self.BOOT_CMD_SIZE	=	self.MCC_BOOT_CMD_SIZE
			self.RESET_CMD		=	self.MCC_RESET_DEVICE_CMD
			self.BLOCKSIZE		=	self.MCC_BLOCKSIZE

		device = self.getDevice(board)
		if device is self.ERR_DEVICE_NOT_FOUND:
			self.txtWrite(output, "Pinguino not found\n")
			self.txtWrite(output, "Is your device connected and/or in bootloader mode ?\n")
			return
		else:
			self.txtWrite(output, "Pinguino found\n")

		handle = self.initDevice(device, board)
		if handle is self.ERR_USB_INIT1:
			self.txtWrite(output, "Upload not possible\n")
			self.txtWrite(output, "Try to restart the bootloader mode\n")
			return
		#print "Vendor: %s - %s" % (hex(device.idVendor), handle.getString(device.iManufacturer, 30))
		#print "Product: %s - %s" % (hex(device.idProduct), handle.getString(device.iProduct, 30))
		#print "Serial: %s" % handle.getString(device.iSerialNumber, 30)
		self.txtWrite(output, self.getDeviceName(handle) + "\n")
		#self.getDeviceFamily(self, handle):
		#self.getProgramMemory(self, handle):
		#self.queryDevice(handle)

		if filename != '':
			status = self.hexWrite(output, handle, filename, board)
			if status == self.ERR_NONE:
				self.txtWrite(output, os.path.basename(filename) + " successfully uploaded\n")
			if status == self.ERR_HEX_RECORD:
				self.txtWrite(output, "Record error\n")
			if status == self.ERR_HEX_CHECKSUM:
				self.txtWrite(output, "Checksum error\n")
		else:
			self.txtWrite(output, "No .hex file to write\n")

		self.resetDevice(self, handle)
		self.closeDevice(self, handle)
# ------------------------------------------------------------------------------
