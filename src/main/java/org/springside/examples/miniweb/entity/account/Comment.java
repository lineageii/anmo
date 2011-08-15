package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 顾客留言.
 * 
 * 
 * @author roy
 */
@Entity
@Table(name = "T_COMMENT")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Comment extends IdEntity {
	private Technician technician;
	private Customer customer;
	/** 留言 */
	private String comment;
	/** 回复 */
	private String reply;

	@ManyToOne
	@JoinColumn(name = "technicianid", nullable = false)
	public Technician getTechnician() {
		return technician;
	}

	public void setTechnician(Technician technician) {
		this.technician = technician;
	}

	@ManyToOne
	@JoinColumn(name = "customerid", nullable = false)
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getComment() {
		return StringUtils.replace(comment, "\n", "<br/>");
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getReply() {
		return StringUtils.replace(reply, "\n", "<br/>");
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}
