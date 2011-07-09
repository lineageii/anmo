package org.springside.examples.miniweb.web;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.dao.account.NewsDao;
import org.springside.examples.miniweb.entity.account.News;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.examples.miniweb.web.CrudActionSupport;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

/**
 * 新闻Action
 * @author roy
 *
 */
public class NewsAction extends CrudActionSupport<News> {
	private static final long serialVersionUID = 3593331645711019058L;

	private NewsDao newsDao;
	
	//-- 页面属性 --//
	private Long id;
	private News entity;
	private Page<News> page = new Page<News>(5);//每页5条记录
	private List<News> newsList;
	
	
	@Autowired
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	@Override
	public News getModel() {
		return entity;
	}

	//-- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = newsDao.get(id);
		} else {
			entity = new News();
		}
	}
	
	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(Struts2Utils.getRequest());
		// 设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.DESC);
		}
		page = newsDao.findPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		newsList = newsDao.getAll();
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		entity.setCreatedate(new Date());
		newsDao.save(entity);
		addActionMessage("保存用户成功");
		return RELOAD;
	}

	@Override
	@Transactional
	public String delete() throws Exception {
		try {
			newsDao.delete(id);
			addActionMessage("删除用户成功");
		} catch (ServiceException e) {
			logger.error(e.getMessage(), e);
			addActionMessage("删除用户失败");
		}
		return RELOAD;
	}

	public News getEntity() {
		return entity;
	}

	public void setEntity(News entity) {
		this.entity = entity;
	}

	public Page<News> getPage() {
		return page;
	}

	public void setPage(Page<News> page) {
		this.page = page;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public NewsDao getNewsDao() {
		return newsDao;
	}

	public Long getId() {
		return id;
	}

}
