package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.ScheduleDAO;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.StadiumVO;

@Service
public class ScheduleServiceImp implements ScheduleService {
	@Autowired
	ScheduleDAO scheduleDao;
	
	@Override
	public ArrayList<MatchScheduleVO> selectTeamScheduleByTeamAfterToday(Integer teamNum) {
		if(teamNum==null||teamNum<1) {
			System.out.println("스케줄 불러오기 실패 : team번호 오류");
			return null;
		}
		ArrayList<MatchScheduleVO> tmpList = scheduleDao.selectTeamScheduleByTeamAfterToday(teamNum);
		
		for(MatchScheduleVO tmp : tmpList) {
			tmp.setMs_stadium(scheduleDao.selectStadiumByRv_Num(tmp.getMs_rv_num()));
		}
		return tmpList;
	}

	@Override
	public MatchScheduleVO selectNextTeamSchedule(Integer teamNum) {
		if(teamNum==null||teamNum<1) {
			System.out.println("스케줄 불러오기 실패 : team번호 오류");
			return null;
		}
		MatchScheduleVO tmp = scheduleDao.selectNextTeamSchedule(teamNum);
		if(tmp!=null) {
			tmp.setMs_stadium(scheduleDao.selectStadiumByRv_Num(tmp.getMs_rv_num()));
		}
		return tmp;
	}
	public StadiumVO selectStadiumByRv_num(int rv_num) {
		if(rv_num<1)
			return null;
		
		return scheduleDao.selectStadiumByRv_Num(rv_num);
	}

	@Override
	public MatchScheduleVO selectMatchScheduleByMsNum(Integer ms_num) {
		if(ms_num==null)
			return null;
		return scheduleDao.selectMatchScheduleByMsNum(ms_num);
	}

	@Override
	public ArrayList<MatchScheduleVO> selectMatchScheduleByTmNum(Integer teamNum) {
		if(teamNum==null||teamNum<1)
			return null;
		return scheduleDao.selectMatchScheduleByTmNum(teamNum);
	}

	
}
