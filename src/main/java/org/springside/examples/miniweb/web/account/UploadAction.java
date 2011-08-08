package org.springside.examples.miniweb.web.account;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.dao.account.UploadDao;
import org.springside.examples.miniweb.service.ServiceException;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 新闻Action
 * @author roy
 *
 */
@Namespace("/account")
//定义名为reload的result重定向到order.action, 其他result则按照convention默认.
public class UploadAction extends ActionSupport {
	private static final long serialVersionUID = 3593331645711019058L;
	protected Logger logger = LoggerFactory.getLogger(getClass());
	private UploadDao uploadDao;
	private Long id;

	@Autowired
	public void setUploadDao(UploadDao uploadDao) {
		this.uploadDao = uploadDao;
	}

	public UploadDao getUploadDao() {
		return uploadDao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Transactional
	public String delete() throws Exception {
		String result = "";
		try {
			uploadDao.delete(id);
			result = "success";
		} catch (ServiceException e) {
			logger.error(e.getMessage(), e);
			result = e.getMessage();
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//直接输入响应的内容    
		out.println(result);
		return null;
	}
}
