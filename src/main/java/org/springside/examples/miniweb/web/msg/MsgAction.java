package org.springside.examples.miniweb.web.msg;

import java.util.List;
import java.util.Observable;
import java.util.Observer;
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
import org.springside.examples.miniweb.webqq.ServerQQ;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/msg")
public class MsgAction extends ActionSupport implements Observer{
	@Autowired
	private MappingDao mappingDao;
	@Autowired
	private MsglogDao msglogDao;
	private Random random = new Random();
	private List<String> sidAllList = Lists.newArrayList("1917842895");
	@Autowired
	private ServerQQ serverQQ;
	
	private String cid;
	private Msglog fromMsglog;
	private boolean hasFromMsglog = false;
	
	@Transactional
	public String execute() {
		
		serverQQ.addObserver(this);
		String fromMsg = "";
		// 客服端ID
		cid = Struts2Utils.getParameter("cid");
		// 客服ID
		String kfid = Struts2Utils.getParameter("kfid");
		// 消息
		String msg = Struts2Utils.getParameter("msg");

		Log.info("cid:" + cid);
		Log.info("kfid:" + kfid);
		Log.info("msg:" + msg);

		if (StringUtils.isNotBlank(msg)) {
			String sid = save(cid, kfid, msg);
			Struts2Utils.renderText("", "encoding:UTF-8");
			serverQQ.deleteObserver(this);
			return null;
		} else {
			for(int i=0; i<10; i++){
				if(hasFromMsglog){
					Struts2Utils.renderText(fromMsglog.getMsg(), "encoding:UTF-8");
					hasFromMsglog = false;
					serverQQ.deleteObserver(this);
					return null;
				}
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
			}
			Struts2Utils.renderText("", "encoding:UTF-8");
			serverQQ.deleteObserver(this);
			return null;
			
//			// comet
//			Mapping mapping = mappingDao.selectMappingByCidAndKfid(cid, kfid);
//			if (mapping == null) {
//				try {
//					Thread.sleep(2000);
//				} catch (InterruptedException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			} else {
//				
//				List<Msglog> msglogList = msglogDao.selectFromMessage(mapping.getSid());
//				if (msglogList.size() > 0) {
//					// send message to customer
//					for (Msglog msglog : msglogList) {
//						msglog.setFlag("1");
//						msglogDao.save(msglog);
//						// send message to server
//						fromMsg = fromMsg + msglog.getMsg() + "<br>";
//					}
//
//				} else {
//						Thread.yield();
//				}
//			}

		}
		
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

	
	public ServerQQ getServerQQ() {
		return serverQQ;
	}

	public void setServerQQ(ServerQQ serverQQ) {
		this.serverQQ = serverQQ;
	}

	@Override
	public void update(Observable o, Object arg) {
		if(arg != null && arg instanceof Msglog){
			Msglog msglog = (Msglog)arg;
			if(msglog.getMapping().getCid().equals(cid)){
				fromMsglog = msglog;
				hasFromMsglog = true;
				Log.info("msglog:" + msglog.toString());
			}
		}
		
	}

}
