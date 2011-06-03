package org.springside.examples.miniweb.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static final String YYYYMMDD = "yyyyMMdd";

	public static String getNow() {
		SimpleDateFormat sf = new SimpleDateFormat(YYYYMMDD);
		return sf.format(new Date());
	}
}
