const char* Day[7] = {'Sat','Sun','Mon','Tue','Wed','Thu','Fri'};
const char* Month[12] = {'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};

void setup()
{
	RTCC.init();
	RTCC.setDate(0x11062902);			// set date to Tuesday 29 June 2011
	RTCC.setTime(0x23352300);			// set time to 23hr, 35 min, 23 sec
	// or RTCC.SetTimeDate(0x23352300, 0x11062901);
	RTCC.setAlarmDate(0x11062902);	// set date to Tuesday 29 June 2011
	RTCC.setAlarmTime(0x23360000);	// set time to 23hr, 36 min, 00 sec
	// or RTCC.SetAlarmTimeDate(0x23360000, 0x11062901);
	//RTCC.AlarmEnable();
}

void loop()
{
	rtccTime curTime;
	rtccDate curDate;

	//curDate = RTCC.getDate();
	curTime = RTCC.getTime();
	// or RTCC.GetTimeDate(&myTime, &myDate);
	//CDC.printf("%s, %02d %s %04d,", Day[curDate.wday], curDate.mday, Month[curDate.mon], curDate.year+2000);
	CDC.printf("%02d:%02d:%02d\r", curTime.hour, curTime.min, curTime.sec);
}
