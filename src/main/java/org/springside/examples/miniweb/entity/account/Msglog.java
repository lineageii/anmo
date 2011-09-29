package org.springside.examples.miniweb.entity.account;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

@Entity
@Table(name = "T_MSGLOG")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Msglog extends IdEntity {
	String type;
	String msg;
	String flag;
	Mapping mapping;

	public Msglog() {
		super();
	}

	public Msglog(String type, Mapping mapping, String msg, String flag) {
		super();
		this.type = type;
		this.mapping = mapping;
		this.msg = msg;
		this.flag = flag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@ManyToOne
	@JoinColumn(name = "mid", nullable = false)
	public Mapping getMapping() {
		return mapping;
	}

	public void setMapping(Mapping mapping) {
		this.mapping = mapping;
	}

}
