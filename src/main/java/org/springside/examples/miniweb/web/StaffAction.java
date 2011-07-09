package org.springside.examples.miniweb.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.components.File;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.common.Lan;
import org.springside.examples.miniweb.common.PulldownUtil;
import org.springside.examples.miniweb.dao.account.CommentDao;
import org.springside.examples.miniweb.dao.account.PulldownDao;
import org.springside.examples.miniweb.dao.account.TechnicianDao;
import org.springside.examples.miniweb.entity.account.Comment;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.examples.miniweb.service.account.TechnicianService;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;

/**
 * 用户管理Action.
 * 
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 * 
 * @author calvin
 */
// 定义URL映射对应/Staff.action
@Namespace("/")
public class StaffAction extends CrudActionSupport<Technician> {

	private static final long serialVersionUID = -2902701210829184452L;

	private TechnicianService technicianService;
	private TechnicianDao technicianDao;
	private PulldownDao pulldownDao;
	private CommentDao commentDao;
	// -- 页面属性 --//
	private Long id;
	private Technician entity;
	private Page<Technician> page = new Page<Technician>(10);// 每页5条记录
	private Page<Comment> commentPage = new Page<Comment>(10);
	private List<String> checkedLanguages = Lists.newArrayList();
	private Map<String, String> genderMap = ImmutableMap.of("men", "男", "women", "女");
	private int thisyear;
	private Map<String, String> provinceMap;
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadFileNames = new ArrayList<String>();
	private List<String> uploadContentTypes = new ArrayList<String>();

	private Map<String, String> languagesMap = PulldownUtil.getLanguagesMap();

	private Map<String, String> workTimeMap;
	private Map<String, String> workStatusMap;
	
	public TechnicianService getTechnicianService() {
		return technicianService;
	}
	@Autowired
	public void setTechnicianService(TechnicianService technicianService) {
		this.technicianService = technicianService;
	}

	
	public CommentDao getCommentDao() {
		return commentDao;
	}
	@Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	// -- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}

	public Technician getModel() {
		return entity;
	}
	
	private void initPulldown(){
		provinceMap = getProvinceMap(Lan.getLanByLocale(getLocale()));
		workTimeMap = PulldownUtil.getWorkTimeMap(getText("workTimePrex"));
		workStatusMap = PulldownUtil.getWorkStatusMap(getText("work"), getText("rest"));
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = technicianDao.get(id);
		} else {
			entity = new Technician();
		}
	}

	// -- CRUD Action 函数 --//
	@Override
	public String list() throws Exception {
		initPulldown();
		thisyear = Calendar.getInstance().get(Calendar.YEAR);

		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(Struts2Utils.getRequest());
		// 设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = technicianDao.findPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		
		
		initPulldown();
		technicianService.putWorkEvent2WeekWork(entity);
		technicianService.reListWeekWork(entity);
		
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(Struts2Utils.getRequest());
		// 设置默认排序方式
		if (!commentPage.isOrderBySetted()) {
			commentPage.setOrderBy("id");
			commentPage.setOrder(Page.ASC);
		}
		
		commentPage = commentDao.findPage(commentPage, "from Comment where technician.id = ?", id);
//		if (entity.getLanguages() == null)
//			return INPUT;
//		String[] arrays = entity.getLanguages().split(",");
//		for (String str : arrays) {
//			checkedLanguages.add(str.trim());
//		}
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		// 根据页面上的checkbox选择 整合User的Roles Set
		entity.setLanguages(this.checkedLanguages.toString().replace("[", "").replace("]", "").replace(" ", ""));
		technicianDao.save(entity);
		addActionMessage("保存用户成功");
		return RELOAD;
	}

	@Override
	@Transactional
	public String delete() throws Exception {
		try {
			technicianDao.delete(id);
			addActionMessage("删除用户成功");
		} catch (ServiceException e) {
			logger.error(e.getMessage(), e);
			addActionMessage("删除用户失败");
		}
		return RELOAD;
	}

	// -- 页面属性访问函数 --//
	/**
	 * list页面显示用户分页列表.
	 */
	public Page<Technician> getPage() {
		return page;
	}

	@Autowired
	public void setTechnicianDao(TechnicianDao technicianDao) {
		this.technicianDao = technicianDao;
	}

	public List<String> getCheckedLanguages() {
		return checkedLanguages;
	}

	public void setCheckedLanguages(List<String> checkedLanguages) {
		this.checkedLanguages = checkedLanguages;
	}

	public Map<String, String> getGenderMap() {
		return genderMap;
	}

	public void setGenderMap(Map<String, String> genderMap) {
		this.genderMap = genderMap;
	}

	public int getThisyear() {
		return thisyear;
	}

	public List<File> getUploads() {
		return uploads;
	}

	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadFileNames() {
		return uploadFileNames;
	}

	public void setUploadFileNames(List<String> uploadFileNames) {
		this.uploadFileNames = uploadFileNames;
	}

	public List<String> getUploadContentTypes() {
		return uploadContentTypes;
	}

	public void setUploadContentTypes(List<String> uploadContentTypes) {
		this.uploadContentTypes = uploadContentTypes;
	}

	public Map<String, String> getLanguagesMap() {
		return languagesMap;
	}

	public Map<String, String> getProvinceMap() {
		return provinceMap;
	}

	@Override
	public PulldownDao getPulldownDao() {
		return pulldownDao;
	}

	@Autowired
	public void setPulldownDao(PulldownDao pulldownDao) {
		this.pulldownDao = pulldownDao;
	}
	
	
	public Map<String, String> getWorkTimeMap() {
		return workTimeMap;
	}

	public Map<String, String> getWorkStatusMap() {
		return workStatusMap;
	}
	public Page<Comment> getCommentPage() {
		return commentPage;
	}
	public void setCommentPage(Page<Comment> commentPage) {
		this.commentPage = commentPage;
	}
	
	
}
