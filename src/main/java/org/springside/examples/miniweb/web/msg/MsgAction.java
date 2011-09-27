package org.springside.examples.miniweb.web.msg;

import java.util.List;
import java.util.Random;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.examples.miniweb.dao.account.MappingDao;
import org.springside.examples.miniweb.dao.account.MsglogDao;
import org.springside.examples.miniweb.entity.account.Mapping;
import org.springside.examples.miniweb.entity.account.Msglog;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/msg")
public class MsgAction extends ActionSupport {
	@Autowired
	private MappingDao mappingDao;
	@Autowired
	private MsglogDao msglogDao;
	private Random random = new Random();
	List<String> sidAllList = Lists.newArrayList("1","2","3","4");
	public String execute() {
		
		
		String cid = Struts2Utils.getParameter("cid");
		String kfid = Struts2Utils.getParameter("kfid");
		
		String msg = Struts2Utils.getParameter("msg");
		
		if(StringUtils.isNotBlank(msg)){
			String sid = save(cid, kfid, msg);
			// server QQ 侦听 get msg from msglog and send msg to kefu QQ
			// 
		} else {
			// comet
		}
		
		

		
		// send message to server
		Struts2Utils.renderText("1", "encoding:UTF-8");

		return null;
	}
	
	public String save(String cid, String kfid, String msg){
		// get sid list by cid and kfid from mapping
		List<String> sidList = mappingDao.getSidList(cid, kfid);
		sidAllList.removeAll(sidList);
		// 取得空闲sid
		String sid = sidAllList.get(random.nextInt(sidAllList.size()));
		
		
		// save
		Mapping mapping = new Mapping(cid, kfid, sid);
		mappingDao.save(mapping);
		
		Msglog msglog = new Msglog("t", cid, msg, "0");
		msglogDao.save(msglog);
		return sid;
	}

	public MappingDao getMappingDao() {
		return mappingDao;
	}

	public void setMappingDao(MappingDao mappingDao) {
		this.mappingDao = mappingDao;
	}

	public MsglogDao getMsglogDao() {
		return msglogDao;
	}

	public void setMsglogDao(MsglogDao msglogDao) {
		this.msglogDao = msglogDao;
	}

}
