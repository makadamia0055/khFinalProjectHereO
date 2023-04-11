package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.dao.LeagueDao;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;

public class LeagueServiceImp implements LeagueService {
	LeagueDao leagueDao;
	
	@Override
	public ArrayList<LeagueAttributeVO> getLeagueAttribute(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return leagueDao.selectLeagueAttribute(cri);
	}

	@Override
	public int getTotalCountLeagueParticipationteam(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return leagueDao.selectTotalCountBoard(cri);
	}

}
