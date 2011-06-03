package org.springside.examples.miniweb.common;

import junit.framework.Assert;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;

public class RandomUtilTest {
	private Log Log = LogFactory.getLog(getClass());

	@Test
	public void testCreateOrderNo() {
		String orderno = RandomUtil.createOrderNo();
		Log.info("orderno: " + orderno);
		Assert.assertEquals(13, orderno.length());
	}

	@Test
	public void testRandomChar() {
		String randomChar = RandomUtil.randomChar(5);
		Log.info("randomChar: " + randomChar);
		Assert.assertEquals(5, randomChar.length());
	}
}
