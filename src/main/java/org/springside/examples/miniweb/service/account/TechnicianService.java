package org.springside.examples.miniweb.service.account;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.dao.account.WeekWorkDao;
import org.springside.examples.miniweb.dao.account.WorkEventDao;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.entity.account.WeekWork;
import org.springside.examples.miniweb.entity.account.WorkEvent;

import com.google.common.collect.Lists;

@Component
public class TechnicianService {
	private static Logger logger = LoggerFactory.getLogger(TechnicianService.class);
	
	private WeekWorkDao weekWorkDao;
	private WorkEventDao workEventDao;
	
	
	public WorkEventDao getWorkEventDao() {
		return workEventDao;
	}
	@Autowired
	public void setWorkEventDao(WorkEventDao workEventDao) {
		this.workEventDao = workEventDao;
	}

	public WeekWorkDao getWeekWorkDao() {
		return weekWorkDao;
	}

	@Autowired
	public void setWeekWorkDao(WeekWorkDao weekWorkDao) {
		this.weekWorkDao = weekWorkDao;
	}


	public void putWorkEvent2WeekWork(Technician entity) {
		List<WeekWork> weekWorkList = entity.getWeekWorkList();
		List<WorkEvent> workEventList = workEventDao.getWeeklyWorkEventList(new Date());
		
		for(WorkEvent workEvent : workEventList){
			
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(workEvent.getEventdate());
			int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
			
			WeekWork weekWork = weekWorkList.get(i);
			
			weekWork.setStatus(workEvent.getStatus());
			weekWork.setStarttime(workEvent.getStarttime());
			weekWork.setEndtime(workEvent.getEndtime());
		}
	}
	
	public void reListWeekWork(Technician entity){
		List<WeekWork> weekWorkList = entity.getWeekWorkList();
		Date truncatedNowDate = DateUtils.truncate(new Date(), Calendar.DAY_OF_MONTH);
		Date startDate = DateUtils.addDays(truncatedNowDate, -1);
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(startDate);
		int day = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		List<WeekWork> reListedweekWorkList = Lists.newArrayList();
		for(int i = day; i<=6; i++ ){
			reListedweekWorkList.add(weekWorkList.get(i));
		}
		for(int i = 0; i<day; i++ ){
			reListedweekWorkList.add(weekWorkList.get(i));
		}
		
		int addDay = 0;
		for(WeekWork weekWork : reListedweekWorkList){
			weekWork.setDay(DateUtils.addDays(startDate, addDay));
			addDay ++;
		}
		
		entity.setWeekWorkList(reListedweekWorkList);
	}
}
