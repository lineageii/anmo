package org.springside.examples.miniweb.dao.account;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Customer;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class CustomerDao extends HibernateDao<Customer, Long> {

	/**
	 * 根据手机查询客户信息
	 * @param phoneno
	 * @return
	 */
	public String getCustomerJsonByPhoneno(String phoneno) {
		List<Customer> customerList = this.findBy("phoneno", phoneno);
		if (customerList != null && customerList.size() > 0) {
			Customer customer = (Customer) customerList.get(0);
			return customer.toJson();
		} else {
			return "";
		}
	}
}
