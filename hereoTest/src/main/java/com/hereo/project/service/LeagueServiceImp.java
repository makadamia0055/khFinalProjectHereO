package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDao;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;

@Service
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
