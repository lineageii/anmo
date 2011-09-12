package org.springside.examples.miniweb.web.order;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.examples.miniweb.dao.account.TechnicianDao;
import org.springside.examples.miniweb.entity.account.Technician;

import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/order")
public class IndexAction extends ActionSupport {
	private TechnicianDao technicianDao;
	
	/** 技师列表  */
	private List<Technician> staffList = Lists.newArrayList();

	@Autowired
	public void setTechnicianDao(TechnicianDao technicianDao) {
		this.technicianDao = technicianDao;
	}

	public String execute() throws Exception {
		return list();
	}

	private String list() {
		staffList = technicianDao.getAll();
		return SUCCESS;
	}

	public List<Technician> getStaffList() {
		return staffList;
	}
	
	
}
