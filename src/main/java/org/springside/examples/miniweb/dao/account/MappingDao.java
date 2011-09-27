package org.springside.examples.miniweb.dao.account;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Mapping;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class MappingDao extends HibernateDao<Mapping, Long> {

	public List<String> getSidList(String cid, String kfid){
		List sidList = new ArrayList<String>();
		List<Mapping> mappingList =  this.find("from Mapping where cid = ? and kfid = ?", cid, kfid);
		for(Mapping mapping : mappingList){
			sidList.add(mapping.getSid());
		}
		return sidList;
	}
}
