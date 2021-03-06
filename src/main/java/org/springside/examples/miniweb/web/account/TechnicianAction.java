package org.springside.examples.miniweb.web.account;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.common.Lan;
import org.springside.examples.miniweb.common.PulldownUtil;
import org.springside.examples.miniweb.dao.account.PulldownDao;
import org.springside.examples.miniweb.dao.account.TechnicianDao;
import org.springside.examples.miniweb.dao.account.UploadFile;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.entity.account.WeekWork;
import org.springside.examples.miniweb.service.ServiceException;
import org.springside.examples.miniweb.service.account.UploadService;
import org.springside.examples.miniweb.web.CrudActionSupport;
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
// 定义URL映射对应/account/Technician.action
@Namespace("/account")
// 定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({ @Result(name = CrudActionSupport.RELOAD, location = "technician.anmo", type = "redirect") })
@Action(interceptorRefs = { @InterceptorRef("fileUploadStack"), @InterceptorRef("defaultStack") })
public class TechnicianAction extends CrudActionSupport<Technician> {

	private static final long serialVersionUID = -2902701210829184452L;

	private TechnicianDao technicianDao;
	private PulldownDao pulldownDao;

	private UploadService uploadService;

	// -- 页面属性 --//
	private Long id;
	private Technician entity;
	private Page<Technician> page = new Page<Technician>(10);// 每页5条记录
	private List<String> checkedLanguages = Lists.newArrayList();
	private Map<String, String> genderMap = ImmutableMap.of("men", "男", "women", "女");
	private int thisyear;

	private Map<String, String> provinceMap;
	private Map<String, String> workTimeMap;
	private Map<String, String> workStatusMap;

	private List<UploadFile> uploadFile = Lists.newArrayList();
	//private List<File> upload = new ArrayList<File>();
	//private List<String> uploadFileName = new ArrayList<String>();

	private List<WeekWork> weekWorkList = new ArrayList<WeekWork>(7);

	// -- ModelDriven 与 Preparable函数 --//
	public void setId(Long id) {
		this.id = id;
	}

	public Technician getModel() {
		return entity;
	}

	private void initPulldown() {
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
		if (entity.getLanguages() != null) {
			String[] arrays = entity.getLanguages().split(",");
			for (String str : arrays) {
				checkedLanguages.add(str.trim());
			}
		}

		if (entity.getWeekWorkList().size() == 0) {
			for (int i = 0; i < 7; i++) {
				WeekWork weekWork = new WeekWork();
				weekWork.setWeekno("week" + (i + 1));
				weekWork.setStatus("work");
				weekWork.setStarttime("1200");
				weekWork.setEndtime("2600");
				entity.getWeekWorkList().add(weekWork);
			}
		}
		return INPUT;
	}

	@Override
	@Transactional
	public String save() throws Exception {
		// 根据页面上的checkbox选择 整合User的Roles Set
		entity.setLanguages(this.checkedLanguages.toString().replace("[", "").replace("]", "").replace(" ", ""));

		for (WeekWork weekWork : entity.getWeekWorkList()) {
			weekWork.setTechnician(entity);
		}

		String uploadDir = ServletActionContext.getServletContext().getRealPath("/upload");

		entity.setUploadList(uploadService.uploadFiles(uploadFile, uploadDir, entity));

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

	@Autowired
	public void setPulldownDao(PulldownDao pulldownDao) {
		this.pulldownDao = pulldownDao;
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

	@Override
	public PulldownDao getPulldownDao() {
		return pulldownDao;
	}

	public Map<String, String> getProvinceMap() {
		return provinceMap;
	}

	public Map<String, String> getWorkTimeMap() {
		return workTimeMap;
	}

	public Map<String, String> getWorkStatusMap() {
		return workStatusMap;
	}

	public List<WeekWork> getWeekWorkList() {
		return weekWorkList;
	}

	public void setWeekWorkList(List<WeekWork> weekWorkList) {
		this.weekWorkList = weekWorkList;
	}

	public UploadService getUploadService() {
		return uploadService;
	}

	@Autowired
	public void setUploadService(UploadService uploadService) {
		this.uploadService = uploadService;
	}

	public List<UploadFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<UploadFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

}
