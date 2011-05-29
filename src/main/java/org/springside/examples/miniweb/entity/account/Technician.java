package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 技师表
 *@author roy
 */
@Entity
@Table(name = "T_TECHNICIAN")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Technician extends IdEntity {
	/** 员工编号 */
	private String empno;
	/** 姓名 */
	private String name;
	/** 性别 */
	private String gender;
	/** 出生年  */
	private Integer birthyear;
	/** 出生月  */
	private String birthmonth;
	/** 出生日  */
	private String birthday;
	/** 胸围 */
	private String bust;
	/** 腰围 */
	private String waistline;
	/** 臀围 */
	private String hip;
	/** 身高 */
	private String height;
	/** 体重 */
	private String weight;
	/** 籍贯 */
	private String birthplace;
	/** 爱好 */
	private String hobby;
	/** 梦想 */
	private String dream;
	/** 语言 */
	private String languages;
	
	/** 手机号码 */
	private String mobileno;
	/** 住址 */
	private String address;
	private String qq;
	private String msn;
	private String email;
	
	/** 状态:1:空闲 2:出勤中 3:休息*/
	private String status;
	
	private WeekWork weekWork;
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthmonth() {
		return birthmonth;
	}
	public void setBirthmonth(String birthmonth) {
		this.birthmonth = birthmonth;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBust() {
		return bust;
	}
	public void setBust(String bust) {
		this.bust = bust;
	}
	public String getWaistline() {
		return waistline;
	}
	public void setWaistline(String waistline) {
		this.waistline = waistline;
	}
	public String getHip() {
		return hip;
	}
	public void setHip(String hip) {
		this.hip = hip;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getBirthplace() {
		return birthplace;
	}
	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMsn() {
		return msn;
	}
	public void setMsn(String msn) {
		this.msn = msn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public Integer getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(Integer birthyear) {
		this.birthyear = birthyear;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getDream() {
		return dream;
	}
	public void setDream(String dream) {
		this.dream = dream;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@OneToOne
	@JoinColumn(name = "weekworkid", nullable = false)
	public WeekWork getWeekWork() {
		return weekWork;
	}
	public void setWeekWork(WeekWork weekWork) {
		this.weekWork = weekWork;
	}

	
}
