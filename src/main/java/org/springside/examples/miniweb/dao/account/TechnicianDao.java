package org.springside.examples.miniweb.dao.account;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author calvin
 */
@Component
public class TechnicianDao extends HibernateDao<Technician, Long> {
}
