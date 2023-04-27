package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;


@Service
public class LeagueServiceImp implements LeagueService {
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public int countLeague(String state, Criteria cri) {
		return leagueDao.countAllleague(state,cri);
	}

	@Override
	public ArrayList<LeagueVO> selectLeaguesByCriAndState(String state, Criteria cri) {
		return leagueDao.selectLeaguesByCriAndState(state, cri);
	}

	@Override
	public Object countLeagueMember(int lg_num) {
		// TODO Auto-generated method stub
		return null;
	}
}
