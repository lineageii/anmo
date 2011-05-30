package org.springside.examples.miniweb.common;

import java.util.Map;

import junit.framework.Assert;

import org.junit.Test;

public class PulldownUtilTest {

	@Test
	public void testGetWorkTimeMap() {
		Map<String, String> map = PulldownUtil.getWorkTimeMap("凌晨");
		Assert.assertEquals("12:00", map.get("1200"));
		Assert.assertEquals("12:30", map.get("1230"));
		Assert.assertEquals("凌晨0:00", map.get("2400"));
		Assert.assertEquals("凌晨0:30", map.get("2430"));
		Assert.assertEquals("凌晨5:00", map.get("2900"));
	}

}
