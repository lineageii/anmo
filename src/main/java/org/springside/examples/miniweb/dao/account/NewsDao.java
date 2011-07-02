package org.springside.examples.miniweb.dao.account;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.News;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class NewsDao extends HibernateDao<News, Long> {

}
