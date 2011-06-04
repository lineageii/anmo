package org.springside.examples.miniweb.web.account;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.common.RandomUtil;
import org.springside.examples.miniweb.dao.account.CustomerDao;
import org.springside.examples.miniweb.dao.account.OrderDao;
import org.springside.examples.miniweb.dao.account.TechnicianDao;
import org.springside.examples.miniweb.entity.account.Customer;
import org.springside.examples.miniweb.entity.account.Order;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.examples.miniweb.web.CrudActionSupport;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

/**
 * 订单Action.
 * 
 * 使用Struts2 convention-plugin annotation定义Action参数.
 * 演示带分页的管理界面.
 * 
 * @author calvin
 */
//定义URL映射对应/account/user.action
@Namespace("/account")
//定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({ @Result(name = CrudActionSupport.RELOAD, location = "order.anmo", type = "redirect") })
public class OrderAction extends CrudActionSupport<Order> {

	private static final long serialVersionUID = 8683878162525847072L;

	private OrderDao orderDao;
	private TechnicianDao technicianDao;
	private CustomerDao customerDao;
	//-- 页面属性 --//
	private Long id;
	private Order entity;
	private Page<Order> page = new Page<Order>(10);//每页5条记录
	private List<Technician> technicianList;

	//-- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}

	public Order getModel() {
		return entity;
	}

	private void initPulldown() {
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = orderDao.get(id);
		} else {
			entity = new Order();
			entity.setOrderno(RandomUtil.createOrderNo());
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
			page.setOrder(Page.DESC);
		}
		page = orderDao.findPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		initPulldown();
		technicianList = technicianDao.getAll();
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		//根据页面上的checkbox选择 整合User的Roles Set
		if(entity.getCustomer().getId() == null){
			customerDao.save(entity.getCustomer());
		} 
		orderDao.save(entity);
		addActionMessage("保存用户成功");
		return RELOAD;
	}

	@Override
	@Transactional
	public String delete() throws Exception {
		try {
			orderDao.delete(id);
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
	public Page<Order> getPage() {
		return page;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	@Autowired
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public List<Technician> getTechnicianList() {
		return technicianList;
	}

	public TechnicianDao getTechnicianDao() {
		return technicianDao;
	}

	@Autowired
	public void setTechnicianDao(TechnicianDao technicianDao) {
		this.technicianDao = technicianDao;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	@Autowired
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	
}
