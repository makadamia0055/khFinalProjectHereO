package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.vo.LeagueMatchListVO;
import com.hereo.project.vo.MatchRecordVO;
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
	public ArrayList<PlayerRecordHitterVO> getSelectLeagueHitRecord(int lg_num) {
		LeagueMatchListVO lm = leagueDao.selectLeagueMatchLgNum(1);
		MatchRecordVO mr = recordDao.selectMatchNum(lm.getLm_mr_num());
		
		return recordDao.selectLeagueHitRecord(mr.getMr_num());
	}
	
}
