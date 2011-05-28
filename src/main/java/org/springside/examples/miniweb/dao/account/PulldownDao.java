package org.springside.examples.miniweb.dao.account;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Pulldown;
import org.springside.modules.orm.hibernate.HibernateDao;
@Component
public class PulldownDao extends HibernateDao<Pulldown, Long>{

	public List<Pulldown> getProvinces(String type, String lan){
		Object[] objects = {type, lan};
		return this.find("from Pulldown where type = ? and lan = ?", objects);
	}
}
