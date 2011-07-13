package org.springside.examples.miniweb.entity.account;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 周出勤表
 * @author hujia
 *
 */
@Entity
@Table(name = "T_WEEKWORK")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class WeekWork extends IdEntity {

	private Technician technician;
	/** week1:星期一,week2:星期二,week7,星期日 */
	private String weekno;
	/** 状态, work:出勤, rest:休息*/
	private String status;
	private String starttime;
	private String endtime;
	@Transient
	private Date day;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "technicianid", nullable = false, updatable = false)
	public Technician getTechnician() {
		return technician;
	}

	public void setTechnician(Technician technician) {
		this.technician = technician;
	}

	public String getWeekno() {
		return weekno;
	}

	public void setWeekno(String weekno) {
		this.weekno = weekno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

}
