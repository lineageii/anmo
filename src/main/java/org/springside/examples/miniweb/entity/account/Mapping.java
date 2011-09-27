package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

@Entity
@Table(name = "T_MAPPING")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Mapping extends IdEntity {
	String cid; // custom id
	String kfid; // kefu id
	String sid; // server qq id
	
	
	public Mapping(String cid, String kfid, String sid) {
		super();
		this.cid = cid;
		this.kfid = kfid;
		this.sid = sid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getKfid() {
		return kfid;
	}
	public void setKfid(String kfid) {
		this.kfid = kfid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	
}
