package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LineUpDAO;
import com.hereo.project.vo.MatchLineUpVO;

@Service
public class LineUpServiceImp implements LineUpService {
	@Autowired
	LineUpDAO lineUpDao;
	@Autowired
	ScheduleService scheduleService;
	
	@Override
	public int insertMatchLineUp(ArrayList<MatchLineUpVO> lineupList) {
		if(lineupList == null)
			return 0;
		
//		트랜잭션 만들면 좋은데..
//		컬랙션 매핑 기능으로 구현? 일단 ㄴ
		int ms_num = lineupList.get(0).getMl_ms_num();
		int res = 1;
		for(MatchLineUpVO tmp :lineupList){
			if(lineUpDao.insertMatchLineUp(tmp)==0)
				res = 0;
		}
		
		return res;
	}

	@Override
	public ArrayList<MatchLineUpVO> selectLineUpByTmNumAndMsNum(Integer teamNum, Integer ms_num) {
		if(ms_num==null||scheduleService.selectMatchScheduleByMsNum(ms_num)==null)
			return null;
		return lineUpDao.selectLineUpByTmNumAndMsNum(teamNum, ms_num);
	}
	
	@Override
	public ArrayList<MatchLineUpVO> selectLineUpByMsNum(Integer ms_num) {
		if(ms_num==null||scheduleService.selectMatchScheduleByMsNum(ms_num)==null)
			return null;
		return lineUpDao.selectLineUpByMsNum(ms_num);
	}

	@Override
	public void deleteLineUpByTmNumAndMsNum(Integer teamNum, Integer ms_num) {
		if(teamNum==null||teamNum==0||ms_num==null||ms_num==0)
			return;
		lineUpDao.deleteLineUpByTmNumAndMsNum(teamNum, ms_num);
	}

	@Override
	public ArrayList<MatchLineUpVO> selectLineUpOfMatchHome(Integer ms_num) {
		if(ms_num==null)
			return null;
		return lineUpDao.selectLineUpOfMatchHome(ms_num);
	}

	@Override
	public ArrayList<MatchLineUpVO> selectLineUpOfMatchAway(Integer ms_num) {
		if(ms_num==null)
			return null;
		return lineUpDao.selectLineUpOfMatchAway(ms_num);
	}
	
}
