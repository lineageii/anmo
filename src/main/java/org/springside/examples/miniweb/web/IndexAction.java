package org.springside.examples.miniweb.web;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.examples.miniweb.common.Lan;
import org.springside.examples.miniweb.common.PulldownType;
import org.springside.examples.miniweb.common.PulldownUtil;
import org.springside.examples.miniweb.dao.account.CommentDao;
import org.springside.examples.miniweb.dao.account.NewsDao;
import org.springside.examples.miniweb.dao.account.PulldownDao;
import org.springside.examples.miniweb.dao.account.TechnicianDao;
import org.springside.examples.miniweb.entity.account.Comment;
import org.springside.examples.miniweb.entity.account.News;
import org.springside.examples.miniweb.entity.account.Pulldown;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.modules.orm.Page;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
public class IndexAction extends ActionSupport {
	private NewsDao newsDao;
	private CommentDao commentDao;
	private TechnicianDao technicianDao;
	private int thisyear;
	private Map<String, String> provinceMap;
	private PulldownDao pulldownDao;
	private Map<String, String> languagesMap = PulldownUtil.getLanguagesMap();
	@Autowired
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	@Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Autowired
	public void setTechnicianDao(TechnicianDao technicianDao) {
		this.technicianDao = technicianDao;
	}

	private Page<News> newsPage = new Page<News>(5);//每页5条记录
	private Page<Comment> commentPage = new Page<Comment>(5);//每页5条记录
	private Page<Technician> staffPage = new Page<Technician>(5);// 每页5条记录

	public String execute() throws Exception {
		return list();
	}

	private String list() {
		newsPage = newsDao.findPage(newsPage, "from News order by id desc", new Object[] {});
		commentPage = commentDao.findPage(commentPage, "from Comment order by id desc", new Object[] {});
		staffPage = technicianDao.findPage(staffPage, "from Technician order by id desc", new Object[] {});
		thisyear = Calendar.getInstance().get(Calendar.YEAR);
		provinceMap = getProvinceMap(Lan.getLanByLocale(getLocale()));
		return SUCCESS;
	}

	public Page<News> getNewsPage() {
		return newsPage;
	}

	public void setNewsPage(Page<News> newsPage) {
		this.newsPage = newsPage;
	}

	public Page<Comment> getCommentPage() {
		return commentPage;
	}

	public void setCommentPage(Page<Comment> commentPage) {
		this.commentPage = commentPage;
	}

	public Page<Technician> getStaffPage() {
		return staffPage;
	}

	public void setStaffPage(Page<Technician> staffPage) {
		this.staffPage = staffPage;
	}

	public int getThisyear() {
		return thisyear;
	}


	public Map<String, String> getProvinceMap() {
		return provinceMap;
	}

	protected Map<String, String> getProvinceMap(String lan) {
		return getPulldown(PulldownType.PROVINCE, lan);
	}
	
	protected Map<String, String> getPulldown(String type, String lan) {
		Map<String, String> map = Maps.newHashMap();
		List<Pulldown> pulldownList = getPulldownDao().getProvinces(type, lan);
		for(Pulldown pulldown : pulldownList){
			map.put(pulldown.getKey(), pulldown.getValue());
		}
		return map;
	}
	
	public PulldownDao getPulldownDao() {
		return pulldownDao;
	}

	@Autowired
	public void setPulldownDao(PulldownDao pulldownDao) {
		this.pulldownDao = pulldownDao;
	}

	public Map<String, String> getLanguagesMap() {
		return languagesMap;
	}
	
}
