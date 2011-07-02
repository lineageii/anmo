package org.springside.examples.miniweb.entity.account;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springside.examples.miniweb.entity.IdEntity;

/**
 * 新闻Entity
 * 
 * @author hujia
 * 
 */
@Entity
@Table(name = "T_NEWS")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class News extends IdEntity {
	/** 新闻标题 */
	private String title;
	/** 新闻内容 */
	private String content;
	/** 创建时间 */
	private Date createdate;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

}
