#!/bin/bash
export VERSIONER_PYTHON_PREFER_32_BIT=yes
cd $(dirname $0)
arch -i386 python2.7 pinguino.py
