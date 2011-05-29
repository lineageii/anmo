package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
	private String week1;
	private String week2;
	private String week3;
	private String week4;
	private String week5;
	private String week6;
	private String week7;
	
	@OneToOne
	@JoinColumn(name = "technicianid", nullable = false)
	public Technician getTechnician() {
		return technician;
	}
	public void setTechnician(Technician technician) {
		this.technician = technician;
	}
	public String getWeek1() {
		return week1;
	}
	public void setWeek1(String week1) {
		this.week1 = week1;
	}
	public String getWeek2() {
		return week2;
	}
	public void setWeek2(String week2) {
		this.week2 = week2;
	}
	public String getWeek3() {
		return week3;
	}
	public void setWeek3(String week3) {
		this.week3 = week3;
	}
	public String getWeek4() {
		return week4;
	}
	public void setWeek4(String week4) {
		this.week4 = week4;
	}
	public String getWeek5() {
		return week5;
	}
	public void setWeek5(String week5) {
		this.week5 = week5;
	}
	public String getWeek6() {
		return week6;
	}
	public void setWeek6(String week6) {
		this.week6 = week6;
	}
	public String getWeek7() {
		return week7;
	}
	public void setWeek7(String week7) {
		this.week7 = week7;
	}
}
