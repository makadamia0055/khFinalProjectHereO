package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchLineUpVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;


@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord() {

		return recordDao.selectAllHitRecord();
	}

	@Override
	public MatchRecordVO selectMatchRecordByMrNum(int mr_num) {
		return recordDao.selectMatchRecordByMrNum(mr_num);
	}

	@Override
	public ArrayList<MatchParticipateVO> selectMatchPartInHome(int mr_num) {
		return recordDao.selectMatchPartInHome(mr_num);
	}

	@Override
	public ArrayList<MatchParticipateVO> selectMatchPartInAway(int mr_num) {
		return recordDao.selectMatchPartInAway(mr_num);
	}

	@Override
	public PlayerRecordHitterVO selectPlayerRecordHitterByTpNumAndMrNum(Integer tp_num, Integer mr_num) {
		if(tp_num==null||mr_num==null||tp_num<1||mr_num<1)
			return null;
		return recordDao.selectPlayerRecordHitterByTpNumAndMrNum(tp_num, mr_num);
	}

	@Override
	public PlayerRecordHitterVO selectPlayerRecordPitcherByTpNumAndMrNum(Integer tp_num, Integer mr_num) {
		if(tp_num==null||mr_num==null||tp_num<1||mr_num<1)
			return null;
		return recordDao.selectPlayerRecordPitcherByTpNumAndMrNum(tp_num, mr_num);

		
	}

	@Override
		return recordDao.getAllBatterBoxEventList();
	}

	@Override
	public MatchRecordVO selectMatchRecordByMsNum(int ms_num) {
		return recordDao.selectMatchRecordByMsNum(ms_num);
	}

	
	

		return recordDao.selectLeagueHitRecord(mr.getMr_num());
	public ArrayList<BatterBoxEventVO> getAllBatterBoxEventList() {
}
