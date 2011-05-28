package org.springside.examples.miniweb.dao.account;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.OrderInfo;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class OrderInfoDao extends HibernateDao<OrderInfo, Long> {
}
