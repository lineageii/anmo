package org.springside.examples.miniweb.entity.account;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

import com.google.common.collect.Lists;

/**
 * 订单主表
 * @author roy
 *
 */
@Entity
@Table(name = "T_ORDER")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Order extends IdEntity {

	private String orderno;
	private Date orderdate;
	private Customer customer;
	private String contactAddress;
	private String contactName;
	private String contactPhoneNo;
	private String remark;
	/** 订单状态  new:新建  审核完毕 发货  收货 交易结束 取消 */
	private String status;

	private List<OrderInfo> orderInfoList = Lists.newArrayList();

	@Column(length = 20)
	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	@ManyToOne
	@JoinColumn(name = "customerid", nullable = false)
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(length = 100)
	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	@Column(length = 40)
	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	@Column(length = 16)
	public String getContactPhoneNo() {
		return contactPhoneNo;
	}

	public void setContactPhoneNo(String contactPhoneNo) {
		this.contactPhoneNo = contactPhoneNo;
	}

	@Column(length = 200)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order")
	public List<OrderInfo> getOrderInfoList() {
		return orderInfoList;
	}

	public void setOrderInfoList(List<OrderInfo> orderInfoList) {
		this.orderInfoList = orderInfoList;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
