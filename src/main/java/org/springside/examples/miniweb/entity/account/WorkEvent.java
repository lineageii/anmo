package org.springside.examples.miniweb.entity.account;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 出勤事件表
 * @author hujia
 *
 */
@Entity
@Table(name = "T_WORKEVENT")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class WorkEvent extends IdEntity {

	private Technician technician;
	/** 事件日期 */
	private Date eventdate;
	/** 状态, work:出勤, rest:休息*/
	private String status;
	private String starttime;
	private String endtime;

	@ManyToOne(optional = false)
	@JoinColumn(name = "technicianid", nullable = false, updatable = false)
	public Technician getTechnician() {
		return technician;
	}

	public void setTechnician(Technician technician) {
		this.technician = technician;
	}

	public Date getEventdate() {
		return eventdate;
	}

	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
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

}
