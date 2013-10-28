#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Constant identifiers.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	23/04/13
    last release:	23/04/13

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

import os

# ------------------------------------------------------------------------------
# current version
# ------------------------------------------------------------------------------
pinguino_version = "x.4"


# ------------------------------------------------------------------------------
# default
# ------------------------------------------------------------------------------
THEME_DEFAULT = "PinguinoX"
from wxgui.boards import Pinguino2550  #default board
BOARD_DEFAULT = Pinguino2550()
gui=False


# ------------------------------------------------------------------------------
# paths
# ------------------------------------------------------------------------------
HOME_DIR = os.getcwd()
THEME_DIR = os.path.join(HOME_DIR, 'theme')
SOURCE_DIR = os.path.join(HOME_DIR, 'source')
LOCALE_DIR = os.path.join(HOME_DIR, 'locale')
P32_DIR = os.path.join(HOME_DIR, 'p32')
P8_DIR = os.path.join(HOME_DIR, 'p8')
#SVN_DIR = "http://pinguino32.googlecode.com/svn/branches/x.4/"
#SVN_DIR = "https://pinguino32.googlecode.com/svn/branches/x.4"
APP_CONFIG = os.path.join(HOME_DIR, '.config')
TEMP_DIR = os.path.join(HOME_DIR, '.temp')
EXAMPLES_DIR = os.path.join(HOME_DIR, 'examples')
STDOUT_FILE = os.path.join(HOME_DIR, 'source', "stdout")