package org.springside.examples.miniweb.dao.account;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Mapping;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class MappingDao extends HibernateDao<Mapping, Long> {

	public List<String> selectSidList(String kfid) {
		List sidList = new ArrayList<String>();
		List<Mapping> mappingList = this.find("from Mapping where kfid = ?", kfid);
		for (Mapping mapping : mappingList) {
			sidList.add(mapping.getSid());
		}
		return sidList;
	}

	public Mapping selectMappingByKfidAndSid(String kfid, String sid) {
		List<Mapping> list = this.find("from Mapping where kfid = ? and sid = ?", kfid, sid);
		if (list.size() > 0) {
			return (Mapping) list.get(0);
		} else {
			return null;
		}

	}

	public Mapping selectMappingByCidAndKfid(String cid, String kfid) {
		List<Mapping> list = this.find("from Mapping where cid = ? and kfid = ?", cid, kfid);
		if (list.size() > 0) {
			return (Mapping) list.get(0);
		} else {
			return null;
		}

	}
}
