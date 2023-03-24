package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.TeamDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamServiceImp implements TeamService{
	@Autowired
	TeamDAO teamDao;
	
	@Override
	public ArrayList<TeamVO> selectAllTeams(Criteria cri) {
		return teamDao.selectAllTeams(cri);
	}

	
	@Override
	public TeamVO selectTeamByTm_Num(Integer teamNum) {
		if(teamNum==null||teamNum<0)
			return null;
		return teamDao.selectTeamByTm_num(teamNum);
	}


	@Override
	public int countTeams() {
		return teamDao.countAllTeams();
	}
	
}
