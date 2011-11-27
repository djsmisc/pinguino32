10 gosub 1010
100 for i = 1 to 10
110 print "blink",i
120 pin 13,1
130 pause 50 ms
140 pin 13,0
150 sleep 50 ms
160 next i
500 end
1000 rem
1001 rem --- setup subroutine
1002 rem
1010 print "test.bas"
1020 setpin 13,0
1100 return

