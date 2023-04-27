package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
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
	public ArrayList<LeagueVO> selectLeagueByLgNum(int lg_num) {
		return leagueDao.selectLeagueByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(int lg_num) {
		return leagueDao.selectLeagueAttByLgNum(lg_num);
	}

	@Override
	public ArrayList<LeagueScheduleVO> selectLeagueSchedule(int lg_num) {
		return leagueDao.selectLeagueSchedule(lg_num);
	}

}
