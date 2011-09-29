package org.springside.examples.miniweb.dao.account;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Msglog;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class MsglogDao extends HibernateDao<Msglog, Long> {
	public List<Msglog> selectToMessage(String sid) {
		return this.find("from Msglog where flag <> '1' and type = 't' and mapping.sid = ?", sid);
	}

	public List<Msglog> selectFromMessage(String sid) {
		return this.find("from Msglog where flag <> '1' and type = 'f' and mapping.sid = ?", sid);
	}

}
