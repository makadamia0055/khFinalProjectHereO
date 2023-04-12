package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.TeamBoardDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamBoardServiceImp implements TeamBoardService {
	@Autowired
	TeamBoardDAO teamBoardDao;
	
	@Override
	public ArrayList<BoardVO> selectTeamBoardByTeam(TeamVO team, Criteria cri) {
		if(team==null)
			return null;
		if(cri==null)
			return null;
		
		return teamBoardDao.selectTeamBoardByTeam(team, cri);
	}

	@Override
	public int countTeamBoardTotalCnt(TeamVO team, Criteria cri) {
		if(team==null)
			return 0;
		if(cri==null)
			return 0;
		return teamBoardDao.countTeamBoardTotalCnt(team, cri);
	}

	@Override
	public ArrayList<BoardCategoryVO> selectTeamBoardCategory(TeamVO team) {
		if(team==null)
			return null;
		
		return teamBoardDao.selectTeamBoardCategory(team);
	}

}
