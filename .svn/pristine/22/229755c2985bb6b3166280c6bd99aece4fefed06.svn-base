package com.neusoft.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

	public static int getYear() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR);
	}
	
	public static String convertDateToString(String date){
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);  
		Date d = null;
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		String formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
		return formatDate;
	}
	
	public static String subStrTime(String date){
		String result = "";
		if (date != null && date.contains(".0")) {
			result = date.substring(0, date.indexOf(".0"));
		}
		return result;
	}
	
	public static String getTimeYMD(String date){
		String result = "";
		if (date != null) {
			result = date.substring(0, date.indexOf("00"));
		}
		return result;
	}
	
}
