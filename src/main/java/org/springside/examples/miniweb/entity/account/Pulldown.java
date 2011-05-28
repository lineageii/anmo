package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 多选框
 * @author hujia
 *
 */
@Entity
@Table(name = "T_PULLDOWN")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Pulldown extends IdEntity {
	private String key;
	private String value;
	private String type;
	private String lan;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLan() {
		return lan;
	}
	public void setLan(String lan) {
		this.lan = lan;
	}
	
	
	
}
