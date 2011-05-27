package org.springside.examples.miniweb.entity.account;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

import com.google.common.collect.Lists;

/**
 * 顾客表
 * 
 * @author roy
 * 
 */
@Entity
@Table(name = "T_CUSTOMER")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Customer extends IdEntity {

	private String name;
	private String phoneno;
	private String address;
	private String qq;
	private String msn;
	private List<Order> orderList = Lists.newArrayList();

	@Column(length = 40)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 16)
	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	@Column(length = 100)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(length = 30)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(length = 30)
	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

}
