import serial

ser = serial.Serial('/dev/ttyACM0')

print ser

ser.write('www.pinguino.cc')
print ser.read(20)

ser.write('www.pinguino.cc\n')
print ser.readline()

ser.close()

