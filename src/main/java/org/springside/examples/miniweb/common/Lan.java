package org.springside.examples.miniweb.common;

import java.util.Locale;

/**
 * 语言
 * @author hujia
 *
 */
public class Lan {
	public static final String ENGLISH = "en";
	public static final String CHINESE = "zh";
	public static final String JAPANESE = "ja";
	
	public static String getLanByLocale(Locale locale){
		if(locale == null)
			return Lan.ENGLISH;
		
		if("zh_CN".equalsIgnoreCase(locale.toString())){
			return Lan.CHINESE;
		} else if ("".equalsIgnoreCase(locale.toString())){
			return Lan.JAPANESE;
		} else if ("en_US".equalsIgnoreCase(locale.toString())){
			return Lan.ENGLISH;
		} else {
			return Lan.ENGLISH;
		}
		
	}
}
