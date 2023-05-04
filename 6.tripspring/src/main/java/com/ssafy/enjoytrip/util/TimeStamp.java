package com.ssafy.enjoytrip.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeStamp {
	private static final SimpleDateFormat dbFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static String getCurrentTimeStamp() {
		return dbFmt.format(new Date(System.currentTimeMillis()));		
	}
}
