package org.springside.examples.miniweb.web.msg;

import java.util.List;
import java.util.Random;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
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
	private List<String> sidAllList = Lists.newArrayList("1917842895");

	@Transactional
	public String execute() {
		String fromMsg = "";
		// 客服端ID
		String cid = Struts2Utils.getParameter("cid");
		// 客服ID
		String kfid = Struts2Utils.getParameter("kfid");
		// 消息
		String msg = Struts2Utils.getParameter("msg");

		Log.info("cid:" + cid);
		Log.info("kfid:" + kfid);
		Log.info("msg:" + msg);

		if (StringUtils.isNotBlank(msg)) {
			String sid = save(cid, kfid, msg);
		} else {
			// comet
			Mapping mapping = mappingDao.selectMappingByCidAndKfid(cid, kfid);
			if (mapping == null) {
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				List<Msglog> msglogList = msglogDao.selectFromMessage(mapping.getSid());
				if (msglogList.size() > 0) {
					// send message to customer
					for (Msglog msglog : msglogList) {
						msglog.setFlag("1");
						msglogDao.save(msglog);
						// send message to server
						fromMsg = fromMsg + msglog.getMsg() + "<br>";
					}

				} else {
					try {
						Thread.sleep(2000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

		}
		Struts2Utils.renderText(fromMsg, "encoding:UTF-8");
		return null;
	}

	@Transactional
	public String save(String cid, String kfid, String msg) {
		Mapping mapping = mappingDao.selectMappingByCidAndKfid(cid, kfid);
		if (mapping == null) {
			// get sid list by cid and kfid from mapping
			List<String> sidList = mappingDao.selectSidList(kfid);
			sidAllList.removeAll(sidList);
			// 取得空闲sid
			String sid = sidAllList.get(random.nextInt(sidAllList.size()));

			// save
			mapping = new Mapping(cid, kfid, sid);
			mappingDao.save(mapping);
		}

		Msglog msglog = new Msglog("t", mapping, msg, "0");
		msglogDao.save(msglog);
		return mapping.getSid();
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
