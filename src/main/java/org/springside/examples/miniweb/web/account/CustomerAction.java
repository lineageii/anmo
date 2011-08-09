package org.springside.examples.miniweb.web.account;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.dao.account.CustomerDao;
import org.springside.examples.miniweb.entity.account.Customer;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.examples.miniweb.web.CrudActionSupport;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

/**
 * 顾客Action.
 * 
 * 使用Struts2 convention-plugin annotation定义Action参数.
 * 演示带分页的管理界面.
 * 
 */
//定义URL映射对应/account/customer.action
@Namespace("/account")
//定义名为reload的result重定向到order.action, 其他result则按照convention默认.
@Results({ @Result(name = CrudActionSupport.RELOAD, location = "customer.anmo", type = "redirect") })
public class CustomerAction extends CrudActionSupport<Customer> {

	private static final long serialVersionUID = 8683878162525847072L;

	private CustomerDao customerDao;

	//-- 页面属性 --//
	private Long id;
	private Customer entity;
	private Page<Customer> page = new Page<Customer>(10);//每页5条记录
	private List<Customer> customerList;

	//-- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}

	public Customer getModel() {
		return entity;
	}

	private void initPulldown() {
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = customerDao.get(id);
		} else {
			entity = new Customer();
		}
	}

	//-- CRUD Action 函数 --//
	@Override
	public String list() throws Exception {
		initPulldown();
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(Struts2Utils.getRequest());
		// 设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = customerDao.findPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		customerList = customerDao.getAll();
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		customerDao.save(entity);
		addActionMessage("保存用户成功");
		return RELOAD;
	}

	@Override
	@Transactional
	public String delete() throws Exception {
		try {
			customerDao.delete(id);
			addActionMessage("删除用户成功");
		} catch (ServiceException e) {
			logger.error(e.getMessage(), e);
			addActionMessage("删除用户失败");
		}
		return RELOAD;
	}

	//-- 页面属性访问函数 --//
	/**
	 * list页面显示用户分页列表.
	 */
	public Page<Customer> getPage() {
		return page;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	@Autowired
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public List<Customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}

}
