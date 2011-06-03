package org.springside.examples.miniweb.common;

import java.util.Random;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class RandomUtil {
	private Log Log = LogFactory.getLog(getClass());

	/**
	 * 创建唯一的订单编号<br>
	 * 订单编号生成规则<br>
	 * 5位随机字母+日期<br>
	 * XXXXX+yyyyMMdd<br>
	 * @return 订单编号
	 */
	public static String createOrderNo() {
		return randomChar(5) + DateUtil.getNow();
	}

	public static String randomChar(int length) {
		String randomChar = "";
		char[] charArray = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			randomChar += charArray[random.nextInt(charArray.length)];
		}
		return randomChar;
	}
}
