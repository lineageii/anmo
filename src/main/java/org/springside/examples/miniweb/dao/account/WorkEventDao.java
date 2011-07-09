package org.springside.examples.miniweb.dao.account;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.entity.account.WorkEvent;
import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author calvin
 */
@Component
public class WorkEventDao extends HibernateDao<WorkEvent, Long> {
	
	public List<WorkEvent>  getWeeklyWorkEventList(Date nowDate){
		Date truncatedNowDate = DateUtils.truncate(nowDate, Calendar.DAY_OF_MONTH);
		Date startDate = DateUtils.addDays(truncatedNowDate, -1);
		Date endDate = DateUtils.addDays(truncatedNowDate, 6);
		return this.find("from WorkEvent where eventdate >= ?  and eventdate < ?", startDate, endDate);
	}

}
