package org.springside.examples.miniweb.unit.service.account;

import junit.framework.Assert;

import org.json.JSONException;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.examples.miniweb.service.account.OrderService;
import org.springside.modules.test.spring.SpringTxTestCase;
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class OrderServiceTest extends SpringTxTestCase{
	private static Logger logger = LoggerFactory.getLogger(OrderServiceTest.class);
	@Autowired
	private OrderService orderService;

	@Test
	public void testGetCustomerJsonByPhoneno() throws JSONException {
		//Assert.assertEquals("", orderService.getCustomerJsonByPhoneno("1234567890123"));
		System.out.println(orderService.getCustomerJsonByPhoneno("3"));
	}

}
