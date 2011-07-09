package org.springside.examples.miniweb.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.dao.account.CommentDao;
import org.springside.examples.miniweb.entity.account.Comment;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

/**
 * 留言Action
 * @author roy
 *
 */
public class CommentAction extends CrudActionSupport<Comment> {
	private static final long serialVersionUID = 3593331645711019058L;

	private CommentDao commentDao;
	
	//-- 页面属性 --//
	private Long id;
	private Comment entity;
	private Page<Comment> page = new Page<Comment>(5);//每页5条记录
	private List<Comment> commentList;
	
	
	@Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public Comment getModel() {
		return entity;
	}

	//-- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = commentDao.get(id);
		} else {
			entity = new Comment();
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
		page = commentDao.findPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		commentList = commentDao.getAll();
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		commentDao.save(entity);
		addActionMessage("保存用户成功");
		return RELOAD;
	}

	@Override
	@Transactional
	public String delete() throws Exception {
		try {
			commentDao.delete(id);
			addActionMessage("删除用户成功");
		} catch (ServiceException e) {
			logger.error(e.getMessage(), e);
			addActionMessage("删除用户失败");
		}
		return RELOAD;
	}

	public Comment getEntity() {
		return entity;
	}

	public void setEntity(Comment entity) {
		this.entity = entity;
	}

	public Page<Comment> getPage() {
		return page;
	}

	public void setPage(Page<Comment> page) {
		this.page = page;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public Long getId() {
		return id;
	}

}
