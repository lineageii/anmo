package org.springside.examples.miniweb.webqq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.dao.account.MappingDao;
import org.springside.examples.miniweb.dao.account.MsglogDao;
import org.springside.examples.miniweb.entity.account.Mapping;
import org.springside.examples.miniweb.entity.account.Msglog;

@Component
@Transactional
public class ServerQQ implements Runnable {
	@Autowired
	private MsglogDao msglogDao;
	@Autowired
	private MappingDao mappingDao;

	private SmailImpl smailImpl;

	public SmailImpl getSmailImpl() {
		return smailImpl;
	}

	public void setSmailImpl(SmailImpl smailImpl) {
		this.smailImpl = smailImpl;
	}

	public MsglogDao getMsglogDao() {
		return msglogDao;
	}

	public void setMsglogDao(MsglogDao msglogDao) {
		this.msglogDao = msglogDao;
	}

	public MappingDao getMappingDao() {
		return mappingDao;
	}

	public void setMappingDao(MappingDao mappingDao) {
		this.mappingDao = mappingDao;
	}

	@Override
	public void run() {
		try {

			// get send message from msglog table
			List<Msglog> msglogList = msglogDao.selectToMessage(smailImpl.getId());
			for (Msglog msglog : msglogList) {
				smailImpl.sendSmail(msglog.getMapping().getKfid(), msglog.getMsg());
				msglog.setFlag("1");
				saveMsglog(msglog);
			}

			if (smailImpl.getUnreadCount() > 0) {
				List<GMessage> gmessageList = smailImpl.getMessage();
				System.out.println(gmessageList);

				for (GMessage gGmessage : gmessageList) {
					smailImpl.updateMessage(gGmessage);
				}

				// send message to customer
				for (GMessage gMessage : gmessageList) {
					String kfid = gMessage.getsAddress().replace("@qq.com", "");
					Mapping mapping = mappingDao.selectMappingByKfidAndSid(kfid, smailImpl.getId());
					if (mapping != null) {
						Msglog msglog = new Msglog("f", mapping, gMessage.getsAbstract(), "0");
						saveMsglog(msglog);
					}
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Transactional
	public void saveMsglog(Msglog msglog) {
		msglogDao.save(msglog);
	}
}
