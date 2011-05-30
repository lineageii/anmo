package org.springside.examples.miniweb.service.account;

import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.entity.account.WeekWork;
import org.springside.examples.miniweb.entity.account.WorkEvent;

@Component
public class TechnicianService {
	private static Logger logger = LoggerFactory.getLogger(TechnicianService.class);

	public void putWorkEvent2WeekWork(Technician entity) {
		List<WeekWork> weekWorkList = entity.getWeekWorkList();
		for(WorkEvent workEvent : entity.getWorkEventList()){
			
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(workEvent.getEventdate());
			int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
			
			WeekWork weekWork = weekWorkList.get(i);
			
			weekWork.setStatus(workEvent.getStatus());
			weekWork.setStarttime(workEvent.getStarttime());
			weekWork.setEndtime(workEvent.getEndtime());
		}
	}
}
