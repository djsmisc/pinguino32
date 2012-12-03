#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
    Pinguino Boards List

    author:         Regis Blanchot
    contact:        rblanchot@gmail.com
    first release:  2011-10-23
    last release:   2012-05-04

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-------------------------------------------------------------------------"""

import wx  # wx.NewId()

# vendors id
MICROCHIP_ID = 0x04D8

# products id
PIC8_ID = 0xFEAA
PIC32_ID = 0x003C


class PinguinoNoBoot:
    arch = 8
    bldr = 'noboot'
    board = ''
    id = wx.NewId()
    longarg = '--noboot'
    memend = 0xFFF8
    memstart = 0x0000
    name = 'Pinguino (no Bootloader)'
    proc = ''
    product = ''
    shortarg = '-b'
    vendor = ''


class Pinguino2550:
    arch = 8
    bldr = 'boot2'
    board = 'PIC18F2550'
    id = wx.NewId()
    longarg = '--pinguino2550'
    memend = 0x7fff
    memstart = 0x2000       # bootloader offset
    name = 'Pinguino 2550'
    proc = '18f2550'
    product = PIC8_ID
    shortarg = '-p'
    vendor = MICROCHIP_ID


class Pinguino4550:
    arch = 8
    bldr = 'boot2'
    board = 'PIC18F4550'
    id = wx.NewId()
    longarg = '--pinguino4550'
    memend = 0x7fff
    memstart = 0x2000       # bootloader offset
    name = 'Pinguino 4550'
    proc = '18f4550'
    product = PIC8_ID
    shortarg = '-P'
    vendor = MICROCHIP_ID


class Pinguino26J50:
    arch = 8
    bldr = 'boot4'
    board = 'PIC18F26J50'
    id = wx.NewId()
    longarg = '--pinguino26j50'
    memend = 0xFFF8
    memstart = 0x0C00       # bootloader offset
    name = 'Pinguino 26J50'
    proc = '18f26j50'
    product = PIC8_ID
    shortarg = '-j'
    vendor = MICROCHIP_ID


class PICuno_Equo:
    arch = 8
    bldr = 'boot2'
    board = 'PICUNO_EQUO'
    config = 0x300000
    id = wx.NewId()
    longarg = '--picunoequo'
    memend = 0x7fff
    memstart = 0x2000
    name = 'PICuno Equo'
    proc = '18f4550'
    product = PIC8_ID
    shortarg = '-eq'
    vendor = MICROCHIP_ID


class FreeJALduino:
    arch = 8
    bldr = 'boot2'
    board = 'FREEJALDUINO'
    config = 0x300000
    id = wx.NewId()
    longarg = '--freejalduino'
    memend = 0x7fff
    memstart = 0x2000
    name = 'FreeJALduino'
    proc = '18f2550'
    product = PIC8_ID
    shortarg = '-J'
    vendor = MICROCHIP_ID


class PIC32_Pinguino:
    arch = 32
    bldr = 'microchip'
    board = 'PIC32_PINGUINO'
    id = wx.NewId()
    longarg = '--olimex440'
    memend = 0x40000
    memstart = 0x00000
    name = 'PIC32 Pinguino'
    proc = '32MX440F256H'
    product = PIC32_ID
    shortarg = '-o'
    vendor = MICROCHIP_ID


class PIC32_Pinguino_OTG:
    arch = 32
    bldr = 'microchip'
    board = 'PIC32_PINGUINO_OTG'
    id = wx.NewId()
    longarg = '--olimex440OTG'
    memend = 0x40000
    memstart = 0x00000  # 0x9D000000
    name = 'PIC32 Pinguino OTG'
    proc = '32MX440F256H'
    product = PIC32_ID
    shortarg = '-O'
    vendor = MICROCHIP_ID


class PIC32_Pinguino_Micro:
    arch = 32
    bldr = 'microchip'
    board = 'PIC32_PINGUINO_MICRO'
    id = wx.NewId()
    longarg = '--olimex440Micro'
    memend = 0x40000
    memstart = 0x00000
    name = 'PIC32 Pinguino Micro'
    proc = '32MX440F256H'
    product = PIC32_ID
    shortarg = '-M'
    vendor = MICROCHIP_ID


class PIC32_Pinguino_T795:
    arch = 32
    bldr = 'microchip'
    board = 'PIC32_PINGUINO_T795'
    id = wx.NewId()
    longarg = '--olimexT795'
    memend = 0x80000
    memstart = 0x00000
    name = 'PIC32 Pinguino T795'
    proc = '32MX795F512H'
    product = PIC32_ID
    shortarg = '-T'
    vendor = MICROCHIP_ID


class PIC32_Pinguino_220:
    arch = 32
    bldr = 'microchip'
    board = 'PIC32_PINGUINO_220'
    id = wx.NewId()
    longarg = '--olimex220'
    memend = 0x07FFF
    memstart = 0x00000
    name = 'PIC32 Pinguino 220'
    proc = '32MX220F032D'
    product = PIC32_ID
    shortarg = '-m'
    vendor = MICROCHIP_ID


class GENERIC32MX250F128:
    arch = 32
    bldr = 'microchip'
    board = 'GENERIC32MX250F128'
    id = wx.NewId()
    longarg = '--generic250'
    memend = 0x20000
    memstart = 0x00000
    name = 'GENERIC32MX250F128'
    proc = '32MX250F128B'
    product = PIC32_ID
    shortarg = '-N'
    vendor = MICROCHIP_ID


class GENERIC32MX220F032:
    arch = 32
    bldr = 'microchip'
    board = 'GENERIC32MX220F032'
    id = wx.NewId()
    longarg = '--generic220'
    memend = 0x07FFF
    memstart = 0x00000
    name = 'GENERIC32MX220F032'
    proc = '32MX220F032B'
    product = PIC32_ID
    shortarg = '-n'
    vendor = MICROCHIP_ID


class Emperor_460:
    arch = 32
    bldr = 'microchip'
    board = 'EMPEROR460'
    id = wx.NewId()
    longarg = '--emperor460'
    memend = 0x80000
    memstart = 0x00000
    name = 'Emperor 460'
    proc = '32MX460F512L'
    product = PIC32_ID
    shortarg = '-e'
    vendor = MICROCHIP_ID


class Emperor_795:
    arch = 32
    bldr = 'microchip'
    board = 'EMPEROR795'
    id = wx.NewId()
    longarg = '--emperor795'
    memend = 0x80000
    memstart = 0x00000
    name = 'Emperor 795'
    proc = '32MX795F512L'
    product = PIC32_ID
    shortarg = '-E'
    vendor = MICROCHIP_ID


class UBW32_460:
    arch = 32
    bldr = 'microchip'
    board = 'UBW32_460'
    id = wx.NewId()
    longarg = '--ubw460'
    memend = 0x80000
    memstart = 0x00000
    name = 'UBW32 460'
    proc = '32MX460F512L'
    product = PIC32_ID
    shortarg = '-u'
    vendor = MICROCHIP_ID


class UBW32_795:
    arch = 32
    bldr = 'microchip'
    board = 'UBW32_795'
    id = wx.NewId()
    longarg = '--ubw795'
    memend = 0x80000
    memstart = 0x00000
    name = 'UBW32 795'
    proc = '32MX795F512L'
    product = PIC32_ID
    shortarg = '-U'
    vendor = MICROCHIP_ID

boardlist = [
PinguinoNoBoot,
Pinguino2550, Pinguino4550, Pinguino26J50,
PICuno_Equo, FreeJALduino,
PIC32_Pinguino, PIC32_Pinguino_OTG,
PIC32_Pinguino_Micro, PIC32_Pinguino_T795, PIC32_Pinguino_220,
GENERIC32MX250F128, GENERIC32MX220F032,
Emperor_460, Emperor_795,
UBW32_460, UBW32_795
]
