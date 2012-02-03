#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

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

# based on the DOCKER software licensed by Pierre Gaufillet <pierre.gaufillet@magic.fr> 
# based on the VascoBootloader software by Jean-Pierre Mandon <jp.mandon@gmail.com>
# based on UBW32 bootloader software licensed by Phillip Burgess <pburgess@dslextreme.com>

import sys
import os
import time
import usb			# checked in check.py

class uploader:
	""" upload .hex into pinguino device """

	# Vasco Bulk bootloader commands
	BULK_ERASE_FLASH_CMD			=	0x00
	BULK_WRITE_FLASH_CMD			=	0x01
	BULK_READ_FLASH_CMD			=	0x02
	BULK_VALID_APPLICATION_CMD	=	0x03
	BULK_RESET_DEVICE_CMD		=	0x04
	BULK_SECTION_DESCRIPTOR_CMD=	0x05

	# Microchip Hid bootloader commands
	HID_QUERY_DEVICE_CMD			=	0x02	# what regions can be programmed, and what type of memory is the region
	HID_UNLOCK_CONFIG_CMD		=	0x03	# for both locking and unlocking the config bits
	HID_ERASE_DEVICE_CMD			=	0x04	# to start an erase operation, firmware controls which pages should be erased
	HID_PROGRAM_DEVICE_CMD		=	0x05	# to send a full RequestDataBlockSize to be programmed
	HID_PROGRAM_COMPLETE_CMD	=	0x06	# if host send less than a RequestDataBlockSize to be programmed, or if it wished to program whatever was left in the buffer, it uses this command
	HID_GET_DATA _CMD				=	0x07	# the host sends this command in order to read out memory from the device. Used during verify (and read/export hex operations)
	HID_RESET_DEVICE_CMD			=	0x08	# resets the microcontroller, so it can update the config bits (if they were programmed, and so as to leave the bootloader (and potentially go back into the main application)

	# Unlock Configs Command Definitions
	HID_UNLOCKCONFIG_CMD			=	0x00	# sub-command for the HID_ERASE_DEVICE_CMD
	HID_LOCKCONFIG_CMD			=	0x01	# sub-command for the HID_ERASE_DEVICE_CMD

	# Query Device Response "Types"
	TypeProgramMemory				=	0x01	# when the host sends a QUERY_DEVICE command, need to respond by populating a list of valid memory regions that exist in the device (and should be programmed)
	TypeEEPROM						=	0x02
	TypeConfigWords				=	0x03
	TypeEndOfTypeList				=	0xFF	# sort of serves as a "null terminator" like number, which denotes the end of the memory region list has been reached.

	INTERFACE_ID					=	0x00

	# bulk endpoints
	BULK_IN_EP						=	0x82	# endpoint for Bulk reads
	BULK_OUT_EP						=	0x01	# endpoint for Bulk writes

	# hid endpoints
	HID_IN_EP						=	0x81	# endpoint for Hid reads
	HID_OUT_EP						=	0x01	# endpoint for Bulk writes

	# Device family
	DEVICE_FAMILY_PIC18			=	0x01
	DEVICE_FAMILY_PIC24			=	0x02
	DEVICE_FAMILY_PIC32			=	0x03

	# operations
	USB_READ = 1
	USB_WRITE = 0

	# Error codes returned by various functions
	ERR_NONE = 0
	ERR_CMD_ARG = 1
	ERR_CMD_UNKNOWN = 2
	ERR_DEVICE_NOT_FOUND = 3
	ERR_USB_INIT1 = 4
	ERR_USB_INIT2 = 5
	ERR_USB_OPEN = 6
	ERR_USB_WRITE = 7
	ERR_USB_READ = 8
	ERR_HEX_OPEN = 9
	ERR_HEX_STAT = 10
	ERR_HEX_MMAP = 11
	ERR_HEX_SYNTAX = 12
	ERR_HEX_CHECKSUM = 13
	ERR_HEX_RECORD = 14
	ERR_VERIFY = 15
	ERR_EOL = 16

# ------------------------------------------------------------------------------
	def getDevices(self, board):
		""" get list of USB devices and test for pinguino """
		busses = usb.busses()
		for bus in busses:
			for device in bus.devices:
				if device.idVendor == board.vendor and device.idProduct == board.product:
					return device
		return ERR_DEVICE_NOT_FOUND
# ------------------------------------------------------------------------------
	def initDevice(self, device, board):
		""" get endpoints and init pinguino device """
		if board.arch == 8:
			self.getEndpoint(device, 2)
		else:
			self.getEndpoint(device, 1)
		handle = device.open()
		if handle:
			try:
				# make sure the hiddev kernel driver is not active
				handle.detachKernelDriver(self.iface)
			except usb.USBError:
				pass
			try:			
				handle.reset()
			except usb.USBError:
				return ERR_USB_INIT1
			handle.setConfiguration(self.conf)
			handle.claimInterface(self.iface)
			handle.setAltInterface(self.iface)
			return handle
		return ERR_USB_INIT1
# ------------------------------------------------------------------------------
	def getEndpoint(self, device, active_config):
		""" get an endpoint instance """
		for config in device.configurations:
			#print "  Configuration:", config.value
			#print "    Total length:", config.totalLength 
			#print "    selfPowered:", config.selfPowered
			#print "    remoteWakeup:", config.remoteWakeup
			#print "    maxPower:", config.maxPower
			self.conf = config.value
			if config.value == active_config:
				for intf in config.interfaces:
					#print "    Interface:",intf[0].interfaceNumber
					self.iface = intf[0].interfaceNumber
					for alt in intf:
						#print "    Alternate Setting:",alt.alternateSetting
						#print "      Interface class:",alt.interfaceClass
						#print "      Interface sub class:",alt.interfaceSubClass
						#print "      Interface protocol:",alt.interfaceProtocol
						for ep in alt.endpoints:
							#print "      Endpoint:",hex(ep.address)
							#print "        Type:",ep.type
							#print "        Max packet size:",ep.maxPacketSize
							#print "        Interval:",ep.interval
							if ep.address > 0x80:
								#return BULK_IN_EP or HID_IN_EP
								self.endpoint = ep.address
								return
# ------------------------------------------------------------------------------
	def getDeviceFamily(self, handle):
		usbBuf[0] = HID_QUERY_DEVICE;
		if (status = usbWrite(handle, 1, USB_READ)) == ERR_NONE:
			self.txtWrite(output, "device family: ")
			deviceFamily = usbBuf[2];
			if deviceFamily == DEVICE_FAMILY_PIC18:
				bytesPerAddress = 1
				self.txtWrite(output, "PIC18\n");
			else if deviceFamily == DEVICE_FAMILY_PIC24:
				bytesPerAddress = 2
				self.txtWrite(output, "PIC24\n");
			else if deviceFamily == DEVICE_FAMILY_PIC32:
				bytesPerAddress = 1
				self.txtWrite(output, "PIC32\n");
			else:
				bytesPerAddress = 1
				self.txtWrite(output, "Unknown. Bytes per address set to 1.\n");
# ------------------------------------------------------------------------------
	def getProgramMemory(self, handle):
		self.txtWrite(output, "program memory: ");
		i = 1
		j = 3
		while usbBuf[j] != TypeEndOfTypeList:
			if usbBuf[j] == TypeProgramMemory:
				self.txtWrite(output, "%d bytes free. " % bufRead32(j + 5))
			j = j + 9
			i = i + 1
		self.txtWrite(output, '\n')
# ------------------------------------------------------------------------------
	def eraseBlock(self, handle, adresse):
		""" erase 64 bytes of flash memory """
		if self.endpoint == self.BULK_IN_EP:
			readbyte0 = self.BULK_ERASE_FLASH_CMD
		else:
			readbyte0 = self.HID_ERASE_DEVICE_CMD

		# compute the address
		adresse = "%06X"%adresse
		readbyte1 = int(adresse[4:6],16)
		readbyte2 = int(adresse[2:4],16)
		readbyte3 = int(adresse[0:2],16)
		
		usbBuf = chr(readbyte0) + chr(readbyte1) + chr(readbyte2) + chr(readbyte3)

		# write data packet
		self.usbWrite(usbBuf)
# ------------------------------------------------------------------------------
	def issueBlock(self, handle, adresse, bloc, output):
		""" write a 32 bytes block of code """

		# progress bar
		self.txtWrite(output, ".")

		# send a write command
		if self.endpoint == self.HID_IN_EP:
			readbyte0 = self.HID_PROGRAM_DEVICE_CMD 
		else:					
			readbyte0 = self.BULK_WRITE_FLASH_CMD 

		# compute the address
		adresse = "%06X"%adresse
		readbyte1 = int(adresse[4:6], 16)
		readbyte2 = int(adresse[2:4], 16)
		readbyte3 = int(adresse[0:2], 16)
		
		usbBuf = chr(readbyte0) + chr(readbyte1) + chr(readbyte2) + chr(readbyte3)

		# add data to the packet
		for i in range(len(bloc)):
			usbBuf = usbBuf + chr(bloc[i])

		# write data packet
		self.usbWrite(usbBuf)
# ------------------------------------------------------------------------------
	def usbWrite(self, usbBuf)
		"""
		Write data packet to currently-open USB device, optionally
		Data source is always global array usbBuf[]
		Parameters  : len -> Size of source data in bytes (max 64).
		Returns     : ErrorCode  ERR_NONE on success, ERR_USB_WRITE on error.
		Notes       : Device is assumed to have already been successfully opened
				        by the time this function is called; no checks performed here.
		"""
		if self.endpoint == self.HID_IN_EP:
			if handle.interruptWrite(self.HID_OUT_EP, usbBuf, 0) != HID_RET_SUCCESS:
				return ERR_USB_WRITE
		else:
			handle.bulkWrite(self.BULK_OUT_EP, usbBuf, 200)
		return ERR_NONE
# ------------------------------------------------------------------------------
	def txtWrite(self, output, message):
		""" display message in the log window """
		#if gui==True:
		output.WriteText(message)
		#else:
		#	print message
		return  
# ------------------------------------------------------------------------------
	def hexWrite(self, handle, filename, board, output):
		"""
					Hex File Format
		[0]		Start code, one character, an ASCII colon ':'.
		[1:3]		Byte count, two hex digits, a number of bytes (hex digit pairs) in the data field. 16 (0x10) or 32 (0x20) bytes of data are the usual compromise values between line length and address overhead.
		[3:7]		Address, four hex digits, a 16-bit address of the beginning of the memory position for the data. Limited to 64 kilobytes, the limit is worked around by specifying higher bits via additional record types. This address is big endian.
		[7:9]		Record type, two hex digits, 00 to 05, defining the type of the data field.
		[9:*]		Data, a sequence of n bytes of the data themselves, represented by 2n hex digits.
		[*:*]		Checksum, two hex digits - the least significant byte of the two's complement of the sum of the values of all fields except fields 1 and 6 (Start code ":" byte and two hex digits of the Checksum). It is calculated by adding together the hex-encoded bytes (hex digit pairs), then leaving only the least significant byte of the result, and making a 2's complement (either by subtracting the byte from 0x100, or inverting it by XOR-ing with 0xFF and adding 0x01). If you are not working with 8-bit variables, you must suppress the overflow by AND-ing the result with 0xFF. The overflow may occur since both 0x100-0 and (0x00 XOR 0xFF)+1 equal 0x100. If the checksum is correctly calculated, adding all the bytes (the Byte count, both bytes in Address, the Record type, each Data byte and the Checksum) together will always result in a value wherein the least significant byte is zero (0x00).
					For example, on :0300300002337A1E
					03 + 00 + 30 + 00 + 02 + 33 + 7A = E2, 2's complement is 1E
		"""
		data = []
		old_address = 0
		max_address = 0
		# read hex file
		fichier = open(filename,'r')
		lines = fichier.readlines()
		fichier.close()
		# figure out max address
		for line in lines:
			byte_count = int(line[1:3],16)
			address = int(line[3:7],16)
			if (address > old_address) and (address < board.end):
				max_address = address + byte_count
				old_address = address
		max_address = max_address + 64 - (max_address % 64)            
		# fill data sequence with 0xFF
		for i in range(max_address):
			data.append(0xFF)
		# parse bytes from line into data
		for line in lines:
			byte_count = int(line[1:3], 16)
			address = int(line[3:7], 16)
			record_type = int(line[7:9],16)
			if address >= board.start and address < board.end:
				for i in range(0, byte_count):
					data[address+i] = int(line[9 + (2 * i) : 11 + (2 * i)], 16)
			else:
				return ERR_HEX_RECORD

		index = 0
		usbBuf = []
		blocsize = 32

		self.txtWrite(output, "writing ")
		for i in range(board.start, max_address):
			if i % 64 == 0:
				self.eraseBlock(handle, i)
			if i % blocsize == 0:
				index = 0
				if usbBuf != []:
					self.issueBlock(handle, i-blocsize, usbBuf, output)
				usbBuf = []
			if data[i] != []:
				usbBuf.append(data[i])
			index += 1 
		self.txtWrite(output, "\n")
		
		if self.endpoint == self.HID_IN_EP:
			self.txtWrite(output, "completing ...\n")
			readbyte0 = self.HID_PROGRAM_COMPLETE_CMD
			handle.interruptWrite(self.HID_OUT_EP, usbBuf, 200)
			self.txtWrite(output, "resetting device ...\n")
			usbBuf = chr(self.HID_RESET_DEVICE_CMD)
			handle.interruptWrite(self.HID_OUT_EP, usbBuf, 200)
# ------------------------------------------------------------------------------
	def release(self, handle):
		""" release USB interface """
		handle.releaseInterface()
# ------------------------------------------------------------------------------
	def writeHex(self, filename, board, output):
		device = self.getDevices(board)
		if device is ERR_DEVICE_NOT_FOUND:
			self.txtWrite(output, "Pinguino not found\n")
			return
		handle = self.initDevice(device, board)
		if handle is ERR_USB_INIT1:
			self.txtWrite(output, "Upload not possible : is device in bootloader mode ?\n")
			return
		#self.getDeviceFamily(self, handle):
		#self.getProgramMemory(self, handle):
		if filename != '':
			if self.hexWrite(handle, filename, board, output) == ERR_HEX_RECORD:
				self.txtWrite(output, "Record error\n")
			else:
				self.txtWrite(os.path.basename(filename) + " successfully uploaded\n")
		else:
			self.txtWrite(output, "Nothing to write\n")
		self.release(handle)
# ------------------------------------------------------------------------------

