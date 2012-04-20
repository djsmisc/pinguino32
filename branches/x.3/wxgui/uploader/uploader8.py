#!/usr/bin/env python
#-*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
	Pinguino Universal Uploader

	Author:			Regis Blanchot <rblanchot@gmail.com> 
	Last release:	2012-04-20
	
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
# - Diolan USB bootloader licenced (LGPL) by Diolan <http://www.diolan.com>
# - jallib USB bootloader licenced (BSD) by Albert Faber
# See also PyUSB Doc. http://wiki.erazor-zone.de/wiki:projects:python:pyusb:pydoc
# Pinguino Device Descriptors : lsusb -v -d 04d8:feaa

import sys
import os
import usb			# checked in check.py

class uploader8:
	""" upload .hex into pinguino device """

	# --------------------------------------------------------------------------
	memstart						= 0x1000		# bootloader offset
	memend							= 0
	# --------------------------------------------------------------------------

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

	# Block's size to write (TODO : should be 32)
	# --------------------------------------------------------------------------
	BLOCKSIZE						=	16

	# bulk endpoints
	# --------------------------------------------------------------------------
	IN_EP							=	0x81	# endpoint for Bulk reads
	OUT_EP							=	0x01	# endpoint for Bulk writes

	# configuration
	# --------------------------------------------------------------------------
	ACTIVE_CONFIG					=	0x01
	INTERFACE_ID					=	0x00
	TIMEOUT							=	1200

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

		0x4C00: ['18f24j50'	, 0x04000, 0x00 ],
		0x4CC0: ['18lf24j50', 0x04000, 0x00 ],
		
		0x1240: ['18f2550'	, 0x08000, 0xFF ],
		0x2A40: ['18f2553'	, 0x08000, 0xFF ],

		0x4C20: ['18f25j50'	, 0x08000, 0x00 ],
		0x4CE0: ['18lf25j50', 0x08000, 0x00 ],
		
		0x4C40: ['18f26j50'	, 0x10000, 0x00 ],
#modified below to avoid erasing on configuration bits	
		0x4D00: ['18lf26j50', 0x0FC00, 0x00 ],
		
		0x1200: ['18f4450'	, 0x04000, 0x00 ],
		0x1220: ['18f4455'	, 0x06000, 0x00 ],
		0x2A20: ['18f4458'	, 0x06000, 0xFF ],
		
		0x4C60: ['18f44j50'	, 0x04000, 0x00 ],
		0x4D20: ['18lf44j50', 0x04000, 0x00 ],
		
		0x1200: ['18f4550'	, 0x08000, 0xFF ],
		0x2A00: ['18f4553'	, 0x08000, 0xFF ],
		
		0x4C80: ['18f45j50'	, 0x08000, 0x00 ],
		0x4D40: ['18lf45j50', 0x08000, 0x00 ],
		
		0x4CA0: ['18f46j50'	, 0x10000, 0x00 ],
		0x4D60: ['18f46j50'	, 0x10000, 0x00 ],
		
		0x4100: ['18f65j50'	, 0x08000, 0x00 ],
		0x1560: ['18f66j50'	, 0x10000, 0x00 ],
		0x4160: ['18f66j55'	, 0x18000, 0x00 ],
		0x4180: ['18f67j50'	, 0x20000, 0x00 ],
		0x41A0: ['18f85j50'	, 0x08000, 0x00 ],
		0x41E0: ['18f86j50'	, 0x10000, 0x00 ],
		0x1F40: ['18f86j55'	, 0x18000, 0x00 ],
		0x4220: ['18f87j50'	, 0x20000, 0x00 ]
	}

# ------------------------------------------------------------------------------
	def initDevice(self, device):
# ------------------------------------------------------------------------------
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
		return self.ERR_USB_INIT1
# ------------------------------------------------------------------------------
	def sendCMD(self, handle, usbBuf):  
# ------------------------------------------------------------------------------
		""" send command to the bootloader """
		sent_bytes = handle.bulkWrite(self.OUT_EP, usbBuf, self.TIMEOUT)
		if sent_bytes == len(usbBuf):
			return handle.bulkRead(self.IN_EP, 64, self.TIMEOUT)
			#return ERR_NONE
		else:		
			return ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def usbWrite(self, usbBuf):  
# ------------------------------------------------------------------------------
		"""
		controlMsg(requestType, request, buffer, value=0, index=0, timeout=100) -> bytesWritten|buffer
		Performs a control request to the default control pipe on a device.
		Arguments:
			requestType: specifies the direction of data flow, the type of request
				and the recipient.
				= Host to Device, Class type, Interface recipient
				= usb.TYPE_CLASS | usb.RECIP_INTERFACE | usb.ENDPOINT_OUT
				= 0x21
			request: specifies the request.
				= SET_REPORT
				= 0x9
			buffer: if the transfer is a write transfer, buffer is a sequence 
				with the transfer data, otherwise, buffer is the number of
				bytes to read.
			value: specific information to pass to the device. (default: 0)
				= 0
			index: specific information to pass to the device. (default: 0)
				= 0
			timeout: operation timeout in miliseconds. (default: 100)
		Returns the number of bytes written.
		"""
		sent_bytes = handle.controlMsg(0x21, 0x09, usbBuf, 0x00, 0x00, self.DLN_TIMEOUT)
		if sent_bytes == len(usbBuf):
			return self.ERR_NONE
		else:		
			return self.ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def transaction(self, handle, usbBuf):
# ------------------------------------------------------------------------------
		"""
		Write a data packet to currently-open USB device 
		Return 64 bytes from the device

		interruptRead(endpoint, size, timeout=100) -> buffer
		Performs a interrupt read request to the endpoint specified.
		Arguments:
			endpoint: endpoint number.
			size: number of bytes to read.
			timeout: operation timeout in miliseconds. (default: 100)
		Returns a tuple with the data read.
		"""
		retry = 0
		while retry < self.MAX_HID_RETRY:
			status = self.usbWrite(handle, usbBuf)
			if status == self.ERR_NONE:
				return handle.interruptRead(1, 64, self.DLN_TIMEOUT)
				#return handle.interruptRead(1, len(usbBuf), self.DLN_TIMEOUT)
			else:
				retry = retry + 1
		return self.ERR_USB_WRITE
# ------------------------------------------------------------------------------
	def resetDevice(self, handle):
# ------------------------------------------------------------------------------
		""" reset device """
		usbBuf = [0] * 1
		# command code
		usbBuf[self.BOOT_CMD] = self.RESET_CMD
		# write data packet
		sendCMD(handle, usbBuf)
# ------------------------------------------------------------------------------
	def getVersion(self, handle):
# ------------------------------------------------------------------------------
		""" get bootloader version """
		usbBuf = [0] * 64
		# command code
		usbBuf[self.BOOT_CMD] = self.READ_VERSION_CMD
		# write data packet and get response
		usbBuf = self.sendCMD(handle, usbBuf)
		if usbBuf == self.ERR_USB_WRITE:
			return self.ERR_USB_WRITE
		else:		
			# major.minor.subminor
			return	str(usbBuf[self.BOOT_VER_MAJOR]) + "." + \
					str(usbBuf[self.BOOT_VER_MINOR])
# ------------------------------------------------------------------------------
	def getDeviceID(self, handle):
# ------------------------------------------------------------------------------
		""" read 2-byte device ID from location 0x3FFFFE """
		usbBuf = self.readFlash(handle, 0x3FFFFE, 2)
		if usbBuf == self.ERR_USB_WRITE:
			return self.ERR_USB_WRITE
		else:		
			#print "BUFFER =", usbBuf
			dev1 = usbBuf[self.BOOT_DEV1]
			#print "DEV1 =", dev1
			dev2 = usbBuf[self.BOOT_DEV2]
			#print "DEV2 =", dev2
			device_id = (int(dev2) << 8) + int(dev1)
			#print device_id
			device_rev = device_id & 0x001F
			# mask revision number
			return device_id  & 0xFFE0
# ------------------------------------------------------------------------------
	def getDeviceFlash(self, device_id, board):
# ------------------------------------------------------------------------------
		for n in self.devices_table:
			if n == device_id:
				return self.devices_table[n][1] - self.memstart			
		return self.ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
	def getDeviceName(self, device_id):
# ------------------------------------------------------------------------------
		for n in self.devices_table:
			if n == device_id:
				return self.devices_table[n][0]
		return self.ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
	def eraseFlash(self, handle, address, size64):
# ------------------------------------------------------------------------------
		""" erase n * 64-byte blocks of flash memory """
		usbBuf = [0] * 64
		# command code
		usbBuf[self.BOOT_CMD] = self.ERASE_FLASH_CMD
		# block address (must be divisible by 64)
		usbBuf[self.BOOT_ADDR_LO] = (address      ) & 0xFF
		usbBuf[self.BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
		usbBuf[self.BOOT_ADDR_UP] = (address >> 16) & 0xFF
		# size in 64 byte blocks
		usbBuf[self.BOOT_SIZE64] = size64
		# write data packet and get response
		#print usbBuf
		usbBuf = self.sendCMD(handle, usbBuf)
		#print usbBuf
# ------------------------------------------------------------------------------
	def readFlash(self, handle, address, length):
# ------------------------------------------------------------------------------
		""" read a block of flash """
		usbBuf = [0] * 64
		# command code
		usbBuf[self.BOOT_CMD] = self.READ_FLASH_CMD 
		# address
		usbBuf[self.BOOT_ADDR_UP] = (address >> 16) & 0xFF
		usbBuf[self.BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
		usbBuf[self.BOOT_ADDR_LO] = (address      ) & 0xFF
		# size of block
		usbBuf[self.BOOT_CMD_LEN] = length
		# send request to the bootloader
		#usbBuf = sendCMD(handle, usbBuf)
		handle.bulkWrite(self.OUT_EP, usbBuf, self.TIMEOUT)
		return handle.bulkRead(self.IN_EP, self.BOOT_DATA_START + length, self.TIMEOUT)
# ------------------------------------------------------------------------------
	def writeFlash(self, handle, address, block):
# ------------------------------------------------------------------------------
		""" write a block of code """
		usbBuf = [0xFF] * 64
		# command code
		usbBuf[self.BOOT_CMD] = self.WRITE_FLASH_CMD 
		# block's address
		usbBuf[self.BOOT_ADDR_LO] = (address      ) & 0xFF
		usbBuf[self.BOOT_ADDR_HI] = (address >> 8 ) & 0xFF
		usbBuf[self.BOOT_ADDR_UP] = (address >> 16) & 0xFF
		# size of block
		usbBuf[self.BOOT_CMD_LEN] = len(block)
		# add data to the packet
		for i in range(0, 16):
			usbBuf[self.BOOT_DATA_START + i] = block[i]
		# write data packet on usb device
		#print usbBuf
		usbBuf = self.sendCMD(handle, usbBuf)
		#print usbBuf
# ------------------------------------------------------------------------------
	def hexWrite(self, handle, filename, board):
# ------------------------------------------------------------------------------
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
				return self.ERR_HEX_CHECKSUM

			# extended linear address record
			if record_type == self.Extended_Linear_Address_Record:
				address_Hi = int(line[9:13], 16) << 16 # upper 16 bits (bits 16-31) of the data address
				address = (address_Hi << 16) + address_Lo

			# code size
			if address >= self.memstart:
				codesize = codesize + byte_count

			# max address
			if (address > old_address) and (address < self.memend):
				max_address = address + byte_count
				old_address = address

		max_address = max_address + 64 - (max_address % 64)
		#print self.memstart, max_address, self.memend

		# fill data sequence with 0xFF
		# ----------------------------------------------------------------------

		for i in range(max_address - self.memstart):
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
			#print hex(address)

			# data record
			if record_type == self.Data_Record:
				if (address >= self.memstart) and (address < self.memend):
					#print hex(address)
					for i in range(byte_count):
						#print address - self.memstart + i
						#print int(line[9 + (2 * i) : 11 + (2 * i)], 16)
						data[address - self.memstart + i] = int(line[9 + (2 * i) : 11 + (2 * i)], 16)
					
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

		# erase memory from self.memstart to max_address 
		# ----------------------------------------------------------------------

		if "j" in board.proc :
			sizeMax = (self.memend - self.memstart) / 1024
			size1024 = (max_address - self.memstart) / 1024
			if size1024 > sizeMax:
				return self.ERR_USB_ERASE
			else:
				eraseFlash(handle, self.memstart, size1024)
		else:
			size64 = (max_address - self.memstart) / 64
			if size64 > 511:
				return self.ERR_USB_ERASE
			if size64 < 256:
				self.eraseFlash(handle, self.memstart, size64)
			else:
				# erase flash memory from self.memstart to self.memstart + 0x4000
				self.eraseFlash(handle, self.memstart, 255)
				# erase flash memory from self.memstart + 0x4000 to max_address
				size64 = size64 - 255
				self.eraseFlash(handle, self.memstart + 0x4000, size64)

		# write 32-bit blocks
		# ----------------------------------------------------------------------

		usbBuf = []
		for addr in range(self.memstart, max_address):
			index = addr - self.memstart
			#print hex(addr)
			if addr % self.BLOCKSIZE == 0:
				if usbBuf != []:
					#print usbBuf
					self.writeFlash(handle, addr - self.BLOCKSIZE, usbBuf)
				usbBuf = []
			if data[index] != []:
				#print data[addr - self.memstart]
				usbBuf.append(data[index])
		#print "%d bytes written.\n" % codesize

		return self.ERR_NONE
# ------------------------------------------------------------------------------
	def writeHex(self, output, filename, board):
# ------------------------------------------------------------------------------

		# check file to upload
		# ----------------------------------------------------------------------

		if filename == '':
			self.txtWrite(output, "No program to write\n")
			self.closeDevice(handle)
			return

		fichier = open(filename, 'r')
		if fichier == "":
			self.txtWrite(output, "Unable to open %s\n" % filename)
			return
		fichier.close()

		# search for a Pinguino board
		# ----------------------------------------------------------------------

		device = self.getDevice(board)
		if device == self.ERR_DEVICE_NOT_FOUND:
			self.txtWrite(output, "Pinguino not found\n")
			self.txtWrite(output, "Is your device connected and/or in bootloader mode ?\n")
			return
		else:
			self.txtWrite(output, "Pinguino found\n")

		handle = self.initDevice(device)
		if handle == self.ERR_USB_INIT1:
			self.txtWrite(output, "Upload not possible\n")
			self.txtWrite(output, "Try to restart the bootloader mode\n")
			return

		# find out the processor
		# ----------------------------------------------------------------------

		device_id = self.getDeviceID(handle)
		proc = self.getDeviceName(device_id)
		if proc != board.proc:
			self.txtWrite(output, "Compiled for %s but device has %s\n" % (board.proc, proc))
			return
		self.txtWrite(output, "%s (id=%s)\n" % (proc, hex(device_id)))

		# find out flash memory characteristics
		# ----------------------------------------------------------------------

		self.memend = self.getDeviceFlash(device_id)
		memfree = self.memend - self.memstart
		self.txtWrite(output, "%d bytes free (%d KB)\n" % (memfree, memfree/1024))

		# find out bootloader version
		# ----------------------------------------------------------------------

		#product = handle.getString(device.iProduct, 30)
		#manufacturer = handle.getString(device.iManufacturer, 30)
		self.txtWrite(output, "Pinguino HID bootloader %s\n" % self.getVersion(handle))

		# start writing
		# ----------------------------------------------------------------------

		self.txtWrite(output, "Writing ...\n")
		status = self.hexWrite(handle, filename, board)
		if status == self.ERR_NONE:
			self.txtWrite(output, os.path.basename(filename) + " successfully uploaded\n")
		if status == self.ERR_HEX_RECORD:
			self.txtWrite(output, "Record error\n")
			self.closeDevice(handle)
			return
		if status == self.ERR_HEX_CHECKSUM:
			self.txtWrite(output, "Checksum error\n")
			self.closeDevice(handle)
			return
		if status == self.ERR_USB_ERASE:
			self.txtWrite(output, "Erase error\n")
			self.closeDevice(handle)
			return

		# reset and start start user's app.
		# ----------------------------------------------------------------------

		self.txtWrite(output, "Resetting ...\n")
		self.reset(handle)
		self.closeDevice(handle)
		return
# ------------------------------------------------------------------------------
