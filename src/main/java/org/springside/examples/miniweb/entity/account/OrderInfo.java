package org.springside.examples.miniweb.entity.account;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 订单明细
 * <p>
 * ORDERINFO N:1 ORDER
 * 
 * @author roy
 * 
 */
@Entity
@Table(name = "T_ORDERINFO")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OrderInfo extends IdEntity {

	private Order order;
	private Technician technician;
	private BigDecimal price;
	/** 货币单位：usd:美元 rmb:人民币 */
	private String currency;

	@ManyToOne
	@JoinColumn(name = "orderid", nullable = false)
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne
	@JoinColumn(name = "technicianid", nullable = false)
	public Technician getTechnician() {
		return technician;
	}

	public void setTechnician(Technician technician) {
		this.technician = technician;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

}
