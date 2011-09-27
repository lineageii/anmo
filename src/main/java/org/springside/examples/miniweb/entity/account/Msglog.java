package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

@Entity
@Table(name = "T_MSGLOG")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Msglog extends IdEntity {
	String type; 
	String cid; 
	String msg;
	String flag;
	
	public Msglog(String type, String cid, String msg, String flag) {
		super();
		this.type = type;
		this.cid = cid;
		this.msg = msg;
		this.flag = flag;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
