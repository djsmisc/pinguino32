#!/bin/bash
#
#   desc.: test all pde. files from examples directory 
#   usage: ./regression.sh --pinguino26j50 (./pinguino.py -h to see available arguments)
#   author: regis blanchot
#   updated: 2012 Nov. 09

RM="rm -rf"
LOG="log"
PINGUINO="./pinguino.py"
TARGET="examples"

# colors
RED='\e[31;1m*'
GREEN='\e[32;1m*'
YELLOW='\e[33;1m***'
TERM='\e[m'

# create log dir.
if [ -d $LOG ]; then
    ${RM} ${LOG}/*
else
    mkdir ${LOG}
fi

find ${TARGET} -type f -name *.pde | while read FILE ; do
    FNAME=$(basename "${FILE}" .pde)
    OUTPUT=$(${PINGUINO} $1 --filename "${FILE}")
    END=${OUTPUT:(-2)}
    if [ "$END" = "OK" ]; then
        echo -e $GREEN ${FILE} COMPILED! $TERM
    else
        echo -e $RED ERROR: ${FILE} DOES NOT COMPILE! $TERM
        echo ${OUTPUT} >> "${LOG}/${FNAME}.log"
        echo -e '\t' $YELLOW "See ${LOG}/${FNAME}.log" $TERM
    fi
done
