package org.springside.examples.miniweb.entity.account;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

@Entity
@Table(name = "T_UPLOAD")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Upload extends IdEntity {
	// 系统文件名
	private String sysname;
	// 原文件名
	private String oriname;
	// 创建日期
	private Date createDate;

	private Technician technician;

	public String getSysname() {
		return sysname;
	}

	public void setSysname(String sysname) {
		this.sysname = sysname;
	}

	public String getOriname() {
		return oriname;
	}

	public void setOriname(String oriname) {
		this.oriname = oriname;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH })
	@JoinColumn(name = "technicianid", nullable = false, updatable = false)
	public Technician getTechnician() {
		return technician;
	}

	public void setTechnician(Technician technician) {
		this.technician = technician;
	}

}
