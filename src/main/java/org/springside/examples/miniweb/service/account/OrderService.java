package org.springside.examples.miniweb.service.account;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.dao.account.CustomerDao;
import org.springside.examples.miniweb.entity.account.Customer;

@Component
public class OrderService {
	private static Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	private CustomerDao customerDao;

	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	
	@Autowired
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	
	/**
	 * 根据手机查询客户信息
	 * @param phoneno
	 * @return
	 */
	public String getCustomerJsonByPhoneno(String phoneno){
		List<Customer> customerList = customerDao.findBy("phoneno", phoneno);
		if(customerList != null && customerList.size() > 0) {
			Customer customer = (Customer)customerList.get(0);
			return customer.toJson();
		} else {
			return "";
		}
	}
	
}
