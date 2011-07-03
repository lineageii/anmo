package org.springside.examples.miniweb.dao.account;

import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.Comment;
import org.springside.modules.orm.hibernate.HibernateDao;

@Component
public class CommentDao extends HibernateDao<Comment, Long> {

}
